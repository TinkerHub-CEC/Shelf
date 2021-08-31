import 'package:shelf/Screens/Home/components/eventcard.dart';
import 'package:shelf/Screens/Login/login_screen.dart';
import 'package:shelf/Screens/Signup/signup_screen.dart';
import 'package:shelf/components/custom_menu_bar.dart';

import 'package:shelf/constants.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
          CustomMenuBar(text: "Registered Events"),
          SizedBox(height: size.height * 0.04),
          SizedBox(height: size.height * 0.02),
          EventCard(),
          SizedBox(height: size.height * 0.04),

        ],
      ),

    );
  }
}
