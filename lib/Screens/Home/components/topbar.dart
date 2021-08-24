import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shelf/components/custom_menu_bar.dart';

// ignore: must_be_immutable
class TopBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return CustomMenuBar(text: "Dashboard");
  }
}
