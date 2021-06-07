import 'package:flutter/material.dart';
import 'package:attendence_event/Home/components/body.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Body(),
    );
  }
}