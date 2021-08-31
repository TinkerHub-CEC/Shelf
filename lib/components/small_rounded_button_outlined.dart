import 'package:shelf/constants.dart';
import 'package:flutter/material.dart';

//rounded button stateless widget is created below

class SmallRoundedButtonOutlined extends StatelessWidget {
  final String text;
  final Function press;
  final Color color, textColor;
  const SmallRoundedButtonOutlined({
    Key? key,
    required this.text,
    required this.press,
    this.color = Colors.white,
    this.textColor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: size.width * 0.006,
        horizontal: size.height * 0.0001,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 2.5, color: kPrimaryColor)),
      width: size.width * 0.35,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(textColor),
              backgroundColor: MaterialStateProperty.all(color),
              padding: MaterialStateProperty.all(
                  EdgeInsets.symmetric(vertical: 20, horizontal: 12)),
            ),
            onPressed: () => press(),
            child: Text(text)),
      ),
    );
  }
}
