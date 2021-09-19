//import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import 'package:shelf/Screens/EventsDetailsPage/components/isAdminFeatures.dart';
import 'package:shelf/components/custom_menu_bar.dart';

import 'package:flutter/material.dart';
import 'package:shelf/size_config.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../../constants.dart';

class Body extends StatelessWidget {
  final events;
  Body(this.events);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var outputFormat = DateFormat('dd/MM/yyyy');
    var timeOutputFormat = DateFormat('MM/dd/yyyy hh:mm a');
    // ignore: non_constant_identifier_names
    var totseat=events['max_participants'];
    int _total_seats = totseat;
    // ignore: non_constant_identifier_names
    var regseat=events['reg_count'];
    int _seats_filled = regseat;
    print(events);
    Size size = MediaQuery.of(context).size;
    var id = events['id'];
    var title = events['title'];

    var sdatetime = events['start_datetime'];
    String sdate = sdatetime.substring(0, 10);
    sdate = outputFormat.format(DateTime.parse(sdate));

    String stime = sdatetime;
    stime = timeOutputFormat.format(DateTime.parse(stime));
    stime = stime.substring(11);

    var edatetime = events['end_datetime'];
    String edate = edatetime.substring(0, 10);
    edate = outputFormat.format(DateTime.parse(edate));
    String etime = sdatetime;

    etime = timeOutputFormat.format(DateTime.parse(etime));
    etime = etime.substring(11);

    var description = events['long_description'];
    var image = events['poster'];
    var regclose = events['reg_close_date'];

    String rgcdate = regclose.substring(0, 10);
    rgcdate = outputFormat.format(DateTime.parse(rgcdate));

    String rgctime = regclose;

    rgctime = timeOutputFormat.format(DateTime.parse(rgctime));
    rgctime = rgctime.substring(11);

    var regiclose = rgcdate + " @ " + rgctime;
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: SizeConfig.blockSizeVertical * 7),
          CustomMenuBar(text: "Event Details"),
          Container(
            margin: EdgeInsets.symmetric(
              vertical: SizeConfig.blockSizeVertical * 3,
              horizontal: SizeConfig.blockSizeHorizontal * 7.5,
            ),
            decoration: BoxDecoration(
              color: kPrimaryColor,
              border: Border.all(color: Colors.black12),
              borderRadius: BorderRadius.circular(10),
            ),
            width: SizeConfig.blockSizeHorizontal * 80,
            height: SizeConfig.blockSizeVertical * 48,
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
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: SizeConfig.blockSizeHorizontal * 3,
                  bottom: SizeConfig.blockSizeHorizontal * 3,
                  left: SizeConfig.blockSizeHorizontal * 10,
                  right: SizeConfig.blockSizeHorizontal * 10,
                ),
                child: Text(
                  title,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: SizeConfig.safeBlockHorizontal * 4,
                  ),
                ),
                height: size.width * 0.07,
              ),
            ],
          ),
          Row(
            children: [
              Flexible(
                child: Container(
                  margin: EdgeInsets.only(
                    top: SizeConfig.blockSizeHorizontal * 3,
                    bottom: SizeConfig.blockSizeHorizontal * 3,
                    left: SizeConfig.blockSizeHorizontal * 10,
                    right: SizeConfig.blockSizeHorizontal * 10,
                  ),
                  child: Text(
                    description,
                    style: TextStyle(
                      fontSize: SizeConfig.safeBlockHorizontal * 3.5,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Container(
                  height: SizeConfig.blockSizeVertical * 13,
                  width: SizeConfig.blockSizeHorizontal * 34,
                  margin: EdgeInsets.only(
                    top: SizeConfig.blockSizeVertical * 2,
                    bottom: SizeConfig.blockSizeVertical * 2,
                    right: SizeConfig.blockSizeHorizontal * 5,
                    left: SizeConfig.blockSizeHorizontal * 5,
                  ),
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
                        height: SizeConfig.blockSizeVertical * 13,
                        width: size.width * 0.05,
                        child: RotatedBox(
                            quarterTurns: 3,
                            child: Text(
                              "Start Date",
                              style: TextStyle(
                                  fontSize:
                                      SizeConfig.safeBlockHorizontal * 2.5,
                                  fontWeight: FontWeight.bold),
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
                              top: SizeConfig.blockSizeVertical * 3,
                              bottom: SizeConfig.blockSizeVertical * 1,
                            ),
                            child: Text(
                              sdate,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: SizeConfig.safeBlockHorizontal * 3,
                              ),
                            ),
                          ),
                          Container(
                            color: Colors.white,
                            //padding: EdgeInsets.symmetric(
                            //  vertical: 6,
                            //  horizontal: 11,
                            //),
                            margin: EdgeInsets.only(
                              left: SizeConfig.blockSizeVertical * 2,
                              right: SizeConfig.blockSizeVertical * 2,
                              bottom: SizeConfig.blockSizeVertical * 2,
                            ),
                            child: Text(
                              stime,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: SizeConfig.safeBlockHorizontal * 3,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(
                child: Container(
                  height: SizeConfig.blockSizeVertical * 13,
                  width: SizeConfig.blockSizeHorizontal * 34,
                  margin: EdgeInsets.only(
                    top: SizeConfig.blockSizeVertical * 2,
                    bottom: SizeConfig.blockSizeVertical * 2,
                    left: SizeConfig.blockSizeHorizontal * 5,
                    right: SizeConfig.blockSizeHorizontal * 5,
                  ),
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
                        height: SizeConfig.blockSizeVertical * 13,
                        width: size.width * 0.05,
                        child: RotatedBox(
                            quarterTurns: 3,
                            child: Text(
                              "End Date",
                              style: TextStyle(
                                  fontSize:
                                      SizeConfig.safeBlockHorizontal * 2.5,
                                  fontWeight: FontWeight.bold),
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
                              top: SizeConfig.blockSizeVertical * 3,
                              bottom: SizeConfig.blockSizeVertical * 1,
                            ),
                            child: Text(
                              edate,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: SizeConfig.safeBlockHorizontal * 3,
                              ),
                            ),
                          ),
                          Container(
                            color: Colors.white,
                            //padding: EdgeInsets.symmetric(
                            //  vertical: 6,
                            //  horizontal: 11,
                            //),
                            margin: EdgeInsets.only(
                              left: SizeConfig.blockSizeVertical * 2,
                              right: SizeConfig.blockSizeVertical * 2,
                              bottom: SizeConfig.blockSizeVertical * 1,
                            ),
                            child: Text(
                              etime,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: SizeConfig.safeBlockHorizontal * 3,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
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
                    fontSize: SizeConfig.safeBlockHorizontal * 3.1,
                  ),
                ),
                Text(
                  regiclose,
                  style: TextStyle(
                    color: Color(0xffF34336),
                    fontWeight: FontWeight.bold,
                    fontSize: SizeConfig.safeBlockHorizontal * 3.1,
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
              title: events['title'], sdatetime: sdate, eventId: id),
        ],
      ),
    );
  }
}
