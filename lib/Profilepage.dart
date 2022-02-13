// ignore_for_file: non_constant_identifier_names, duplicate_ignore

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:random_color/random_color.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shelf/providers/session_timedout.dart';

import 'Api/api.dart';
import 'Screens/Login/login_screen.dart';
import 'components/custom_menu_bar.dart';
import 'constants.dart';

Future<Details> fetchDetails(BuildContext context) async {
  var userId = await getValue('auth_user_id');
  var url = "$baseUrl/api/users/$userId/";
  final data = await getData('auth_data');
  var response = await http.get(
    Uri.parse(url),
    headers: {HttpHeaders.authorizationHeader: 'Bearer ' + data!},
  );

  print("Fetch Profile Details Status Code:${response.statusCode}");

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    print(response.body);
    return Details.fromJson(jsonDecode(response.body));
  } else if (response.statusCode == 401) {
    sessionTimeOut(context);

    throw Exception('Session Timed Out Error');
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load Profile Page');
  }
}

// ignore: duplicate_ignore
class Details {
  var id;
  var email;
  var username;
  var first_name;
  var last_name;
  // ignore: non_constant_identifier_names
  var roll_no;
  var semester;
  var batch;

  // ignore: duplicate_ignore
  Details({
    required this.id,
    required this.email,
    required this.username,
    required this.first_name,
    // ignore: non_constant_identifier_names
    required this.last_name,
    required this.roll_no,
    required this.semester,
    required this.batch,
  });

  factory Details.fromJson(Map<String, dynamic> json) {
    return Details(
        id: json['id'],
        email: json['email'],
        username: json['username'],
        first_name: json['first_name'],
        last_name: json['last_name'],
        roll_no: json['roll_no'],
        semester: json['semester'],
        batch: json['batch']);
  }
}

void main() => runApp(Profiledetails());

class Profiledetails extends StatefulWidget {
  const Profiledetails({Key? key}) : super(key: key);

  @override
  _ProfiledetailsState createState() => _ProfiledetailsState();
}

class _ProfiledetailsState extends State<Profiledetails> {
  late Future<Details> futureAlbum;
  RandomColor _randomColor = RandomColor();
  late SharedPreferences sharedPreferences;
  var email;
  @override
  void initState() {
    super.initState();
    futureAlbum = fetchDetails(context);
  }

  checkLoginStatus() async {
    print("Calling checkLoginStatus from ProfilePage");
    sharedPreferences = await SharedPreferences.getInstance();

    email = sharedPreferences.getString("email");

    print(email);
    if (sharedPreferences.getString("auth_data") == null || email == null) {
      print("Logging Out...");
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => LoginScreen()),
          (Route<dynamic> route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: FutureBuilder<Details>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Container(
                  width: size.width * 1,
                  height: size.height * .90,
                  //height:1000,
                  //width:1000,
                  child: Column(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      //SizedBox(height: size.height * 0.07),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 30, 0, 8),
                        child: Row(
                          //mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 30),
                              child: CustomMenuBar(text: "Profile"),
                            ),
                          ],
                        ),
                      ),
                      Stack(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.symmetric(
                              vertical: size.height * .13,
                              horizontal: size.width * .1,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Color(0xffe3e3e3)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 30),
                                    child: Text(
                                        snapshot.data!.first_name +
                                            ' ' +
                                            snapshot.data!.last_name,
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ),
                                ),
                                Center(
                                  child: Text(snapshot.data!.email),
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10.0, 40.0, 0.0, 10.0),
                                      child: Text('S' +
                                          snapshot.data!.semester +
                                          snapshot.data!.batch),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          150.0, 40.0, 10.0, 0.0),
                                      child: Text(snapshot.data!.roll_no),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 40.0),
                              child: CircleAvatar(
                                minRadius: 40,
                                maxRadius: 40,
                                backgroundColor: _randomColor.randomColor(),
                                child: Text(
                                  '${snapshot.data!.first_name[0]}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 1.0),
                      //   child: SizedBox(
                      //     width: double.infinity,
                      //     // ignore: deprecated_member_use
                      //     child: RaisedButton.icon(
                      //       elevation: 0.0,
                      //       onPressed: () {},
                      //       icon: Icon(
                      //         Icons.edit,
                      //       ),
                      //       label: Text('Edit Profile Details'),
                      //       color: Colors.white,
                      //       shape: RoundedRectangleBorder(
                      //           borderRadius: BorderRadius.circular(18.0),
                      //           side: BorderSide(color: Colors.black)),
                      //     ),
                      //   ),
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.fromLTRB(20.0, 1.0, 20.0, 10.0),
                      //   child: SizedBox(
                      //     width: double.infinity,
                      //     // ignore: deprecated_member_use
                      //     child: RaisedButton.icon(
                      //       elevation: 0.0,
                      //       onPressed: () {
                      //         // Navigator.push(
                      //         //   context,
                      //         //   MaterialPageRoute(
                      //         //       builder: (context) => VerifyAttendanceScreen()),
                      //         // );
                      //       },
                      //       icon: Icon(
                      //         Icons.settings,
                      //       ),
                      //       label: Text('Account Settings'),
                      //       color: Colors.white,
                      //       shape: RoundedRectangleBorder(
                      //           borderRadius: BorderRadius.circular(18.0),
                      //           side: BorderSide(color: Colors.black)),
                      //     ),
                      //   ),
                      // ),
                      Center(
                        child: TextButton(
                          onPressed: () async {
                            Timer(Duration(seconds: 5), () async {
                              SharedPreferences sharedPreferences =
                                  await SharedPreferences.getInstance();

                              sharedPreferences.remove('email');
                              sharedPreferences.remove('auth_data');
                              sharedPreferences.remove('token');
                              sharedPreferences.remove('islogged');
                              print(sharedPreferences.getString("auth_data"));
                              print(sharedPreferences.getString("token"));
                              print(sharedPreferences.getBool("islogged"));
                              print(sharedPreferences.getString("email"));

                              checkLoginStatus();
                            });
                          },
                          child: Text('Logout'),
                        ),
                      ),
                    ],
                  ),
                );
                //Text(snapshot.data!.username);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
