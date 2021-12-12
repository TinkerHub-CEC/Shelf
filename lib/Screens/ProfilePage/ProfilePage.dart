import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shelf/Screens/Login/login_screen.dart';
import 'package:shelf/Screens/VerifyAttendance/verify_attendance.dart';
import 'package:shelf/components/custom_menu_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late SharedPreferences sharedPreferences;
  @override
  void initState() {
    super.initState();
  }

  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString("token") == null) {
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
        drawer: Drawer(
          child: ListView(children: [
            TextButton(
                child: Text('Attendance Page'),
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => VerifyAttendanceScreen()),
                  // );
                })
          ]),
        ),

        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: size.height * 0.07),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomMenuBar(text: "Profile"),
              ],
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/h_photo.png'),
                  radius: 40.0,
                ),
              ),
            ),
            Center(
              child: Text('Nameofstudent',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            Center(
              child: Text('student@gmail.com'),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 40.0, 0.0, 0.0),
                  child: Text('S3C BATCH'),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(160.0, 40.0, 10.0, 0.0),
                  child: Text('CHN19CS052'),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 1.0),
              child: SizedBox(
                width: double.infinity,
                // ignore: deprecated_member_use
                child: RaisedButton.icon(
                  elevation: 0.0,
                  onPressed: () {},
                  icon: Icon(
                    Icons.edit,
                  ),
                  label: Text('Edit Profile Details'),
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.black)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 1.0, 20.0, 10.0),
              child: SizedBox(
                width: double.infinity,
                // ignore: deprecated_member_use
                child: RaisedButton.icon(
                  elevation: 0.0,
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => VerifyAttendanceScreen()),
                    // );
                  },
                  icon: Icon(
                    Icons.settings,
                  ),
                  label: Text('Account Settings'),
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.black)),
                ),
              ),
            ),
            Center(
              child: TextButton(
                onPressed: () async {
                  SharedPreferences sharedPreferences =
                      await SharedPreferences.getInstance();
                  sharedPreferences.setBool('islogged', false);
                  final d = sharedPreferences.getBool('islogged');
                  print('logged out - removing email: $d');
                  sharedPreferences.remove('email');
                  sharedPreferences.remove('auth_data');
                  sharedPreferences.remove('token');
                  print('logged out - removing token: $d');
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (BuildContext context) => LoginScreen()),
                      (Route<dynamic> route) => false);
                },
                child: Text('Logout'),
              ),
            ),
          ],
        ),
        // bottomNavigationBar: BottomNavigationBar(
        //   items: const <BottomNavigationBarItem>[
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.home),
        //       label: 'Home',
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.emoji_events),
        //       label: 'Events',
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.account_circle_outlined),
        //       label: 'Profile',
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
