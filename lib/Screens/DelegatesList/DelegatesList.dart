import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:random_color/random_color.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shelf/Api/api.dart';
import 'package:shelf/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:math' as math;
import 'package:flutter/cupertino.dart';
import 'package:shelf/constants.dart';

import 'package:open_mail_app/open_mail_app.dart';

import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable

class DelegatesList extends StatefulWidget {
  @override
  _DelegatesListState createState() => _DelegatesListState();
  final eventId;
  const DelegatesList(
      {Key? key,
        required this.eventId})
      : super(key: key);

}

class _DelegatesListState extends State<DelegatesList> {


  RandomColor _randomColor=RandomColor();
  final _random=Random();
  List delegates = [];
  bool isLoading = false;
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    this.fetchdelegates();

  }

  fetchdelegates() async {
    setState(() {
      isLoading = true;
    });
    var eventid=widget.eventId;
    var url = "$baseUrl/api/events/$eventid/registrations/";
    final data = await getData('auth_data');
    var response = await http.get(
      Uri.parse(url),
      headers: {HttpHeaders.authorizationHeader: 'Bearer ' + data!},
    );
    print(response.body);
    if (response.statusCode == 200) {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();


      delegates = json.decode(response.body);
      setState(() {
        isLoading = false;
      });
    } else {
      delegates = [];
      isLoading = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [getBody()],
    );
  }

  Widget getBody() {
    if (delegates.contains(null) || delegates.length < 0 || isLoading) {
      return Center(
          child: CircularProgressIndicator(
        valueColor: new AlwaysStoppedAnimation<Color>(kPrimaryColor),
      ));
    } else {
      return ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: delegates.length,
          itemBuilder: (context, index) {
            return getCard(delegates[index]);
          });
    }
  }

  Widget getCard(delegates) {
    Size size = MediaQuery.of(context).size;
    var first_name = delegates['first_name'];
    var last_name = delegates['last_name'];
    var semester = delegates['semester'];
    var batch = delegates['batch'];

    return GestureDetector(
      onTap: () {
        print("object");
      },
      child: Container(
        width: size.width * .85,
        height: size.height * .08,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
        decoration: BoxDecoration(
            color: Colors.white,
            border:Border.all(color:Color(0xffe3e3e3)),
            borderRadius: BorderRadius.circular(5),

            /*boxShadow: [
              BoxShadow(
                  blurRadius: 10,
                  offset: const Offset(0, 0),
                  spreadRadius: 5,
                  color: Colors.black12)
            ]*/),
        child: ListTile(
          minVerticalPadding: 0,
          contentPadding: EdgeInsets.zero,
          title: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: CircleAvatar(
                  backgroundColor:
                      _randomColor.randomColor(),
                  child: Text('${first_name[0]}',
                  style: TextStyle(color:Colors.white),
                  ),
                ),
              ),
              Container(
                width: size.width * .40,
                child: Column(
                  children: [
                    Align(
                  alignment:Alignment.centerLeft,
                      child: Container(
                        width: size.width * .40,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(12, 8,0, 0),
                          child: Text(
                            first_name+' '+last_name,
                            style:
                                TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
              ),



                    Align(
                      alignment:Alignment.centerLeft,
                       child: Container(
                     width: size.width * .20,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12 ),
                        child: Text(
                          'S' + semester + batch,
                          style:
                              TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    ),
                  ],
                ),
              ),
            Container(
                width: size.width * .20,
                 margin:const EdgeInsets.only(left: 30.0),child: Icon(Icons.check_circle_outline_sharp)),



            ],
          ),
        ),
      ),
    );
  }
}

