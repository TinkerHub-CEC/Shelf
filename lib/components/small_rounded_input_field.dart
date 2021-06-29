import 'package:shelf/components/small_text_field_container.dart';
import 'package:flutter/material.dart';

//Rounded Input Field Stateless Widget is created below

class SmallRoundedInputField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  final ValueChanged<String> onChanged;
  const SmallRoundedInputField({
    Key? key,
    required this.hintText,
    required this.onChanged,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SmallTextFieldContainer(
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        decoration:
            InputDecoration(hintText: hintText, border: InputBorder.none),
      ),
    );
  }
}
