import 'package:shelf/Screens/ConfirmationPage/confirmation_screen.dart';
import 'package:shelf/components/custom_menu_bar.dart';
import 'package:shelf/components/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int _total_seats = 100;
    int _seats_filled = 80;
    Size size = MediaQuery.of(context).size;
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
            child:
                Image.asset('assets/images/event-hacktober.png', scale: 0.83),
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
              'Event Name 00',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            width: size.width * 0.8,
            height: size.width * 0.07,
          ),
          Container(
            margin: EdgeInsets.symmetric(
              vertical: 13,
            ),
            child: Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Egestas interdum sed faucibus lacus sem arcu. Lectus sed sed aliquam adipiscing ultrices adipiscing. Purus in sodales in in et rhoncus. Habitant at commodo urna rhoncus phasellus nulla volutpat.",
              style: TextStyle(
                fontSize: 16.8,
              ),
              textAlign: TextAlign.left,
            ),
            width: size.width * 0.8,
            height: size.width * 0.25,
          ),
          SizedBox(height: size.height * 0.02),
          Container(
            width: size.width * 0.8,
            child: Text(
              "Contact.",
              style: TextStyle(
                fontSize: 16.8,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: size.height * 0.005),
            width: size.width * 0.8,
            child: Text(
              "000000000000",
              style: TextStyle(
                fontSize: 16.8,
              ),
              textAlign: TextAlign.left,
            ),
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
                            'Date 00-00-0000',
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
                            'Time 00:00 pm',
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
                            'Date 00-00-0000',
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
                            'Time 00:00 pm',
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
                  "15-07-2021 @ 5:00 PM",
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
          SizedBox(height: size.height * 0.03),
          RoundedButton(
              text: "Register",
              press: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ConfirmationScreen()),
                    )
                  }),
        ],
      ),
    );
  }
}
