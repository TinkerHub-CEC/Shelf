import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shelf/Api/api.dart';
import 'package:shelf/Screens/Welcome/welcome_screen.dart';
import 'package:shelf/components/custom_menu_bar.dart';
import 'package:shelf/models/verify_data.dart';
import "dart:convert";
import '../../../constants.dart';
import 'dart:async';

class VerifyAttendanceScreen extends StatefulWidget {
  final eventId;
  const VerifyAttendanceScreen({
    required this.eventId,
  });

  @override
  _VerifyAttendanceScreenState createState() => _VerifyAttendanceScreenState();
}

class _VerifyAttendanceScreenState extends State<VerifyAttendanceScreen> {
  List<Welcome> data = [];
  // var verifyid = $widget.eventId;
  PageController controller = PageController();
  Future verifyAttendance() async {
    http.Response response;
    final token_data = await getData('auth_data');
    final url = '$baseUrl/api/events/${widget.eventId}/attendance/';

    response = await http.get(
      Uri.parse(url),
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer ' + token_data!,
      },
    );
    print(response.body);
    if (response.statusCode == 200) {
      setState(() {
        data = welcomeFromJson(response.body);
      });
    }
  }

  Future attendanceData(int attendance) async {
    http.Response response;
    final url = '$baseUrl/api/events/${widget.eventId}/attendance/';

    response = await http.post(
        Uri.http('$baseUrl', '/api/events/${widget.eventId}/attendance/'),
        body: {'attendance': attendance});
    print(widget.eventId);
    print(response.body);
    print(response.statusCode);
    print(widget.eventId);
    if (response.statusCode == 200) {
      setState(() {
        data = welcomeFromJson(response.body);
        print(response.statusCode);
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
            CustomMenuBar(text: "Verify Attendance"),

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
                    // backgroundColor: Colors.brown.shade800,
                    // child: Text('${data[position].firstName.toString()}'),
                    backgroundImage: AssetImage('assets/images/emma.jpg'),
                  ),
                  SizedBox(width: size.width * 0.03),
                  Text(
                    data[position].firstName.toString() +
                        ' ' +
                        data[position].lastName.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(width: size.width * 0.28),
                  Text(
                    'S' +
                        data[position].semester.toString() +
                        data[position].batch.toString(),
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
                      onPressed: () async {
                        controller.nextPage(
                          duration: Duration(seconds: 1),
                          curve: Curves.ease,
                        );

                        // final bodys = jsonEncode(
                        //     {'attendance': 2, 'user': data[position].user});

                        // final token_data = await getData('auth_data');

                        // final response = await http.put(
                        //     Uri.parse(
                        //         "$baseUrl/api/events/${widget.eventId}/attendance/"),
                        //     headers: {
                        //       HttpHeaders.authorizationHeader:
                        //           'Bearer ' + token_data!,
                        //     },
                        //     body: bodys);
                        // print(response.statusCode);
                        // print(response.body);

                        // controller.jumpTo(position + 1),
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
                        controller.nextPage(
                          duration: Duration(seconds: 1),
                          curve: Curves.ease,
                        );
                        var datauser = data[position].user.toString();
                        final tokenData = await getData('auth_data');
                        Map<String, String> headers = {
                          HttpHeaders.authorizationHeader:
                              'Bearer ' + tokenData!
                        };
                        Uri url = Uri.parse(
                            "$baseUrl/api/events/${widget.eventId}/attendance/");

                        var sendRequest = http.MultipartRequest("PUT", url);
                        sendRequest.headers.addAll(headers);

                        sendRequest.fields['attendance'] = 1.toString();
                        sendRequest.fields['user'] = datauser;

                        http.StreamedResponse response =
                            await sendRequest.send();
                        final finalResp =
                            await http.Response.fromStream(response);
                        print(finalResp.statusCode);

                        // final bodys = jsonEncode(
                        //     {'attendance': 1, 'user': data[position].user});

                        // final response = await http.put(
                        //     Uri.parse(
                        //         "$baseUrl/api/events/${widget.eventId}/attendance/"),
                        //     headers: {
                        //       HttpHeaders.authorizationHeader:
                        //           'Bearer ' + token_data!
                        //     },
                        //     body: bodys);
                        // print(response.statusCode);
                        // print(response.body);
                        // print(data[position].user);
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
              ],
            ),
          ],
        );
      },
    ));
  }
}
