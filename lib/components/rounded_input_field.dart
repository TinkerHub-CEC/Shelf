import 'package:shelf/components/text_field_container.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

//Rounded Input Field Stateless Widget is created below

class RoundedInputField extends StatefulWidget {
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
  _RoundedInputFieldState createState() => _RoundedInputFieldState();
}

class _RoundedInputFieldState extends State<RoundedInputField> {
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        controller: widget.controller,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
            icon: Icon(widget.icon, color: kPrimaryColor),
            hintText: widget.hintText,
            border: InputBorder.none),
      ),
    );
  }
}
