import 'package:shelf/components/rounded_button.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: size.height * 0.07),
          Center(
            child: Container(
              margin: EdgeInsets.symmetric(
                vertical: 10,
              ),
              padding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 5,
              ),
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
                      child: Icon(Icons.menu)),
                  Text(
                    "Event",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              vertical: 22,
            ),
            child:
                Image.asset('assets/images/event-hacktober.png', scale: 0.83),
          ),
          Container(
            child: Text(
              'Event Name 00',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            width: size.width * 0.8,
            height: size.width * 0.07,
          ),
          Container(
            margin: EdgeInsets.symmetric(
              vertical: 13,
            ),
            child: Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Egestas interdum sed faucibus lacus sem arcu. Lectus sed sed aliquam adipiscing ultrices adipiscing. Purus in sodales in in et rhoncus. Habitant at commodo urna rhoncus phasellus nulla volutpat.",
              style: TextStyle(
                fontSize: 16.8,
              ),
              textAlign: TextAlign.left,
            ),
            width: size.width * 0.8,
            height: size.width * 0.25,
          ),
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 6,
              horizontal: 18,
            ),
            margin: EdgeInsets.only(
              top: 22,
            ),
            width: size.width * 0.8,
            height: size.width * 0.07,
            child: Text(
              'Date 00-00-0000',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 6,
              horizontal: 18,
            ),
            width: size.width * 0.8,
            height: size.width * 0.07,
            child: Text(
              'Time 00:00 pm',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 6,
              horizontal: 18,
            ),
            width: size.width * 0.8,
            height: size.width * 0.07,
            child: Text(
              'Google Meet',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          SizedBox(height: size.height * 0.06),
          RoundedButton(text: "Register", press: () => {}),
        ],
      ),
    );
  }
}
