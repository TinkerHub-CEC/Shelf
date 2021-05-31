import 'package:attendence_event/Screens/Login/login_screen.dart';
import 'package:attendence_event/Screens/Signup/components/background.dart';
import 'package:attendence_event/components/already_have_an_account.dart';
import 'package:attendence_event/components/rounded_button.dart';
import 'package:attendence_event/components/rounded_input_field.dart';
import 'package:attendence_event/components/rounded_password_field.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  final Widget child;

  const Body({
    Key? key,
    required this.child,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    Size size = MediaQuery.of(context).size;
    return Background(
        child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                child: IconButton(
                  highlightColor: Colors.white,
                  iconSize: 22,
                  icon: Icon(Icons.arrow_back),
                  color: Colors.black,
                  onPressed: () => Navigator.pop(context, false),
                ),
              ),
            ],
          ),
          SizedBox(height: size.height * 0.16),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 38),
                child: Text(
                  "Register",
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
                  "Create your account",
                  style: TextStyle(
                      color: Color(0xff788190),
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
          SizedBox(height: size.height * 0.025),
          Row(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 38),
                child: Text(
                  "Your Name",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                ),
              ),
            ],
          ),
          RoundedInputField(
              controller: usernameController,
              icon: Icons.person,
              hintText: "My Name",
              onChanged: (value) {}),
          SizedBox(height: size.height * 0.025),
          Row(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 38),
                child: Text(
                  "Your Email",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
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
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                ),
              ),
            ],
          ),
          RoundedPasswordField(
              controller: passwordController, onChanged: (value) {}),
          SizedBox(height: size.height * 0.025),
          AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              }),
          RoundedButton(text: "Register", press: () {}),
        ],
      ),
    ));
  }
}
