import 'package:flutter/cupertino.dart';
import 'package:shelf/Screens/AttendenceEvent/components/AttendanceEventsCard.dart';

import 'package:shelf/components/custom_menu_bar.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      child: //Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          //children: [
          ListView(
        physics: ScrollPhysics(),
        scrollDirection: Axis.vertical,
        children: <Widget>[
          SizedBox(height: size.height * 0.04),
          CustomMenuBar(text: "Attendence Open"),
          SizedBox(height: size.height * 0.02),
          AttendanceEventCard(),
          SizedBox(height: size.height * 0.02),
        ],
      ),
    );
  }
}
