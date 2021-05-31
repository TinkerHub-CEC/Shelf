import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:attendence_event/Screens/Home/home_screen.dart';
import 'package:attendence_event/Screens/Login/components/background.dart';
import 'package:attendence_event/Screens/Signup/signup_screen.dart';
import 'package:attendence_event/components/already_have_an_account.dart';
import 'package:attendence_event/components/rounded_button.dart';
import 'package:attendence_event/components/rounded_input_field.dart';
import 'package:attendence_event/components/rounded_password_field.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.3),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 38),
                  child: Text(
                    "Login",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 38),
                  child: Text(
                    "Sign into your account",
                    style: TextStyle(
                        color: Color(0xff788190),
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height * 0.045),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 38),
                  child: Text(
                    "Your Email",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                  ),
                ),
              ],
            ),
            RoundedInputField(
                controller: usernameController,
                icon: Icons.mail,
                hintText: "myemail@gmail.com",
                onChanged: (value) {}),
            SizedBox(height: size.height * 0.025),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 38),
                  child: Text(
                    "Password",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                  ),
                ),
              ],
            ),
            RoundedPasswordField(
                controller: passwordController, onChanged: (value) {}),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 38),
                  child: Text(
                    "Forgot Password?",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height * 0.075),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpScreen()),
                );
              },
            ),
            RoundedButton(
                text: "Login",
                press: () {
                  signIn(usernameController.text, passwordController.text);
                }),
          ],
        ),
      ),
    );
  }

  signIn(String username, String password) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map data = {'username': username, 'password': password};

    print(data);
    var jsonResponse;
    Map<String, String> headers = {"Content-Type": "application/json"};

    final msg = jsonEncode({"username": username, "password": password});

    var response = await http.post(Uri.parse("http://10.0.2.2:8000/api/token/"),
        body: msg, headers: headers);
    jsonResponse = json.decode(response.body);

    String refreshToken = jsonResponse['refresh'];
    // Map<String, dynamic> decodedToken = JwtDecoder.decode(yourToken);

    // print('Decoded Token: ${decodedToken['name']}');

    print('Response Status: ${response.statusCode}');
    print('Response Body: ${response.body}');

    if (jsonResponse != null) {
      sharedPreferences.setString("token", refreshToken);
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => HomeScreen()),
          (Route<dynamic> route) => false);
    } else {
      print(response.body);
    }
  }
}
