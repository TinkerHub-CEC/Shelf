import 'package:flutter/material.dart';
import 'package:shelf/Screens/ConfirmationPage/components/body.dart';

class ConfirmationScreen extends StatelessWidget {
  const ConfirmationScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
