import 'DelegatesList.dart';

import 'topbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:open_mail_app/open_mail_app.dart';
import 'package:shelf/components/rounded_button.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class TopBox extends StatelessWidget {
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
                                      'razabinshraf@gmail.com',
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


class DelegatesListPage extends StatelessWidget {
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
          DelegatesList(),
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
