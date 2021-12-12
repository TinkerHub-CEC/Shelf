import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:random_color/random_color.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Api/api.dart';
import 'Screens/Login/login_screen.dart';
import 'components/custom_menu_bar.dart';
import 'constants.dart';

Future<Details> fetchDetails() async {
  var userId = await getValue('auth_user_id');
  var url = "$baseUrl/api/users/$userId/";
  final data = await getData('auth_data');
  var response = await http.get(
    Uri.parse(url),
    headers: {HttpHeaders.authorizationHeader: 'Bearer ' + data!},
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    print(response.body);
    return Details.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load Profile Page');
  }
}

class Details {
  var id;
  var email;
  var username;
  var first_name;
  var last_name;
  var roll_no;
  var semester;
  var batch;

  Details({
    required this.id,
    required this.email,
    required this.username,
    required this.first_name,
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
  @override
  void initState() {
    super.initState();
    futureAlbum = fetchDetails();
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
                            SharedPreferences sharedPreferences =
                                await SharedPreferences.getInstance();
                            sharedPreferences.setBool('islogged', false);
                            final d = sharedPreferences.getBool('islogged');
                            print('logged out - removing email: $d');
                            sharedPreferences.remove('email');
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        LoginScreen()),
                                (Route<dynamic> route) => false);
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
