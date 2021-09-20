import 'dart:io';

import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'package:http/http.dart' as http;
import 'package:shelf/Api/api.dart';

import 'dart:async';
import 'package:shelf/models/verify_data.dart';

import 'package:fluttertoast/fluttertoast.dart';

// ignore: camel_case_types
class submitAttendance extends StatefulWidget {
  final events;

  submitAttendance(this.events);

  //const submitAttendance({Key? key, this.events}) : super(key: key);

  @override
  _submitAttendanceState createState() => _submitAttendanceState();
}

// ignore: camel_case_types
class _submitAttendanceState extends State<submitAttendance> {
  var selectedRadio;

  @override
  void initState() {
    super.initState();
    selectedRadio = 0;
  }

  setSelected(var val) {
    setState(() {
      selectedRadio = val;
    });
  }

  List<Welcome> data = [];

  Future submitAttendance() async {
    var id = widget.events['id'];
    http.Response response;
    final token_data = await getData('auth_data');
    final url = '$baseUrl/api/events/$id/attendance/';
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

  presentButton(var val) async {
    var id = widget.events['id'];
    var userId = await getValue('auth_user_id');
    print(userId);
    print(id);
    final token_data = await getData('auth_data');
    if (val == 1) {
      // var datauser = widget.events['user'].toString();
      // print(datauser);
      final tokenData = await getData('auth_data');
      Map<String, String> headers = {
        HttpHeaders.authorizationHeader: 'Bearer ' + tokenData!
      };
      Uri url = Uri.parse("$baseUrl/api/events/$id/attendance/");

      var sendRequest = http.MultipartRequest("PUT", url);
      sendRequest.headers.addAll(headers);

      sendRequest.fields['attendance'] = 1.toString();
      sendRequest.fields['user'] = userId.toString();

      http.StreamedResponse response = await sendRequest.send();
      final finalResp = await http.Response.fromStream(response);
      print(finalResp.statusCode);
      if (finalResp.statusCode == 201) {
        Fluttertoast.showToast(
            msg: "Attendance Submitted",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.grey[800],
            textColor: Colors.black,
            fontSize: 16.0);
      }
    }
  }

  absentButton(var val) async {
    var id = widget.events['id'];
    final token_data = await getData('auth_data');
    var userId = await getValue('auth_user_id');
    print(userId);
    if (val == 2) {
      // var datauser = widget.events['user'].toString();
      final tokenData = await getData('auth_data');
      Map<String, String> headers = {
        HttpHeaders.authorizationHeader: 'Bearer ' + tokenData!
      };
      Uri url = Uri.parse("$baseUrl/api/events/$id/attendance/");

      var sendRequest = http.MultipartRequest("PUT", url);
      sendRequest.headers.addAll(headers);

      sendRequest.fields['attendance'] = 2.toString();
      sendRequest.fields['user'] = userId.toString();

      http.StreamedResponse response = await sendRequest.send();
      final finalResp = await http.Response.fromStream(response);
      print(finalResp.statusCode);
      print(finalResp.body);
      if (finalResp.statusCode == 201) {
        Fluttertoast.showToast(
            msg: "Attendance Submitted",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.grey[800],
            textColor: Colors.black,
            fontSize: 16.0);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: size.height * 0.07),
            // CustomMenuBar(text: "Submit Attendance"),
            Center(
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
                      child: IconButton(
                        highlightColor: Colors.white,
                        iconSize: 22,
                        icon: Icon(Icons.arrow_back),
                        color: Colors.black,
                        onPressed: () => Navigator.pop(context, false),
                      ),
                      // child: Icon(
                      //   Icons.star_rounded,
                      //   color: Color(0xffF7DD14),)
                    ),
                    Text(
                      "Submit Attendance",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // SizedBox(height: size.height * 0.02),
            // Container(
            //   width: size.width * 0.8,
            //   height: size.height * 0.07,
            //   child: Text(
            //     "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin euismod nulla sed pellentesque dignissim. Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
            //     textAlign: TextAlign.left,
            //     style: TextStyle(
            //         fontSize: 12, fontWeight: FontWeight.bold, height: 1.5),
            //   ),
            // ),
            SizedBox(
              height: size.height * 0.07,
            ),

            Container(
              width: size.width * 0.8,
              height: size.height * 0.08,
              decoration: BoxDecoration(
                  border: Border.all(
                color: Color.fromRGBO(56, 90, 100, 1),
                width: 2,
              )),
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Text(
                    "Present",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(width: size.width * 0.45),
                  Radio(
                    value: 1,
                    groupValue: selectedRadio,
                    onChanged: (val) {
                      print('$val');
                      setSelected(val);
                    },
                  ),
                  // Icon(
                  //   Icons.check_box,
                  //   size: 20,
                  // ),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.01),
            Container(
              width: size.width * 0.8,
              height: size.height * 0.08,
              decoration: BoxDecoration(
                  border: Border.all(
                color: Color.fromRGBO(56, 90, 100, 1),
                width: 2,
              )),
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Text(
                    "Absent",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(width: size.width * 0.46),
                  Radio(
                    value: 2,
                    groupValue: selectedRadio,
                    onChanged: (val) {
                      print('$val');
                      setSelected(val);
                    },
                  ),
                  // Icon(
                  //   Icons.check_box,
                  //   size: 20,
                  // ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            Container(
              width: size.width * .39,
              height: size.height * 0.06,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: TextButton(
                  onPressed: () {
                    presentButton(selectedRadio);
                    absentButton(selectedRadio);
                    print('$selectedRadio');

                    Fluttertoast.showToast(
                        msg: "Attendance Submitted",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 3,
                        backgroundColor: Colors.grey[800],
                        textColor: Colors.white,
                        fontSize: 16.0);
                  },
                  child: Text("Submit Attendance"),
                  style: TextButton.styleFrom(
                      backgroundColor: Color.fromRGBO(56, 90, 100, 1),
                      primary: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
