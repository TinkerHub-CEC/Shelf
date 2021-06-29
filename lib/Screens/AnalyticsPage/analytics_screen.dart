import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shelf/Screens/Login/login_screen.dart';

class AnalyticsScreen extends StatefulWidget {
  @override
  _AnalyticsScreenState createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  late SharedPreferences sharedPreferences;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // drawer: Drawer(
        //   child: ListView(children: [Text('data')]),
        // ),
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text('Analytics',
              style: TextStyle(
                color: Colors.black,
              )),
          iconTheme: IconThemeData(color: Colors.black),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                sharedPreferences.clear();
                // ignore: deprecated_member_use
                sharedPreferences.commit();
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (BuildContext context) => LoginScreen()),
                    (Route<dynamic> route) => false);
              },
              child: Text('Logout'),
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[],
        ),
      ),
    );
  }
}
