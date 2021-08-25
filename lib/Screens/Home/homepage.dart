import 'package:shared_preferences/shared_preferences.dart';
import 'package:shelf/Api/api.dart';
import 'package:shelf/Screens/AnalyticsPage/analytics_screen.dart';

import 'package:shelf/Screens/CreateEvent/CreateEvent.dart';
import 'package:shelf/Screens/EventsPage/event_screen.dart';
import 'package:shelf/Screens/Home/components/body.dart';
import 'package:flutter/material.dart';
import 'package:shelf/Screens/Login/login_screen.dart';
import 'package:shelf/providers/is_user_admin.dart';

import '../ProfilePage/ProfilePage.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> with TickerProviderStateMixin {
  late TabController _tabController;
  late TabController _admintabController;
  late SharedPreferences sharedPreferences;


  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    checkLoginStatus();
    _admintabController = new TabController(length: 2, vsync: this);
    _tabController = new TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    // ignore: todo
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
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
      home: FutureBuilder<bool?>(
          future: isUserAdmin(),
          builder: (BuildContext context, AsyncSnapshot<bool?> snapshot) {
            if (snapshot.data == false) {
              return Scaffold(
                body: TabBarView(
                  children: <Widget>[
                    Body(),
                    AnalyticsScreen(),
                    //EventScreen(),
                    ProfilePage(),
                  ],
                  physics: NeverScrollableScrollPhysics(),
                  controller: _tabController,
                ),
                bottomNavigationBar: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(
                    32,
                  )),
                  child: Container(
                    decoration: BoxDecoration(
                      //Border.all

                      border: Border.all(
                          color: Colors.grey,
                          width: 1.0,
                          style: BorderStyle.none), //Border.all

                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50.0),
                        topRight: Radius.circular(50.0),
                        bottomLeft: Radius.circular(50.0),
                        bottomRight: Radius.circular(50.0),
                      ),
                      boxShadow: [
                        //background color of box
                        BoxShadow(
                          color: Colors.grey,
                          offset: const Offset(
                            5.0,
                            5.0,
                          ),
                          blurRadius: 400,
                          spreadRadius: -8.0,
                        ),

                        BoxShadow(
                          color: Colors.white,
                          blurRadius: 0.0, // soften the shadow
                          spreadRadius: 0.0, //extend the shadow
                          offset: Offset(
                            0.0, // Move to right 10  horizontally
                            0.0, // Move to bottom 10 Vertically
                          ),
                        )
                      ],
                    ),
                    child: TabBar(
                      labelColor: Colors.black,
                      unselectedLabelColor: Color(0xFF949494),
                      labelStyle: TextStyle(fontSize: 10.0),
                      indicator: UnderlineTabIndicator(
                        borderSide: BorderSide(color: Colors.black, width: 0.0),
                        insets: EdgeInsets.fromLTRB(50.0, 0.0, 50.0, 10.0),
                      ),
                      indicatorColor: Colors.black,
                      tabs: <Widget>[
                        Tab(
                          icon: Icon(
                            Icons.home,
                            size: 24.0,
                          ),
                          text: "Home",
                        ),
                        Tab(
                          icon: Icon(
                            Icons.emoji_events,
                            size: 24.0,
                          ),
                          text: "Event",
                        ),
                        Tab(
                          icon: Icon(
                            Icons.account_circle_outlined,
                            size: 24.0,
                          ),
                          text: "Profile",
                        ),
                      ],
                      controller: _tabController,
                    ),
                  ),
                ),
              );
            } else {
              return Scaffold(
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.endDocked,
                floatingActionButton: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(width: size.width * 0.06),
                          Center(
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                vertical: 28,
                              ),
                              height: size.height * 0.1,
                              width: size.width * 0.13,
                              child: FloatingActionButton(
                                backgroundColor: Colors.white,
                                child: Container(
                                  child: Icon(
                                    Icons.add_circle,
                                    color: Color(0xffFF7A45),
                                    size: 58,
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CreateEvent()),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                body: TabBarView(
                  children: <Widget>[
                    Body(),
                    // EventScreen(),
                    // AnalyticsScreen(),
                    ProfilePage(),
                  ],
                  physics: NeverScrollableScrollPhysics(),
                  controller: _admintabController,
                ),
                bottomNavigationBar: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(
                    32,
                  )),
                  child: Container(
                    decoration: BoxDecoration(
                      //Border.all

                      border: Border.all(
                          color: Colors.grey,
                          width: 1.0,
                          style: BorderStyle.none), //Border.all

                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50.0),
                        topRight: Radius.circular(50.0),
                        bottomLeft: Radius.circular(50.0),
                        bottomRight: Radius.circular(50.0),
                      ),
                      boxShadow: [
                        //background color of box
                        BoxShadow(
                          color: Colors.grey,
                          offset: const Offset(
                            5.0,
                            5.0,
                          ),
                          blurRadius: 400,
                          spreadRadius: -8.0,
                        ),

                        BoxShadow(
                          color: Colors.white,
                          blurRadius: 0.0, // soften the shadow
                          spreadRadius: 0.0, //extend the shadow
                          offset: Offset(
                            0.0, // Move to right 10  horizontally
                            0.0, // Move to bottom 10 Vertically
                          ),
                        )
                      ],
                    ),
                    child: TabBar(
                      labelColor: Colors.black,
                      unselectedLabelColor: Color(0xFF949494),
                      labelStyle: TextStyle(fontSize: 10.0),
                      indicator: UnderlineTabIndicator(
                        borderSide: BorderSide(color: Colors.black, width: 0.0),
                        insets: EdgeInsets.fromLTRB(50.0, 0.0, 50.0, 10.0),
                      ),
                      indicatorColor: Colors.black,
                      tabs: <Widget>[
                        Tab(
                          icon: Icon(
                            Icons.home,
                            size: 24.0,
                          ),
                          text: "Home",
                        ),
                        // Tab(
                        //   icon: Icon(
                        //     Icons.emoji_events,
                        //     size: 24.0,
                        //   ),
                        //   text: "Event",
                        // ),
                        // Tab(
                        //   icon: Icon(
                        //     Icons.analytics_outlined,
                        //     size: 24.0,
                        //   ),
                        //   text: "Analytics",
                        // ),
                        Tab(
                          icon: Icon(
                            Icons.account_circle_outlined,
                            size: 24.0,
                          ),
                          text: "Profile",
                        ),
                      ],
                      controller: _admintabController,
                    ),
                  ),
                ),
              );
            }
          }),
    );
  }
}
