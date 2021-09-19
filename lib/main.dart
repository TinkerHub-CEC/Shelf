import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; //for using device orientation
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shelf/Screens/Home/homepage.dart';

import 'package:shelf/Screens/Login/login_screen.dart';
import 'package:shelf/Screens/SubmitAttendance/submitAttendance.dart';
import 'package:shelf/Screens/Upload%20Image/uploadImage.dart';
import 'package:shelf/constants.dart';
import 'package:device_preview/device_preview.dart'; //device_preview package

void main() {
  //device orientation set to portrait
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]).then((_) {
    runApp(
      // Using device_preview
      // DevicePreview(
      //   builder: (context) =>
      MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Auth',
        theme: ThemeData(
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: Colors.white,
        ),
        home: Homepage(),
      ),
      // ),
    );
  });
}



//%localappdata%/Android/Sdk/platform-tools/  do not change this
//adb connect localhost:5556
