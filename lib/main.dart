import 'package:shelf/Screens/ProfilePage/ProfilePage.dart';
import 'package:shelf/Screens/EventsPage/event_screen.dart';
import 'package:shelf/Screens/Home/homepage.dart';
import 'package:shelf/Screens/Login/login_screen.dart';
import 'package:shelf/Screens/Welcome/welcome_screen.dart';
import 'package:shelf/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; //for using device orientation
import 'package:device_preview/device_preview.dart';
import 'Screens/Home/components/eventcard.dart'; //device_preview package

void main() {
  //device orientation set to portrait
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]).then((_) {
    runApp(
      //Using device_preview
      // DevicePreview(
      //   builder: (context) =>
      MyApp(),
      // ),
    );
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Auth',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: WelcomeScreen(),
    );
  }
}
