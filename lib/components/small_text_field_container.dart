import 'package:flutter/material.dart';
import 'package:shelf/size_config.dart';

import '../constants.dart';

//Text Field Container Stateless Widget is created below

class SmallTextFieldContainer extends StatelessWidget {
  final Widget child;
  const SmallTextFieldContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

//   @override
//   _SmallTextFieldContainerState createState() =>
//       _SmallTextFieldContainerState();
// }

// class _SmallTextFieldContainerState extends State<SmallTextFieldContainer> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: SizeConfig.safeBlockVertical * 2.5,
        horizontal: SizeConfig.safeBlockVertical * 0.5,
      ),
      width: SizeConfig.blockSizeHorizontal * 30,
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.blockSizeHorizontal * 2.2,
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
