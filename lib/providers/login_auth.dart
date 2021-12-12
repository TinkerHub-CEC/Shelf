import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shelf/Api/api.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shelf/Screens/Home/homepage.dart';
import '../constants.dart';

Future signIn(BuildContext context, String email, String password) async {
  final uri = Uri.parse('$baseUrl/api/token');
  print(uri);

  Map data = {'email': email, 'password': password};

  print(data);
  var jsonResponse;

  Map<String, String> headers = {"Content-Type": "application/json"};

  final msg = jsonEncode({"email": email, "password": password});

  var response = await http.post(Uri.parse("$baseUrl/api/token/"),
      body: msg, headers: headers);
  jsonResponse = json.decode(response.body);

  // Map<String, dynamic> decodedToken = JwtDecoder.decode(yourToken);

  // print('Decoded Token: ${decodedToken['name']}');

  /* isExpired() - you can use this method to know if your token is already expired or not.
  An useful method when you have to handle sessions and you want the user
  to authenticate if has an expired token */

  print('Response Status: ${response.statusCode}');
  print('Response Body: ${response.body}');

  if (response.statusCode == 200) {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('email', email);
    storeData('auth_data', jsonResponse['access']);

    storeData('token', jsonResponse['refresh']);
    sharedPreferences.setString('refresh', jsonResponse['refresh']);
    sharedPreferences.setBool('islogged', true);
    final a = await getData('auth_data');
    final b = await getData('token');
    final d = sharedPreferences.getBool('islogged');

    print('refresh_token: $b');
    print('auth_data: $a');
    print('logged in: $d');

    Map<String?, dynamic> decodedauthToken =
        JwtDecoder.decode(jsonResponse['access']);
    // Now you can use your decoded token
    Map<String?, dynamic> decodedrefreshToken =
        JwtDecoder.decode(jsonResponse['refresh']);
    // Now you can use your decoded token
    sharedPreferences.setBool('isAdminUser', decodedrefreshToken['is_admin']);

    sharedPreferences.setInt('auth_user_id', decodedrefreshToken['user_id']);

    final c = await getValue('auth_user_id');
    print('auth_id: $c');
    final snackBar = SnackBar(
      duration: const Duration(seconds: 5),
      content: Text('Sucessfully Logged In'),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);

    bool isTokenExpired = JwtDecoder.isExpired(jsonResponse['refresh']);
    print(isTokenExpired);
    if (isTokenExpired) {
      // The user should authenticate
      print('Token Expired');
    }

    // /* getExpirationDate() - this method returns the expiration date of the token */
    DateTime expirationDate =
        JwtDecoder.getExpirationDate(jsonResponse['refresh']);

    // // 2025-01-13 13:04:18.000
    print(expirationDate);

    /* getTokenTime() - You can use this method to know how old your token is */

    print(decodedauthToken);
    print(decodedrefreshToken);
    print(decodedrefreshToken['is_admin']);
    // sharedPreferences.setBool(
    //     'isAdminUser', decodedrefreshToken['is_superuser']);
    print("Token and email exist. Logging In...");
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (BuildContext context) => Homepage()),
        (Route<dynamic> route) => false);

    return true;
  } else {
    print(response.body);
    final snackBar = SnackBar(
      duration: const Duration(seconds: 5),
      content: Text('You have given incorrect details'),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

Future accessWithRefresh(String data) async {
  // ignore: unnecessary_null_comparison
  if (data == null) {
    return false;
  }
  final uri = Uri.parse('$baseUrl/api/token/refresh');

  // final data = await getData('auth_data');
  var map = new Map<String, dynamic>();

  map['refresh'] = data;

  http.Response response = await http.post(
    uri,
    body: map,
  );
  final body = jsonDecode(response.body);
  print(response.body);
  if (response.statusCode == 200) {
    storeData('auth_data', body['access']);
    return true;
  } else {
    return false;
  }
}
