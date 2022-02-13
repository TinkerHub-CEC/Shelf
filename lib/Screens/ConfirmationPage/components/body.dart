import 'package:flutter/material.dart';
import 'package:shelf/components/custom_menu_bar.dart';
import 'package:shelf/providers/confirmation_event_registrations.dart';
import 'package:shelf/size_config.dart';

class Body extends StatelessWidget {
  final String eventTitle;
  final String eventDate;
  final eventId;
  const Body(
      {Key? key,
      required this.eventTitle,
      required this.eventDate,
      required this.eventId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: SizeConfig.blockSizeVertical * 7),
          CustomMenuBar(text: "Confirmation"),
          Stack(
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: SizeConfig.blockSizeVertical * 8,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xffE1E8E8)),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                ),
                height: SizeConfig.blockSizeVertical * 48,
                width: SizeConfig.blockSizeHorizontal * 80,
                child: Column(
                  children: [
                    Container(
                        padding: EdgeInsets.only(top: size.height * 0.04),
                        height: SizeConfig.blockSizeVertical * 11,
                        width: SizeConfig.blockSizeHorizontal * 80,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xffFF8453)),
                          color: Color(0xffFF8453),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(18),
                            topRight: Radius.circular(18),
                          ),
                        ),
                        child: Center(
                          child: Text("Ticket Booked",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize:
                                      SizeConfig.safeBlockHorizontal * 4.25,
                                  fontWeight: FontWeight.bold)),
                        )),
                    Row(
                      children: [
                        Container(
                            margin: EdgeInsets.only(
                                left: size.width * 0.08,
                                top: size.height * 0.06),
                            child: Text("Name :",
                                style: TextStyle(
                                  fontSize: SizeConfig.safeBlockHorizontal * 4,
                                ))),
                        Expanded(
                          child: Container(
                              margin: EdgeInsets.only(
                                  left: size.width * 0.10,
                                  top: size.height * 0.06),
                              child: Text(eventTitle,
                                  style: TextStyle(
                                      fontSize:
                                          SizeConfig.safeBlockHorizontal * 4,
                                      fontWeight: FontWeight.bold))),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: Container(
                              margin: EdgeInsets.only(
                                  left: size.width * 0.08,
                                  top: size.height * 0.02),
                              child: Text("Date   :",
                                  style: TextStyle(
                                    fontSize:
                                        SizeConfig.safeBlockHorizontal * 4,
                                  ))),
                        ),
                        Flexible(
                          child: Container(
                              margin: EdgeInsets.only(
                                  left: size.width * 0.10,
                                  top: size.height * 0.02),
                              child: Text(eventDate,
                                  style: TextStyle(
                                      fontSize:
                                          SizeConfig.safeBlockHorizontal * 4,
                                      fontWeight: FontWeight.bold))),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              left: size.width * 0.07, top: size.height * 0.04),
                          height: size.height * 0.12,
                          child: Image.asset('assets/images/QR-Easter-EGG.png'),
                        ),
                        Flexible(
                          child: Container(
                              margin: EdgeInsets.only(
                                  left: size.width * 0.08,
                                  top: size.height * 0.03),
                              child: Text("Admit" + " 01",
                                  style: TextStyle(
                                      fontSize:
                                          SizeConfig.safeBlockHorizontal * 8,
                                      color: Colors.black.withOpacity(0.25),
                                      fontWeight: FontWeight.bold))),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                  left: size.width * 0.30,
                  top: size.width * 0.025,
                  child: Image.asset('assets/images/ticket-vector.png')),
            ],
          ),
          Container(
            margin: EdgeInsets.only(
              top: size.height * 0.04,
            ),
            height: size.height * 0.06,
            width: size.width * 0.63,
            child: Text("Confirmation mail has been sent to you by mail.",
                style: TextStyle(
                  fontSize: 17,
                ),
                textAlign: TextAlign.center),
          ),
          Container(
            margin: EdgeInsets.only(
              top: size.height * 0.08,
            ),
            height: size.height * 0.04,
            width: size.width * 0.43,
            decoration: BoxDecoration(
                color: Color(0xffECECEC),
                borderRadius: BorderRadius.circular(20)),
            child: ElevatedButton(
              onPressed: () {
                registerTheEvent(context, eventId);
              },
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.black),
                backgroundColor: MaterialStateProperty.all(Color(0xffECECEC)),
              ),
              child: Center(
                child: Text("Confirm!",
                    style: TextStyle(
                      fontSize: 17,
                    ),
                    textAlign: TextAlign.center),
              ),
            ),
          )
        ],
      ),
    );
  }
}
