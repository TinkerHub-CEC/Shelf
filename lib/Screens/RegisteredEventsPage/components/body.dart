import 'package:shelf/Screens/AttendenceEvent/AttendanceEventsPage.dart';
import 'package:shelf/Screens/RegisteredEventsPage/components/registeredeventcard.dart';
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
          CustomMenuBar(text: "Events"),
          //SizedBox(height: size.height * 0.000001),
          SizedBox(height: size.height * 0.02),
          Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Color(0xff385A64),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0))),
                      fixedSize: Size(250, 34)),
                  child: Text('Attendance Page',
                      style: TextStyle(
                        color: Colors.white,
                      )),
                  onPressed: () {
                    Navigator.push(
                      context,
                      new MaterialPageRoute(
                        builder: (BuildContext context) =>
                            new AttendanceEventsPage(),
                      ),
                    );
                  },
                )
              ]),
          SizedBox(height: size.height * 0.02),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              height: size.height * 0.05,
              width: size.width * .5,
              //color: Colors.red,

              child: Center(
                child: Text(
                  "Registered Events",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            )
          ]),
          SizedBox(height: size.height * 0.02),
          //SizedBox(height: size.height * 0.02),
          RegEventCard(),
          SizedBox(height: size.height * 0.04),
        ],
      ),
    );
  }
}
