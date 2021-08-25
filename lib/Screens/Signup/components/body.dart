import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shelf/Api/api.dart';
import 'package:shelf/Screens/Login/login_screen.dart';
import 'package:shelf/Screens/Signup/components/background.dart';

import 'package:shelf/components/already_have_an_account.dart';
import 'package:shelf/components/rounded_button.dart';

import 'package:shelf/components/rounded_input_field.dart';
import 'package:shelf/components/rounded_password_field.dart';

import 'package:shelf/components/small_rounded_input_field.dart';
import 'package:shelf/components/text_field_container.dart';
import 'package:shelf/constants.dart';
import 'package:shelf/providers/signup_auth.dart';
import 'package:shelf/size_config.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var firstNameController = TextEditingController();

  var lastNameController = TextEditingController();

  // var registerNumberController = TextEditingController();

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  String firstName = '';
  String lastName = '';
  // String regNo = '';
  // Object? semChoosen;
  // Object? valueChoosen;

  // var _listItems = ["1", "2", "3", "4", "5", "6", "7", "8"];
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    Size size = MediaQuery.of(context).size;
    return Background(
        child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.start,
          //   children: [
          //     Container(
          //       margin: EdgeInsets.symmetric(
          //           vertical: size.height * 0.010,
          //           horizontal: size.width * 0.010),
          //       child: IconButton(
          //         highlightColor: Colors.white,
          //         iconSize: 22,
          //         icon: Icon(Icons.arrow_back),
          //         color: Colors.black,
          //         onPressed: () => Navigator.pop(context, false),
          //       ),
          //     ),
          //   ],
          // ),
          SizedBox(height: size.height * 0.20),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(
                    vertical: size.height * 0.012,
                    horizontal: size.width * 0.078),
                child: Text(
                  "Register",
                  style: TextStyle(
                      fontSize: SizeConfig.safeBlockHorizontal * 5,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(
                    vertical: size.height * 0.012,
                    horizontal: size.width * 0.078),
                child: Text(
                  "Create your account",
                  style: TextStyle(
                      color: Color(0xff788190),
                      fontSize: SizeConfig.safeBlockHorizontal * 2.9,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
          SizedBox(height: size.height * 0.025),
          Row(
            children: [
              Container(
                margin: EdgeInsets.symmetric(
                    vertical: size.height * 0.012,
                    horizontal: size.width * 0.078),
                child: Text(
                  "Your Name",
                  style: TextStyle(
                      fontSize: SizeConfig.safeBlockHorizontal * 3.4,
                      fontWeight: FontWeight.normal),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.symmetric(
                    vertical: size.height * .012,
                    horizontal: size.width * .020),
                child: SmallRoundedInputField(
                    hintText: "First Name",
                    onChanged: (value) {
                      firstName = value;
                    },
                    controller: firstNameController),
              ),
              Container(
                child: SmallRoundedInputField(
                    hintText: "Last Name",
                    onChanged: (value) {
                      lastName = value;
                    },
                    controller: lastNameController),
              ),
            ],
          ),
          SizedBox(height: size.height * 0.025),
          // Row(
          //   children: [
          //     Container(
          //       margin: EdgeInsets.symmetric(vertical: 5, horizontal: 38),
          //       child: Text(
          //         "Registration No",
          //         style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
          //       ),
          //     ),
          //   ],
          // ),
          // RoundedInputField(
          //   icon: Icons.confirmation_number,
          //   hintText: "eg CHN19CS057",
          //   onChanged: (value) {
          //     print(value);
          //     regNo = value;
          //   },
          //   controller: registerNumberController,
          // ),
          // SizedBox(height: size.height * 0.025),
          // Row(
          //   children: [
          //     Container(
          //       margin: EdgeInsets.symmetric(vertical: 5, horizontal: 38),
          //       child: Text(
          //         "Your Semster",
          //         style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
          //       ),
          //     ),
          //   ],
          // ),
          // Container(
          //   child: TextFieldContainer(
          //     child: DropdownButton(
          //       items: _listItems.map((dropDownItem) {
          //         return DropdownMenuItem(
          //           value: dropDownItem,
          //           child: Text(dropDownItem),
          //         );
          //       }).toList(),
          //       onChanged: (newValue) {
          //         setState(() {
          //           print(jsonEncode(newValue));
          //           this.valueChoosen = newValue;
          //           semChoosen = valueChoosen;
          //         });
          //       },
          //       hint: Text("Select"),
          //       value: valueChoosen,
          //     ),
          //   ),
          // ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.symmetric(
                    vertical: size.height * .012,
                    horizontal: size.width * .078),
                child: Text(
                  "Your Email",
                  style: TextStyle(
                      fontSize: SizeConfig.safeBlockHorizontal * 3.4,
                      fontWeight: FontWeight.normal),
                ),
              ),
            ],
          ),
          RoundedInputField(
              controller: emailController,
              icon: Icons.mail,
              hintText: "myemail@gmail.com",
              onChanged: (value) {}),
          SizedBox(height: size.height * 0.025),
          Row(
            children: [
              Container(
                margin: EdgeInsets.symmetric(
                    vertical: size.height * .012,
                    horizontal: size.width * .078),
                child: Text(
                  "Password",
                  style: TextStyle(
                      fontSize: SizeConfig.safeBlockHorizontal * 3.4,
                      fontWeight: FontWeight.normal),
                ),
              ),
            ],
          ),
          RoundedPasswordField(
              controller: passwordController, onChanged: (value) {}),
          AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              }),
          SizedBox(height: size.height * 0.025),
          RoundedButton(
              text: "Register",
              press: () async {
                signUp(
                    context,
                    firstNameController.text,
                    lastNameController.text,
                    emailController.text,
                    passwordController.text);
              }),
          // SizedBox(height: size.height * 0.025),

          // SizedBox(height: size.height * 0.025),
          // ClipRRect(
          //   borderRadius: BorderRadius.circular(50),
          //   child: Container(
          //     color: kPrimaryColor,
          //     child: Padding(
          //       padding: const EdgeInsets.all(8),
          //       child: IconButton(
          //         color: Colors.white,
          //         onPressed: () {
          //           print(firstName);
          //           print(lastName);
          //           print(regNo);
          //           print(semChoosen);
          //         },
          //         icon: Icon(
          //           Icons.arrow_forward,
          //           size: 32,
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    ));
  }
}
