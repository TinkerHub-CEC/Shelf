import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shelf/Screens/Login/login_screen.dart';

Future sessionTimeOut(BuildContext context) async {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Session Timeout'),
        content: Text('Your session has been expired. Please login again.'),
        actions: <Widget>[
          TextButton(
            child: Text('OK'),
            onPressed: () async {
              SharedPreferences sharedPreferences =
                  await SharedPreferences.getInstance();
              sharedPreferences.remove('email');
              sharedPreferences.remove('auth_data');
              sharedPreferences.remove('token');
              sharedPreferences.remove('islogged');
              Timer(Duration(seconds: 2), () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (BuildContext context) => LoginScreen()),
                    (Route<dynamic> route) => false);
              });
            },
          ),
        ],
      );
    },
  );
}
