import 'package:shelf/Screens/Signup/components/body.dart';
import 'package:flutter/material.dart';
import 'package:shelf/Screens/Signup/components/more_body.dart';

// ignore: must_be_immutable
class SignUpScreen extends StatelessWidget {
//   @override
//   _SignUpScreenState createState() => _SignUpScreenState();
// }

// class _SignUpScreenState extends State<SignUpScreen> {
  PageController _pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: PageView(
          reverse: false,
          controller: _pageController,
          children: [
            Body(child: Column()),
            MoreBody(),
          ],
        ),
      ),
    );
  }
}
