import 'DelegatesList.dart';

import 'topbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:open_mail_app/open_mail_app.dart';
import 'package:shelf/components/rounded_button.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable



class DelegatesListPage extends StatelessWidget {
  final eventId;
  const DelegatesListPage(
      {Key? key,
        required this.eventId})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
        home: SafeArea(
        top: true,
        child: Scaffold(

        drawer: Drawer(
        child: ListView(
        children: [Text('data')]),
    ),


    body: SingleChildScrollView(
    child: Container(
      height: size.height,
      width: size.width,
      child: //Column(

      ListView(
        physics: ScrollPhysics(),
        scrollDirection: Axis.vertical,
        children: <Widget>[
          SizedBox(height: size.height * 0.04),
          TopBox(),

          SizedBox(height: size.height * 0.04),

          SizedBox(height: size.height * 0.02),
          DelegatesList(eventId: eventId,),
          SizedBox(height: size.height * 0.04),

        ],
      ),
      //  ],
    ),
    ),
    ),
        ),
    );

  }
}
