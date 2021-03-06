import 'package:shelf/Screens/Home/components/isAdminFeatures.dart';
import 'package:shelf/size_config.dart';

import 'eventcard.dart';

import 'topbar.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
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
          TopBox(),
          SizedBox(height: size.height * 0.04),
          HomeAdminFeatures(),

          SizedBox(height: size.height * 0.02),

          EventCard(),
          SizedBox(height: size.height * 0.04),

          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Container(
          //       width: size.width * .4,
          //       height: 40,
          //       margin: EdgeInsets.symmetric(vertical: 0, horizontal: 30),
          //       decoration: BoxDecoration(
          //           color: Colors.lightBlueAccent,
          //           borderRadius: BorderRadiusDirectional.circular(18)),
          //       child: Center(
          //         child: TextButton(
          //           onPressed: () {},
          //           child: Text(
          //             "Show More Events",
          //             style: TextStyle(
          //                 fontSize: 13,
          //                 fontWeight: FontWeight.bold,
          //                 color: Colors.black),
          //           ),
          //         ),
          //       ),
          //     )
          //   ],
          // ),
          //SizedBox(height: size.height * 0.04),
        ],
      ),
      //  ],
      //)
    );
  }
}
