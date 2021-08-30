import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shelf/Screens/EventsDetailsPage/event_screen.dart';
import '../../../constants.dart';

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
    var url = "$baseUrl/api/events/active/all";
    var response = await http.get(Uri.parse(url));
    //print(response.body);
    if (response.statusCode == 200) {
      var extractdata = json.decode(response.body);
      events = extractdata;
      //print(events[1]["title"]);
      setState(() {
        isLoading = false;
      });
    } else {
      events = [];
      isLoading = false;
    }
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
    Size size = MediaQuery.of(context).size;
    // ignore: unused_local_variable
    var id = events['id'];
    var title = events['title'];
    var datetime = events['start_datetime'];
    String date = datetime.substring(0, 10);
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
        height: size.height * .55,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
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
                        fit: BoxFit.scaleDown, image: NetworkImage(image))),
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
                  SizedBox(
                    width: size.width * .80,
                    height: size.height * .07,
                    child: Text(description, style: TextStyle(fontSize: 14)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: size.width * .80,
                    height: size.height * .05,
                    child: Text(
                      date.toString(),
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
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
