import 'dart:io';

import 'package:shelf/Api/api.dart';

import 'package:shelf/constants.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

import 'package:flutter/material.dart';

Future registerTheEvent(
  BuildContext context,
) async {
  try {
    final uri = Uri.parse('$baseUrl/api/events/14/register/');
    final data = await getData('auth_data');

    http.Response response = await http.post(
      uri,
      headers: {HttpHeaders.authorizationHeader: 'Bearer ' + data!},
    );

    // ignore: unused_local_variable
    final body = jsonEncode(response.body);
    print(response.body);
    if (response.statusCode == 201) {
      print('success');
      Navigator.of(context).pop();
    } else {
      print('error');
      Navigator.of(context).pop();
    }
  } catch (e) {}
}
