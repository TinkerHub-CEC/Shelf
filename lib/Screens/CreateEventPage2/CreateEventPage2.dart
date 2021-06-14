import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


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

  Widget build(BuildContext context) {

    return MaterialApp(
        home: Scaffold(

          drawer: Drawer(
            child: ListView(
                children: [Text('data')]),
          ),
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text(
                'Create Event',
                style: TextStyle(
                  color: Colors.black,
                )
            ),
            iconTheme: IconThemeData(color: Colors.black),
          ),
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

                         child:  Column(
                             children: <Widget>[
                               Padding(
                                 padding: const EdgeInsets.all(8.0),
                                 child: Container(
                                   decoration: BoxDecoration(
                                     border: Border.all(color: Colors.black),
                                       borderRadius:BorderRadius.circular(20.0)
                                   ),

                                   child:
                                   Column(
                  children: <Widget>[

                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Center(
                          child: Row(
                            children: [
                              Center(child: Text("Upload Files")),
                              IconButton(
                                onPressed: (){},
                                icon: Center(child: Icon(Icons.file_copy)),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
      ],
    ),
                                 ),
                               ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
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
                            },


                          ),


                          ),


                  ],
               ),
                      ),
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
    );


  }




}
