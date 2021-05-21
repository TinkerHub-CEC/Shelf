import 'package:attendence_event/constants.dart';
import 'package:flutter/material.dart';

//rounded button stateless widget is created below

class RoundedButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color color, textColor;
  const RoundedButton({
    Key? key,
    required this.text,
    required this.press,
    this.color = kPrimaryColor,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 10,
      ),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(textColor),
              backgroundColor: MaterialStateProperty.all(color),
              padding: MaterialStateProperty.all(
                  EdgeInsets.symmetric(vertical: 20, horizontal: 40)),
            ),
            onPressed: () => press(),
            child: Text(text)),
      ),
    );
  }
}
