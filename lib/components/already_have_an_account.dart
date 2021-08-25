import 'package:flutter/material.dart';

//A Statless Widget for displaying whether the login is created or not.

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final Function press;

  const AlreadyHaveAnAccountCheck({
    Key? key,
    this.login = true,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        GestureDetector(
          onTap: () => press(),
          child: Container(
            margin: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * .010),
            child: Text(
              login ? "I don't have an account" : "Already have an account",
              style: TextStyle(color: Color(0xffEF3561)),
            ),
          ),
        )
      ],
    );
  }
}
