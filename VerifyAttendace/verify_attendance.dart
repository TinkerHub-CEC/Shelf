import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        //use MaterialApp() widget like this
        home: Home() //create new widget class for this 'home' to
        // escape 'No MediaQuery widget found' error
        );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
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
              child: Row(
                children: [
                  Container(
                    width: size.width * .07,
                    alignment: Alignment.center,
                    child: Text(
                      "A",
                      style: TextStyle(fontSize: 15),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.black12,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.deepOrange, width: 1)),
                  ),
                  SizedBox(width: size.width * 0.07),
                  Text(
                    "Verify Attendance",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),

          //image upload
          SizedBox(height: 10),
          Container(
            margin: EdgeInsets.symmetric(
              vertical: 10,
            ),
            height: size.height * 0.54,
            width: size.width * 0.8,

            decoration: BoxDecoration(
              border: Border.all(color: Color(0xffE1E8E8)),
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
            ),

            //** Photo Upload!!**
            // child: Image(
            //   image: AssetImage('assets/sky.jpg'),
            //   fit: BoxFit.contain,
            //   height: size.height * 0.6,
            //   width: size.width * 0.8,
            // ),
          ),

          //name class profile

          SizedBox(height: 10),
          Container(
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
            child: Row(
              children: [
                CircleAvatar(
                  radius: 15,
                  backgroundImage: AssetImage('assets/girl.jpg'),
                ),
                SizedBox(width: 15),
                Text(
                  "Name of Student",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                SizedBox(width: 15),
                Text(
                  "Class and Batch",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),

          //accept and deny
          SizedBox(
            height: 10,
          ),

          Row(
            children: [
              SizedBox(
                width: size.width * 0.1,
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: 10,
                ),
                width: size.width * .26,
                height: size.height * 0.07,
                child: ClipRRect(
                  child: TextButton(
                    onPressed: () => {},
                    child: Text("Accept"),
                    style: TextButton.styleFrom(
                        backgroundColor: Color.fromRGBO(189, 255, 187, 1),
                        primary: Colors.black,
                        textStyle: TextStyle(
                          fontSize: 16,
                        )),
                  ),
                ),
              ),
              SizedBox(
                width: size.width * 0.28,
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: 10,
                ),
                width: size.width * .26,
                height: size.height * 0.07,
                child: ClipRRect(
                  child: TextButton(
                    onPressed: () => {},
                    child: Text("Deny"),
                    style: TextButton.styleFrom(
                        backgroundColor: Color.fromRGBO(255, 178, 178, 1),
                        primary: Colors.black,
                        textStyle: TextStyle(
                          fontSize: 16,
                        )),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
