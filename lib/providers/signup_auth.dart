import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:shelf/Screens/Login/login_screen.dart';
import '../constants.dart';

signUp(BuildContext context, String firstname, String lastname, String email,
    String password, String rollNo, String semester, String batch) async {
  Map data = {
    'firstname': firstname,
    'lastname': lastname,
    'email': email,
    'password': password,
    'rollNo': rollNo,
    'semester': semester,
    'batch': batch,
  };

  print(data);
  var jsonResponse;
  Map<String, String> headers = {"Content-Type": "application/json"};

  final msg = jsonEncode({
    "first_name": firstname,
    "last_name": lastname,
    "roll_no": rollNo,
    "semester": semester,
    "batch": batch,
    "username": (firstname + lastname).toLowerCase(),
    "email": email,
    "password": password
  });
  print(msg);
  var response = await http.post(Uri.parse("$baseUrl/api/users/"),
      body: msg, headers: headers);
  jsonResponse = json.decode(response.body);
  if (response.statusCode == 201) {
    final snackBar = SnackBar(
      duration: const Duration(seconds: 5),
      content: Text(
          'Almost there, follow the instructions in the mail just received. Do check the spam folder.'),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (BuildContext context) => LoginScreen()),
        (Route<dynamic> route) => false);
  } else {
    final snackBar = SnackBar(
      duration: const Duration(seconds: 5),
      content: Text('You have given incorrect details'),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (BuildContext context) => LoginScreen()),
        (Route<dynamic> route) => false);
  }
  // String refreshToken = jsonResponse['refresh'];
  // Map<String, dynamic> decodedToken = JwtDecoder.decode(yourToken);

  // print('Decoded Token: ${decodedToken['name']}');
  print('JSON Response: $jsonResponse');
  print('Response Status: ${response.statusCode}');
  print('Response MoreBody: ${response.body}');
}
