import 'dart:convert';
import 'dart:io';
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
}

class _DelegatesListState extends State<DelegatesList> {
  List delegates= [];
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
    var url = "$baseUrl/api/events/4/registrations/";
    final data=await getData('auth_data');
    var response = await http.get(Uri.parse(url),headers:{HttpHeaders.authorizationHeader:'Bearer'+data!},);
    print(response.body);
    if (response.statusCode == 200) {
      SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
      /*storeData('auth_data', jsonResponse['access']);
      storeData('token',jsonResponse['refresh']);
      sharedPreferences.setString('refresh',jsonResponse['refresh']);
      sharedPreferences.setBool('islogged',true);
      final a=await getData('auth_data');
      final b=await getData('refresh_token');

      Map<String?,dynamic> decodeauthToken=JwtDecoder.decode(jsonResponse['access']);
      Map<String?,dynamic> decoderefreshToken=JwtDecoder.decode(jsonResponse['refresh']);
      sharedPreferences.setBool('isAdminUser',decodedrefreshToken['is_superuser']);*/

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
    }
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: delegates.length,
        itemBuilder: (context, index) {
          return getCard(delegates[index]);
        });
  }

  Widget getCard(delegates) {
    Size size = MediaQuery.of(context).size;
    var name = delegates['first_name'];
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
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  blurRadius: 10,
                  offset: const Offset(0, 0),
                  spreadRadius: 5,
                  color: Colors.black12)
            ]),
        child: ListTile(
          minVerticalPadding: 0,
          contentPadding: EdgeInsets.zero,
          title: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: CircleAvatar(
                  backgroundColor:Color((math.Random().nextDouble()*0xFFFFFF).toInt()).withOpacity(1.0) ,
                  child: Text('${name[0]}'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 12, 0, 0),
                child: Column(
                  children: [
                    Text(
                      name,
                      style:
                      TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'S'+semester+batch,
                      style:
                      TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
              child: Icon(
                    Icons.check_circle_outline_sharp
                  ),
            ),




            ],
          ),
        ),
      ),
    );
  }
}
class TopBox extends StatelessWidget {
  List delegates= [];
  fetchEmail() async {

    var url = "$baseUrl/api/events/4/registrations/";
    var response = await http.get(Uri.parse(url));
    final result=json.decode(response.body);
    Iterable list=result['email'];
    print(list);
    print(response.body);
    if (response.statusCode == 200) {
      delegates = json.decode(response.body);

    } else {
      delegates = [];

    }
  }


/*  Widget getBody() {

    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: delegates.length,
        itemBuilder: (context, index) {
          return getCard1(delegates[index]);
        });
  }*/

 /* Widget getCard1(delegates) {

    var name = delegates['first_name'];
    var semester = delegates['semester'];
    var batch = delegates['batch'];
    var email = delegates['email'];
  }*/
  sendmails() async{
    const url='mailto:razabinashraf@gmail.com';
    if (await canLaunch(url) ){
      await launch(url);
    }
    else{
      throw 'could not launch url';
    }
  }
  bool adminUser = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: size.width * .89,
            height: size.height * .07,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    //padding: EdgeInsets.symmetric(),
                    alignment: Alignment.center,
                    width: size.width * .89, // .75,
                    height: size.height * .07,
                    decoration: BoxDecoration(
                      //color: Colors.black12,
                      border: Border.all(color: Colors.black12),

                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        SizedBox(width: size.width* .05),
                        Container(
                          width: size.width* .07,
                          alignment: Alignment.center,
                          child: Text(
                            "A",
                            style: TextStyle(fontSize: 15),
                          ),

                          decoration: BoxDecoration(
                              color: Colors.black12,
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: Colors.deepOrange, width: 1)),
                        ),
                        SizedBox(width: size.width* .05),

                        Container(
                          //color: Colors.black,
                            alignment: Alignment.centerLeft,
                            width: size.width * .40, // .58,
                            height: 30,
                            //color: Colors.red,
                            child: Text("Delegates List",
                                style: TextStyle(
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold))

                        ),
                        ElevatedButton(
                            style:ElevatedButton.styleFrom(primary:Color(0xff385A64),shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(5.0))
                            ),fixedSize: Size(92, 34)),

                            child: Text('MailTo:',
                                style:TextStyle(
                                  color:Colors.black,
                                )),

                            onPressed: () async {
                              var apps=await OpenMailApp.getMailApps();
                              /*var result=await OpenMailApp.openMailApp(nativePickerTitle: 'select email app to open',);*/
                              showDialog(context: context, builder:(context){
                                return MailAppPickerDialog(mailApps: apps,
                                  emailContent: EmailContent(
                                    to: [
                                      'razabinashraf@gmail.com',
                                    ],
                                  ),);

                              },);
                            }),
                      ],
                    ),
                  ),


                ]),
          ),
        ],
      ),
    );
  }
}
