import 'package:shelf/Screens/Login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late SharedPreferences sharedPreferences;

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
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
    return Scaffold(
      appBar: AppBar(
        title: Text('JWT TOKEN'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              sharedPreferences.clear();
              // ignore: deprecated_member_use
              sharedPreferences.commit();
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (BuildContext context) => LoginScreen()),
                  (Route<dynamic> route) => false);
            },
            child: Text('Logout'),
          ),
        ],
      ),
      body: Center(
        child: Text('Main Page'),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('JWT'),
              accountEmail: Text('admin'),
            ),
            ListTile(
              title: Text('List Products'),
              trailing: Icon(Icons.list),
              onTap: () {},
            ),
            ListTile(
              title: Text('Add Products'),
              trailing: Icon(Icons.add),
              onTap: () {},
            ),
            ListTile(
              title: Text('Register User'),
              trailing: Icon(Icons.person_add),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
