import 'package:shelf/Screens/Login/login_screen.dart';
import 'package:shelf/Screens/Signup/signup_screen.dart';
import 'package:shelf/components/custom_menu_bar.dart';

import 'package:shelf/constants.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomMenuBar(text: "Events"),
    );
  }
}
