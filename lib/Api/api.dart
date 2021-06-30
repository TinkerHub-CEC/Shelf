import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

Future storeData(String key, String value) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sharedPreferences.setString(key, value);
}

Future<String?> getData(String key) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  String? data = sharedPreferences.getString(key);

  return data;
}
