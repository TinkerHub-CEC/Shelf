import 'dart:convert';
import 'package:flutter/rendering.dart';

import '../../../constants.dart';
import 'topbar.dart';
import 'package:shelf/components/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class Body extends StatefulWidget {
  final String Id ;
  Body({
    Key? key,
    required this.Id,
  }) : super(key: key);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List events = [];
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.fetchEvents();
  }

  fetchEvents() async {
    setState(() {
      isLoading = true;
    });
    var url = "${baseUrl}/api/events/active";
    var response = await http.get(Uri.parse(url));
    print(response.body);
    if (response.statusCode == 200) {
      events = json.decode(response.body);
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
      children: [ Expanded(
          child: getBody()
      ),
  ]  );
  }

  Widget getBody() {
    if (events.contains(null) || events.length < 0 || isLoading) {
      return Center(
          child: CircularProgressIndicator(
            valueColor: new AlwaysStoppedAnimation<Color>(kPrimaryColor),
          ));
    }
    return ListView.builder(
        physics: ScrollPhysics(),
        shrinkWrap: true,
        itemCount: events.length,
        itemBuilder: (context, index) {
          return getEvent(events[index]);
        });
  }

  Widget getEvent(events) {
    Size size = MediaQuery.of(context).size;
    var id = events['id'];
    var title = events['title'];
    var datetime = events['start_datetime'];
    var location = events['location'];
    var description = events['long_description'];
    var image = "$baseUrl" + events['poster'];
    return Container(
        child: Column(
          children: <Widget>[
            SizedBox(height: size.height * 0.04),
            TopBox(),
        Container(
              width: size.width*.88,
              height: size.height*.41,
              margin: EdgeInsets.symmetric(
                vertical: 22,),
                 decoration : BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                   image: DecorationImage(
                       fit: BoxFit.fill, image: NetworkImage(image, ))
                  ),
              //child: Image.network(image,fit: BoxFit.fill,),
              ),
            Container(
              child: Text(
                title,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              width: size.width * 0.88,
              height: size.width * 0.07,
            ),
            Container(
              margin: EdgeInsets.symmetric(
                vertical: 13,
              ),
              child: Text(
                description,
                style: TextStyle(
                  fontSize: 16.8,
                ),
                textAlign: TextAlign.justify,

              ),
              width: size.width * 0.88,
              height: size.width * 0.25,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 6,
                horizontal: 18,
              ),
              margin: EdgeInsets.only(
                top: 22,
              ),
              width: size.width * 0.88,
              height: size.width * 0.07,
              child: Text(
                datetime,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 6,
                horizontal: 18,
              ),
              width: size.width * 0.88,
              height: size.width * 0.07,
              child: Text(
                datetime,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 6,
                horizontal: 18,
              ),
              width: size.width * 0.88,
              height: size.width * 0.07,
              child: Text(
                location,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(height: size.height * 0.06),
            RoundedButton(text: "Register", press: () => {}),
          ],
        ),
      );
    }
  }
