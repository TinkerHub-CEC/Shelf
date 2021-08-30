import 'package:flutter/material.dart';

//rounded button stateless widget is created below

class CustomMenuBar extends StatelessWidget {
  final String text;
  const CustomMenuBar({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: 10,
        ),
        //padding: EdgeInsets.symmetric(
        //  vertical: 10,
          //horizontal: 5,
        //),
        height: size.height * 0.055,
        width: size.width * 0.8,
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
                  horizontal: 10,
                ),
                child: Icon(
                  Icons.star_rounded,
                  color: Color(0xffF7DD14),
                )),
            Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
