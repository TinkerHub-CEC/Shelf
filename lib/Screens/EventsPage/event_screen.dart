import 'package:shared_preferences/shared_preferences.dart';
import 'package:shelf/Screens/EventsPage/components/body.dart';
import 'package:flutter/material.dart';
import 'package:shelf/Screens/Login/login_screen.dart';

 
class EventScreen extends StatefulWidget {

  @override
   _EventScreenState createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  late SharedPreferences sharedPreferences;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkLoginStatus();
  }

  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString("token") == null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => LoginScreen()),
              (Route<dynamic> route) => false);
    }


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
  }