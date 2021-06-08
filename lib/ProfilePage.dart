import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        drawer: Drawer(
          child: ListView(children: [Text('data')]),
        ),
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text('Profile',
              style: TextStyle(
                color: Colors.black,
              )),
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/h.png'),
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
                child: RaisedButton.icon(
                  elevation: 0.0,
                  onPressed: () {},
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
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.emoji_events),
              label: 'Events',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
