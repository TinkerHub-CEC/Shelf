import 'package:attendence_event/Screens/Login/components/background.dart';
import 'package:attendence_event/Screens/Signup/signup_screen.dart';
import 'package:attendence_event/components/already_have_an_account.dart';
import 'package:attendence_event/components/rounded_button.dart';
import 'package:attendence_event/components/rounded_input_field.dart';
import 'package:attendence_event/components/rounded_password_field.dart';

import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

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
            RoundedPasswordField(onChanged: (value) {}),
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
            RoundedButton(text: "Login", press: () {}),
          ],
        ),
      ),
    );
  }
}
