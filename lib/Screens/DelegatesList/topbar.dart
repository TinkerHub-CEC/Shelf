import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:open_mail_app/open_mail_app.dart';
import 'package:shelf/Api/api.dart';
import 'package:shelf/components/rounded_button.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:convert';
import '../../constants.dart';

// ignore: must_be_immutable
class TopBox extends StatelessWidget {
  final eventId;
  const TopBox(
      {Key? key,
        required this.eventId})
      : super(key: key);


  getEmail(delegates){
    var email=delegates['email'];
    print(email);
  }
 final bool adminUser = true;
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
                              ),fixedSize: Size(100, 34)),

                            child: Text('Send Mail:',
                                style:TextStyle(
                                  color:Colors.black,
                                )),

                            onPressed: () async {
                              var apps=await OpenMailApp.getMailApps();
                              List delegates = [];
                              List<String> emails=[];
                              var url = "$baseUrl/api/events/$eventId/registrations/";
                              final data = await getData('auth_data');
                              /*var email = delegates['email'];*/
                              var response = await http.get(
                              Uri.parse(url),
                              headers: {HttpHeaders.authorizationHeader: 'Bearer ' + data!},
                              );
                              print(response.body);
                              if (response.statusCode == 200) {
                                delegates = json.decode(response.body);
                                /*getEmail(delegates);*/

                                for(int i=0;i<delegates.length;i++)
                                {emails.add(delegates[i]['email']);
                                }
                                /*emails.remove(']');*/
                                print(emails);
                              }
                              /*var result=await OpenMailApp.openMailApp(nativePickerTitle: 'select email app to open',);*/
                              showDialog(context: context, builder:(context){
                                return MailAppPickerDialog(mailApps: apps,
                                emailContent: EmailContent(
                                  to: emails,

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
