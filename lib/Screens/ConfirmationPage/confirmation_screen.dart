import 'package:flutter/material.dart';
import 'package:shelf/Screens/ConfirmationPage/components/body.dart';

class ConfirmationScreen extends StatelessWidget {
  final String eventTitle;
  final String eventDate;
  const ConfirmationScreen(
      {Key? key, required this.eventTitle, required this.eventDate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(eventTitle: eventTitle, eventDate: eventDate),
    );
  }
}
