import 'dart:io';

import 'package:shelf/Api/api.dart';
import 'package:shelf/Screens/Home/homepage.dart';

import 'package:shelf/constants.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shelf/providers/is_event_registered.dart';
import 'package:shelf/providers/session_timedout.dart';

Future registerTheEvent(BuildContext context, var id) async {
  try {
    final uri = Uri.parse('$baseUrl/api/events/$id/register/');
    final data = await getData('auth_data');

    print(id);

    http.Response response = await http.post(
      uri,
      headers: {HttpHeaders.authorizationHeader: 'Bearer ' + data!},
    );
    // ignore: unused_local_variable
    final body = jsonEncode(response.body);
    print(response.body);
    print("Confirmation Event Status Code: ${response.statusCode}");
    if (response.statusCode == 201) {
      print('success');
      isEventRegistered(context, id);

      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => Homepage()),
          (Route<dynamic> route) => false);
    } else if (response.statusCode == 401) {
      sessionTimeOut(context);
    } else {
      print('error');
      Navigator.of(context).pop();
    }
  } catch (e) {}
}
