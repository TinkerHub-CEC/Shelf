//import 'dart:html';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:shelf/Screens/EventsPage/components/topbar.dart';
import 'package:shelf/Screens/EventsPage/event_screen.dart';
import 'package:shelf/components/rounded_button.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';


class Body extends StatelessWidget {
  final events;
  Body(this.events);


  @override
  Widget build(BuildContext context) {
    print(events);
    Size size = MediaQuery.of(context).size;
    var title = events['title'];
    var sdatetime = events['start_datetime'];
    String sdate = sdatetime.substring(0,10);
    String stime = sdatetime.substring(11,16);
    var edatetime = events['end_datetime'];
    String edate = edatetime.substring(0,10);
    String etime = sdatetime.substring(11,16);
    var description = events['long_description'];
    var image = events['poster'];
    var regclose = events['reg_close_date'];
    String rgcdate = regclose.substring(0,10);
    String rgctime = regclose.substring(11,16);
    var regiclose = rgcdate+" @ "+ rgctime;
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: size.height * 0.07),
          TopBox(),
          Container(
            margin: EdgeInsets.symmetric(
              vertical: 22,

            ),
            decoration: BoxDecoration(
              color: kPrimaryColor,
              border: Border.all(color: Colors.black12),
              borderRadius: BorderRadius.circular(10),),

              width: size.width * 0.87,
              height: size.width * 0.87,
            child:
                Image.network(image,scale: 3,),
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
            width: size.width * 0.87,
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
              textAlign: TextAlign.left,
            ),
            width: size.width * 0.87,
            height: size.width * 0.5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
            SizedBox(
              width: size.width * .04,
            ),
                Row(
                  children: [
                    Container(
                      width: size.width * 0.07,
                      height: size.width * 0.3,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        border: Border.all(color: Colors.black12),
                        borderRadius: BorderRadius.circular(10),),
                      child: Center(
                          child :RotatedBox(
                            quarterTurns: -1,
                            child :Text(
                              'Start Date',
                              //textDirection: TextDirection.ltr,
                              textAlign: TextAlign.center,
                              style: TextStyle(

                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),

                          )
                      ),

                    ),
                    Container(

                      width: size.width * 0.35,
                      height: size.width * 0.3,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black12),
                        borderRadius: BorderRadius.circular(10),),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          Text(
                            sdate,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(
                            height: size.height * .01,
                          ),
                          Text(
                            stime,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                Row(
                  children: [
                    Container(
                      width: size.width * 0.07,
                      height: size.width * 0.3,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        border: Border.all(color: Colors.black12),
                        borderRadius: BorderRadius.circular(10),),
                      child: Center(
                          child :RotatedBox(
                        quarterTurns: -1,
                        child :Text(
                        'End Date',
                        //textDirection: TextDirection.ltr,
                        textAlign: TextAlign.center,
                        style: TextStyle(

                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),

                      )
                    ),),
                    Container(

                      width: size.width * 0.35,
                      height: size.width * 0.3,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black12),
                        borderRadius: BorderRadius.circular(10),),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            edate,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                      SizedBox(
                        height: size.height * .01),
                          Text(
                            etime,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  width: size.width * .04,
                ),
          ]),
          //SizedBox(width: size.width * .06,),
          Container(
            margin: EdgeInsets.symmetric(
              vertical: 13,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black12),
              borderRadius: BorderRadius.circular(10),),
            width: size.width * 0.88,
            height: size.height * 0.07,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Registration Open till',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                Text(
                  regiclose,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                )
              ],
            ),
          ),

          SizedBox(height: size.height * 0.01),
          RoundedButton(text: "Register", press: () => {}),
        ],
      ),
    );
  }
}
