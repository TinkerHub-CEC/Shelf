import 'package:flutter/material.dart';

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
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 10,
      ),
      width: size.width * 0.39,
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color: textFieldColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: child,
    );
  }
}
