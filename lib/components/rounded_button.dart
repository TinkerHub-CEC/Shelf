import 'package:shelf/constants.dart';
import 'package:flutter/material.dart';
import 'package:shelf/size_config.dart';

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
    SizeConfig().init(context);
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: SizeConfig.blockSizeVertical * 4,
        horizontal: SizeConfig.safeBlockVertical * 3.5,
      ),
      width: SizeConfig.blockSizeHorizontal * 71,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(textColor),
              backgroundColor: MaterialStateProperty.all(color),
              padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                  vertical: SizeConfig.blockSizeHorizontal * 4.5,
                  horizontal: SizeConfig.blockSizeHorizontal * 5)),
            ),
            onPressed: () => press(),
            child: Text(text)),
      ),
    );
  }
}
