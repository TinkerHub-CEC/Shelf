
import 'package:flutter/cupertino.dart';
import 'package:shelf/Screens/AttendenceEvent/AttendanceEventsPage.dart';
import 'package:shelf/Screens/AttendenceEventAdmin/AttendanceEventsPage.dart';
import 'package:shelf/Screens/CreateEvent/CreateEvent.dart';
import 'package:shelf/Screens/RegisteredEventsPage/components/registeredeventcard.dart';
import 'package:shelf/Screens/Login/login_screen.dart';
import 'package:shelf/Screens/Signup/signup_screen.dart';
import 'package:shelf/components/custom_menu_bar.dart';
import 'package:flutter/material.dart';
import 'package:shelf/components/rounded_button.dart';

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
          CustomMenuBar(text: "Events"),
          //SizedBox(height: size.height * 0.000001),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
             mainAxisAlignment: MainAxisAlignment.center,
              children:
              [
                Container(
                  height: size.height*0.16,
                  width: size.width*.6,
                  child: Center(
                    child:RoundedButton(text: "Attendance Page", press:(){
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                            builder: (BuildContext context) => new AttendanceEventsPage(),
                          ));
                    },),
                  ),)
              ]),

          Row(
              mainAxisAlignment: MainAxisAlignment.center,
            children:
            [
              Container(
              height: size.height*0.05,
              width: size.width*.5,
            //color: Colors.red,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xffE1E8E8)),
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(40),
                ),
            child: Center(
              child:Text("Registered Events",
                style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),),
          ),)
          ]),
          SizedBox(height: size.height * 0.04),
          //SizedBox(height: size.height * 0.02),
          RegEventCard(),
          SizedBox(height: size.height * 0.04),
        ],
      ),

    );
  }
}
