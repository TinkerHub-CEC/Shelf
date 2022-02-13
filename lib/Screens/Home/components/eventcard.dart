// ignore_for_file: unused_import, unused_local_variable, duplicate_ignore

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shelf/Api/api.dart';
import 'package:shelf/Screens/EventsDetailsPage/event_screen.dart';
import 'package:shelf/Screens/Login/login_screen.dart';
import 'package:shelf/providers/login_auth.dart';
import 'package:shelf/providers/session_timedout.dart';
import 'package:shelf/size_config.dart';
import '../../../constants.dart';
import 'package:intl/intl.dart';

class EventCard extends StatefulWidget {
  @override
  _EventCardState createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  int i = 0;
  List events = [];
  bool isLoading = false;
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    this.fetchEvents();
  }

  fetchEvents() async {
    setState(() {
      isLoading = true;
    });

    final url = Uri.parse("$baseUrl/api/events/");
    final data = await getData('auth_data');
    final token = await getData('token');
    http.Response response = await http.get(
      url,
      headers: {HttpHeaders.authorizationHeader: 'Bearer ' + data!},
    );
    //var response = await http.get(Uri.parse(url));

    print(response.body);
    print("Home Events Status Code:${response.statusCode}");
    if (response.statusCode == 200) {
      var extractData = json.decode(response.body);
      events = extractData;
      //print(events[1]["title"]);
      setState(() {
        isLoading = false;
      });
    } else if (response.statusCode == 401) {
      setState(() async {
        sessionTimeOut(context);
      });
    } else {
      events = [];
      isLoading = false;
    }
  }

  @override
  void dispose() {
    // ignore: todo
    // TODO: implement dispose
    super.dispose();
    this.fetchEvents();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [getBody()],
    );
  }

  Widget getBody() {
    if (events.contains(null) || events.length < 0 || isLoading) {
      return Center(
          child: CircularProgressIndicator(
        valueColor: new AlwaysStoppedAnimation<Color>(kPrimaryColor),
      ));
    }
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: events.length,
        itemBuilder: (context, i) {
          return getCard(events[i]);
        });
  }

  Widget getCard(events) {
    print(events);
    SizeConfig().init(context);
    Size size = MediaQuery.of(context).size;
    // ignore: unused_local_variable
    var outputFormat = DateFormat('dd/MM/yyyy');
    var id = events['id'];
    var title = events['title'];
    var datetime = events['start_datetime'];
    String date = datetime.substring(0, 10);
    date = outputFormat.format(DateTime.parse(date));
    var description = events['short_description'];
    var image = events['poster'];
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            new MaterialPageRoute(
              builder: (BuildContext context) => new EventScreen(events),
            ));
      },
      child: Container(
        width: size.width * .85,
        margin: EdgeInsets.symmetric(
            vertical: 10, horizontal: SizeConfig.blockSizeHorizontal * 7.5),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  blurRadius: 10,
                  offset: const Offset(0, 0),
                  spreadRadius: 5,
                  color: Colors.black12)
            ]),
        child: ListTile(
          minVerticalPadding: 0,
          contentPadding: EdgeInsets.zero,
          title: Column(
            children: <Widget>[
              Container(
                width: size.width * .88,
                height: size.height * .35,
                decoration: BoxDecoration(
                    color: Colors.grey[600],
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.5), BlendMode.srcATop),
                        fit: BoxFit.scaleDown,
                        image: NetworkImage(image))),
                child: Container(
                    margin: EdgeInsets.all(15),
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      title,
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: <Widget>[
                  // SizedBox(
                  //   width: size.width * .80,
                  // ),
                  Row(
                    children: <Widget>[
                      Flexible(
                          child: Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: SizeConfig.blockSizeHorizontal * 2.5),
                        child:
                            Text(description, style: TextStyle(fontSize: 14)),
                      )),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        bottom: SizeConfig.blockSizeVertical * 2),
                    child: SizedBox(
                      width: size.width * .80,
                      child: Text(
                        date.toString(),
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
