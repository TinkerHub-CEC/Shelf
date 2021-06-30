import 'package:shared_preferences/shared_preferences.dart';

Future<bool?> isUserAdmin() async {
  SharedPreferences sharedPreferences;
  sharedPreferences = await SharedPreferences.getInstance();
  return sharedPreferences.getBool('isAdminUser');
}
