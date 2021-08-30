import 'package:flutter/material.dart';
import 'package:shelf/Screens/ConfirmationPage/confirmation_screen.dart';
import 'package:shelf/Screens/VerifyAttendance/verify_attendance.dart';
import 'package:shelf/components/rounded_button.dart';
import 'package:shelf/components/small_rounded_button.dart';
import 'package:shelf/components/small_rounded_button_outlined.dart';

import 'package:shelf/providers/is_user_admin.dart';

class EventAdminFeatures extends StatelessWidget {
  final String title;
  final eventId;
  final String sdatetime;
  const EventAdminFeatures(
      {Key? key,
      required this.title,
      required this.sdatetime,
      required this.eventId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FutureBuilder<bool?>(
        future: isUserAdmin(),
        builder: (context, AsyncSnapshot<bool?> snapshot) {
          if (snapshot.data == true) {
            return Container(
                height: size.height * 0.15,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SmallRoundedButtonOutlined(
                        press: () {}, text: "View Delegates"),
                    SmallRoundedButton(
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => VerifyAttendanceScreen()),
                          );
                        },
                        text: "Verify Attendance"),
                  ],
                ));
          } else {
            return RoundedButton(
                text: "Register",
                press: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ConfirmationScreen(
                                  eventTitle: title,
                                  eventDate: sdatetime,
                                  eventId: eventId,
                                )),
                      )
                    });
          }
        });
  }
}
