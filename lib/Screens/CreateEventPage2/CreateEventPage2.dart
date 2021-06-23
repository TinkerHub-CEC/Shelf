import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'topbar.dart';



void main() {
  runApp(CreateEvent()
  );
   }

enum Attendance{Method1,Method2,None}


class CreateEvent extends StatefulWidget {


  @override
  _CreateEventState createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {

Attendance? Type=Attendance.None;
final picker=ImagePicker();
 File? _image;
Future getImage() async{
  final image=await picker.getImage(source:ImageSource.gallery);
  setState(() {
    if (image!=null){
    _image=File(image.path);}
    else{
      print("no image selected");
    }
  });
}

  Widget build(BuildContext context) {

    return MaterialApp(
        home: SafeArea(
        top :true,
            child:Scaffold(

          drawer: Drawer(
            child: ListView(
                children: [Text('data')]),
          ),
         /* appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text(
                'Create Event',
                style: TextStyle(
                  color: Colors.black,
                )
            ),
            iconTheme: IconThemeData(color: Colors.black),
          ),*/
    //Size size=MediaQuery.of(context).size;
    /* return Container(
      margin: EdgeInsets.symmetric(
        vertical: 10,
      ),
      padding: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 5,
      ),
      //height: size.height * 0.055,
      //width: size.width * 0.8,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffE1E8E8)),
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),

      // borderRadius: BorderRadius.circular(32),
      child: Column(

       children:<Widget>[
         Row(
        children: [
          Container(
              margin: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Icon(Icons.menu)),
          Text(
            "Event",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
            ],
            ), */







                           body:SingleChildScrollView(
                         child: Column(
                             children: [
                               TopBox(),
                              /* Padding(
                           padding: const EdgeInsets.all(30.0),
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(20.0)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Create Event",
                  style: TextStyle(
                  fontSize: 15.0,
                    fontWeight: FontWeight.bold
                ),
          ),

              ],
            ),
          ),
                           ),*/


                         Column(
                             children: <Widget>[
                               Padding(
                                 padding: const EdgeInsets.all(30.0),
                                 child: Container(
                                   decoration: BoxDecoration(
                                     border: Border.all(color: Colors.black),
                                       borderRadius:BorderRadius.circular(20.0)
                                   ),

                                  /*child:
                                   Column(
                  children: <Widget>[

                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),*/
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                               Text("Upload Files"),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                /*child: _image==null?Text("select an image"):Image.file(_image)*/
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right:10.0),
                                child:   RaisedButton.icon(
                                  label: Text(""),
                                  onPressed:
                                    getImage,

                                  icon: Center(child: Icon(Icons.file_copy)),
                                    color:Colors.white,
                                  shape: CircleBorder(

                                  ),
                                ),
                              )
                            ],
                          ),

                     /* ),
                    ),
      ],
    ),*/
                                 ),
                               ),
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius:BorderRadius.circular(20.0)
                        ),
                        child: Column(
                          children: [
                            Text(
                                'Attendance',
                              style: TextStyle(
                                fontSize: 15.0,
                              ),
                            ),


                        ListTile(
                          title: const Text('Method 1'),
                          leading: Radio(
                            value:Attendance.Method1,
                            groupValue:Type,
                            onChanged: (Attendance? value){
                              setState(() {
                                Type=value;
                              });
                            }
                            ,

                          ),
                        ),
                          ListTile(
                            title: const Text('Method 2'),
                          leading: Radio(
                            value:Attendance.Method2,
                            groupValue:Type,
                            onChanged: (Attendance? value) {
                              setState(() {
                                Type = value;
                              });
                            },

                          ),
                          ),
                          ListTile(
                          title: const Text('None'),
                          leading: Radio(
                            value:Attendance.None,
                            groupValue:Type,
                            onChanged: (Attendance? value){
                              setState(() {
                                Type=value;
                              });
                            },//


                          ),


                          ),


                  ],
               ),
                      ),
                    ),
          ],
        ),





],

                           ),

    ),





          floatingActionButton:Container(
            height: 40,
            width: 100,
            child: FloatingActionButton(
              child: Text('Create'),
              onPressed: (){

              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0))
              ),

            ),
          ),
          floatingActionButtonLocation:FloatingActionButtonLocation.centerFloat,
        ),
    ),
    );


  }




}
