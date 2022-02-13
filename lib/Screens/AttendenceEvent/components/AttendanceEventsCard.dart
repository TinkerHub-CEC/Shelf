import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shelf/Api/api.dart';
import 'package:shelf/Screens/EventsDetailsPage/event_screen.dart';
import 'package:shelf/Screens/SubmitAttendance/submitAttendance.dart';
import 'package:shelf/providers/login_auth.dart';
import 'package:shelf/providers/session_timedout.dart';
import '../../../constants.dart';
import 'package:shelf/Screens/Upload Image/uploadImage.dart';

import '../../../size_config.dart';

class AttendanceEventCard extends StatefulWidget {
  @override
  _AttendanceEventCardState createState() => _AttendanceEventCardState();
}

class _AttendanceEventCardState extends State<AttendanceEventCard> {
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
    var UserId = await getValue('auth_user_id');
    print(UserId);
    final url = Uri.parse('$baseUrl/api/events/active/with_attendance');
    final data = await getData('auth_data');
    final token = await getData('token');
    http.Response response = await http.get(
      url,
      headers: {HttpHeaders.authorizationHeader: 'Bearer ' + data!},
    );
    //var response = await http.get(Uri.parse(url));

    print(response.body);
    print("Attendance Events Card Status Code: ${response.statusCode}");
    if (response.statusCode == 200) {
      var extractData = json.decode(response.body);
      events = extractData;
      //print(events[1]["title"]);
      setState(() {
        isLoading = false;
      });
    } else if (response.statusCode == 401) {
      sessionTimeOut(context);
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
    SizeConfig().init(context);
    print(events);
    Size size = MediaQuery.of(context).size;
    var id = events['id'];
    var title = events['title'];
    //var datetime = events['start_datetime'];
    //String date = datetime.substring(0, 10);
    //var description = events['short_description'];
    var image = events['poster'];
    var method = events['attendance_method'];
    return GestureDetector(
        onTap: () {
          AttendanceMethod() async {
            if (method == 1) {
              return Navigator.push(
                  context,
                  new MaterialPageRoute(
                    builder: (BuildContext context) =>
                        new submitAttendance(events),
                  ));
            }
            return Navigator.push(
                context,
                new MaterialPageRoute(
                  builder: (BuildContext context) => new uploadImage(events),
                ));
          }

          AttendanceMethod();
        },
        child: Container(
          width: size.width * .80,
          height: size.height * .12,
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black),
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
            title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                      width: size.height * .12,
                      height: size.height * .12,
                      decoration: BoxDecoration(
                        color: Colors.grey[600],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image(
                              fit: BoxFit.fill, image: NetworkImage(image)))),
                  SizedBox(
                    width: size.width * 0.04,
                  ),
                  Container(
                      width: size.width * .43,
                      // color: Colors.grey,
                      //margin: EdgeInsets.all(15),
                      //alignment: Alignment.center,
                      child: Text(
                        title,
                        style: TextStyle(
                            fontSize: SizeConfig.safeBlockHorizontal * 4,
                            //color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )),
                  //Container(
                  //  width: size.width * .08,
                  //  height: size.width * .08,
                  //  margin: EdgeInsets.symmetric(vertical: 10),
                  // decoration: BoxDecoration(
                  //   color: Colors.white,
                  //   border: Border.all(color: Colors.black),
                  //  borderRadius: BorderRadius.circular(100),
                  //),
                  //  child: Icon(Icons.arrow_forward_outlined),
                  // ),
                ]),
          ),
        ));
  }
}
