//import 'dart:html';

import 'package:flutter/cupertino.dart';

import 'package:shelf/Screens/EventsDetailsPage/components/isAdminFeatures.dart';
import 'package:shelf/components/custom_menu_bar.dart';

import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../../constants.dart';

class Body extends StatelessWidget {
  final events;
  Body(this.events);

  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    int _total_seats = 120;
    // ignore: non_constant_identifier_names
    int _seats_filled = 40;
    print(events);
    Size size = MediaQuery.of(context).size;
    var id = events['id'];
    var title = events['title'];
    var sdatetime = events['start_datetime'];
    String sdate = sdatetime.substring(0, 10);
    String stime = sdatetime.substring(11, 16);
    var edatetime = events['end_datetime'];
    String edate = edatetime.substring(0, 10);
    String etime = sdatetime.substring(11, 16);
    var description =
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
    // events['long_description'];
    var image = events['poster'];
    var regclose = events['reg_close_date'];
    String rgcdate = regclose.substring(0, 10);
    String rgctime = regclose.substring(11, 16);
    var regiclose = rgcdate + " @ " + rgctime;
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: size.height * 0.07),
          CustomMenuBar(text: "Event Details"),
          Container(
            margin: EdgeInsets.symmetric(
              vertical: 22,
            ),
            decoration: BoxDecoration(
              color: kPrimaryColor,
              border: Border.all(color: Colors.black12),
              borderRadius: BorderRadius.circular(10),
            ),
            width: size.width * 0.80,
            height: size.width * 0.87,
            child: Image.network(image),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                  margin: EdgeInsets.only(right: size.width * 0.12),
                  child: Text(
                    '$_seats_filled' + '/' + '$_total_seats' + ' Seats',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: EdgeInsets.only(right: size.width * 0.12),
                height: size.height * 0.02,
                width: size.width * 0.2,
                child: StepProgressIndicator(
                  totalSteps: _total_seats,
                  currentStep: _seats_filled,
                  size: 6,
                  padding: 0,
                  selectedColor: Colors.green,
                  unselectedColor: Colors.white,
                  roundedEdges: Radius.circular(10),
                  selectedGradientColor: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.green, Colors.green],
                  ),
                  unselectedGradientColor: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xffECECEC), Color(0xffECECEC)],
                  ),
                ),
              ),
            ],
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
            width: size.width * 0.8,
            height: size.width * 0.07,
          ),
          Row(
            children: [
              Flexible(
                child: Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 13,
                    horizontal: 46,
                  ),
                  child: Text(
                    description,
                    style: TextStyle(
                      fontSize: 16.8,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  width: size.width * 0.8,
                ),
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: size.width * 0.39,
                height: size.width * 0.24,
                margin: EdgeInsets.only(
                    top: size.width * 0.028, left: size.width * 0.1),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xffE1E8E8)),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xff73D13D),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      padding: EdgeInsets.only(
                        left: 4,
                      ),
                      height: size.height * 1,
                      width: size.width * 0.05,
                      child: RotatedBox(
                          quarterTurns: 3,
                          child: Text(
                            "Start Date",
                            style: TextStyle(
                                fontSize: 11, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          )),
                    ),
                    Column(
                      children: [
                        Container(
                          color: Colors.white,
                          padding: EdgeInsets.symmetric(
                            vertical: 6,
                            horizontal: 11,
                          ),
                          margin: EdgeInsets.only(
                            top: 22,
                          ),
                          width: size.width * 0.31,
                          height: size.width * 0.07,
                          child: Text(
                            sdate,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Container(
                          color: Colors.white,
                          padding: EdgeInsets.symmetric(
                            vertical: 6,
                            horizontal: 11,
                          ),
                          width: size.width * 0.31,
                          height: size.width * 0.07,
                          child: Text(
                            stime,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: size.width * 0.39,
                height: size.width * 0.24,
                margin: EdgeInsets.only(
                    top: size.width * 0.028, left: size.width * 0.02),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xffE1E8E8)),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xff73D13D),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      padding: EdgeInsets.only(
                        left: 4,
                      ),
                      height: size.height * 1,
                      width: size.width * 0.05,
                      child: RotatedBox(
                          quarterTurns: 3,
                          child: Text(
                            "End Date",
                            style: TextStyle(
                                fontSize: 11, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          )),
                    ),
                    Column(
                      children: [
                        Container(
                          color: Colors.white,
                          padding: EdgeInsets.symmetric(
                            vertical: 6,
                            horizontal: 11,
                          ),
                          margin: EdgeInsets.only(
                            top: 22,
                          ),
                          width: size.width * 0.31,
                          height: size.width * 0.07,
                          child: Text(
                            edate,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Container(
                          color: Colors.white,
                          padding: EdgeInsets.symmetric(
                            vertical: 6,
                            horizontal: 11,
                          ),
                          width: size.width * 0.31,
                          height: size.width * 0.07,
                          child: Text(
                            etime,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          //SizedBox(width: size.width * .06,),
          Container(
            margin: EdgeInsets.only(
              top: size.height * 0.02,
            ),
            height: size.height * 0.07,
            width: size.width * 0.8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Registration Open till",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  regiclose,
                  style: TextStyle(
                    color: Color(0xffF34336),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xffE1E8E8)),
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
          ),

          EventAdminFeatures(
              title: events['title'], sdatetime: sdatetime, eventId: id),
        ],
      ),
    );
  }
}
