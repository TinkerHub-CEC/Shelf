import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shelf/Screens/Welcome/welcome_screen.dart';
import 'package:shelf/models/verify_data.dart';
import "dart:convert";
import '../../../constants.dart';
import 'dart:async';

class VerifyAttendanceScreen extends StatefulWidget {
  @override
  _VerifyAttendanceScreenState createState() => _VerifyAttendanceScreenState();
}

class _VerifyAttendanceScreenState extends State<VerifyAttendanceScreen> {
  List<Welcome> data = [];
  PageController controller = PageController();
  Future verifyAttendance() async {
    http.Response response;
    final url = '$baseUrl/api/events/4/attendance/';
    response = await http.get(Uri.parse(url));
    print(response.body);
    if (response.statusCode == 200) {
      setState(() {
        data = welcomeFromJson(response.body);
      });
    }
  }

  Future attendanceData(int attendance) async {
    http.Response response;
    final url = '$baseUrl/api/events/4/attendance/';
    response = await http.post(
        Uri.http('$baseUrl', '/api/events/4/attendance/'),
        body: {'attendance': attendance});
    print(response.body);
    if (response.statusCode == 200) {
      setState(() {
        data = welcomeFromJson(response.body);
      });
    }
  }

  // @override
  // void indexincrement() {
  //   if (index <= lengthArray) {
  //     index++;
  //   }
  // }

  @override
  void initState() {
    verifyAttendance();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: PageView.builder(
      controller: controller,
      itemCount: data.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, position) {
        return Column(
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
                          border:
                              Border.all(color: Colors.deepOrange, width: 1)),
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

              // ** Photo Upload!!**
              child: Image(
                image: NetworkImage(data[position].photosubmission.toString()),
                fit: BoxFit.fill,
                height: size.height * 0.6,
                width: size.width * 0.8,
              ),
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
                    backgroundImage: AssetImage('assets/images/emma.jpg'),
                  ),
                  SizedBox(width: 15),
                  Text(
                    data[position].firstName.toString(),
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
                      onPressed: () => {
                        controller.nextPage(
                            duration: Duration(seconds: 1), curve: Curves.ease),
                        // controller.jumpTo(position + 1),
                      },
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
                      onPressed: () async {
                        final body = jsonEncode({
                          'attendance': 1,
                        });

                        final response = await http.post(
                            Uri.parse("$baseUrl/api/events/4/attendance/"),
                            headers: {'Content-Type': 'application/json'},
                            body: body);
                        print(response.statusCode);
                        print(response.body);
                      },
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
        );
      },
    ));
  }
}
