import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shelf/Screens/Login/login_screen.dart';
import 'package:shelf/Screens/Welcome/welcome_screen.dart';
import '../../../constants.dart';

class EventCard extends StatefulWidget {
  @override
  _EventCardState createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
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
    var url = "${baseUrl}api/events/active";
    var response =
        await http.get(Uri.parse(url));
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
        itemBuilder: (context, index) {
          return getCard(events[index]);
        });
  }

  Widget getCard(events) {
    Size size = MediaQuery.of(context).size;
    var title = events['title'] ;
    var date = events['start_datetime'];
    var description = events['short_description'];
    var image = "http://ec2-3-22-186-17.us-east-2.compute.amazonaws.com/"+events['poster'];
    return GestureDetector(
      onTap: (){print("object"); },
      child :Container(
      width: size.width * .85,
      height: size.height * .42,
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
              height: 175,
              decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      fit: BoxFit.fill, image: NetworkImage(image))),
              child: Container(
                  margin: EdgeInsets.all(15),
                  alignment: Alignment.bottomLeft,
                  child: Text(title,
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
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
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
