import 'package:flutter/material.dart';
import 'package:shelf/size_config.dart';

import '../constants.dart';

//Text Field Container Stateless Widget is created below

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

//   @override
//   _TextFieldContainerState createState() => _TextFieldContainerState();
// }

// class _TextFieldContainerState extends State<TextFieldContainer> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: SizeConfig.safeBlockVertical * 2.5,
        horizontal: SizeConfig.safeBlockVertical * 3.5,
      ),
      width: SizeConfig.blockSizeHorizontal * 71,
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.blockSizeHorizontal * 1.8,
        vertical: SizeConfig.blockSizeVertical * 0.8,
      ),
      decoration: BoxDecoration(
        color: textFieldColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: child,
    );
  }
}
