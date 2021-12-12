import 'dart:io';

import 'package:shelf/Api/api.dart';

import 'package:shelf/constants.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

import 'package:flutter/material.dart';

Future<bool> isEventRegistered(
  BuildContext context,
  var id,
) async {
  print("accessing event registered function");
  try {
    final uri = Uri.parse('$baseUrl/api/events/$id/');
    final data = await getData('auth_data');
    var jsonResponse;
    print(id);

    http.Response response = await http.get(
      uri,
      headers: {HttpHeaders.authorizationHeader: 'Bearer ' + data!},
    );
    // ignore: unused_local_variable

    print('Response Body: ${response.body}');
    jsonResponse = json.decode(response.body);
    bool registration_status = jsonResponse['registration_status'];
    print(registration_status);
    if (response.statusCode == 200 && registration_status == true) {
      print('success');
      print('true will be the output');
      return true;
    } else {
      print('success');
      print('false will be the output');
      return false;
    }
  } catch (e) {
    print('error');
    return false;
  }
}
