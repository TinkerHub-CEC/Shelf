import 'package:flutter/material.dart';
import 'package:shelf/size_config.dart';

//rounded button stateless widget is created below

class CustomMenuBar extends StatelessWidget {
  final String text;
  const CustomMenuBar({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: SizeConfig.safeBlockVertical * 1.0,
          horizontal: SizeConfig.safeBlockHorizontal * 6.5,
        ),
        //padding: EdgeInsets.symmetric(
        //  vertical: 10,
        //horizontal: 5,
        //),
        height: SizeConfig.safeBlockVertical * 5,
        width: SizeConfig.safeBlockHorizontal * 80,
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xffE1E8E8)),
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
        ),

        // borderRadius: BorderRadius.circular(32),
        child: Row(
          children: [
            Container(
                margin: EdgeInsets.symmetric(
                  horizontal: SizeConfig.safeBlockHorizontal * 2.0,
                ),
                child: Icon(
                  Icons.star_rounded,
                  color: Color(0xffF7DD14),
                )),
            Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: SizeConfig.safeBlockHorizontal * 4.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
