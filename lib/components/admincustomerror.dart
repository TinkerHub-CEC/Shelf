import 'package:flutter/material.dart';


class Customerror extends StatelessWidget {
  final String text;
  const Customerror({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: size.height * 0.28),
            Container(
              child: Image.asset('assets/images/customerror-vector.jpg'),
            ),
            SizedBox(height: size.height * 0.1),
            Text(
              text,
              style: TextStyle(
                  fontSize: size.height * 0.03, fontWeight: FontWeight.bold),
            ),
            // SizedBox(height: size.height * 0.07),
            // Container(
            //   width: size.width * .4,
            //   height: size.height * 0.05,
            //   child: TextButton(
            //     onPressed: () => Navigator.of(context).pushAndRemoveUntil(
            //         MaterialPageRoute(
            //             builder: (BuildContext context) => CreateEvent()),
            //         (Route<dynamic> route) => false),
            //     child: Text(
            //       "Create a event",
            //       style: TextStyle(fontSize: 16),
            //     ),
            //     style: TextButton.styleFrom(
            //         backgroundColor: Color.fromRGBO(255, 122, 69, 1),
            //         primary: Colors.white),
            // ),
            // ),
          ],
        ),
      ),
    );
  }
}
