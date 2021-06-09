import 'package:shelf/components/text_field_container.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

//Rounded Input Field Stateless Widget is created below

class RoundedInputField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundedInputField({
    Key? key,
    required this.hintText,
    required this.icon,
    required this.onChanged,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
            icon: Icon(icon, color: kPrimaryColor),
            hintText: hintText,
            border: InputBorder.none),
      ),
    );
  }
}
