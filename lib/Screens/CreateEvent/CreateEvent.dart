import 'dart:async';
import 'package:flutter/material.dart';

class CreateEvent extends StatefulWidget {


  @override
  _CreateEventState createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  DateTime _dateTime=DateTime(2021,5,25);
  @override
  void initState() {
    super.initState();
    _dateTime=DateTime.now();

  }


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
                'Profile',
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
                             children: [
                               Form(
                                  child:Column(
                                  children:<Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child:
                                        TextFormField(
                                          decoration:InputDecoration(
                                          hintText:"Event Name",
                                            labelText:'Event Name',
                                          ),
                          ),
                               ),
                                     Padding(
                                        padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(
                                        decoration:InputDecoration(
                                          hintText:"Description",
                                          labelText:'Description',
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Container(
                                        width: 800,
                                        child: Text(
                                            'Event Registration',
                                          style: TextStyle(
                                            fontSize: 18.0,


                                          ),
                                        ),
                                      ),
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children:<Widget> [



                                          Text('From:  '),
                                              Text('${_dateTime.day}/${_dateTime.month}/${_dateTime.year}'),
                                          IconButton(
                                            onPressed:()=> _pickDate(context),
                                            icon:Icon(Icons.date_range),

                                          ),


                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children:<Widget> [



                                          Text('To:  '),
                                          Text('${_dateTime.day}/${_dateTime.month}/${_dateTime.year}'),
                                          IconButton(
                                            onPressed:()=> _pickDate(context),
                                            icon:Icon(Icons.date_range),

                                          ),


                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Container(
                                        width:800,
                                        child: Text(
                                            'Event ',
                                          textAlign:TextAlign.left,
                                          style: TextStyle(
                                            fontSize: 18.0,


                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children:<Widget> [



                                          Text('Starts:  '),
                                          Text('${_dateTime.day}/${_dateTime.month}/${_dateTime.year}'),
                                          IconButton(
                                            onPressed:()=> _pickDate(context),
                                            icon:Icon(Icons.date_range),

                                          ),


                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children:<Widget> [



                                          Text('Ends:  '),
                                          Text('${_dateTime.day}/${_dateTime.month}/${_dateTime.year}'),
                                          IconButton(
                                            onPressed:()=> _pickDate(context),
                                            icon:Icon(Icons.date_range),

                                          ),


                                        ],
                                      ),
                                    ),




                                  ],

                                ),
                               ),
                             ],
                         ),
                           ),

          floatingActionButton:FloatingActionButton(
            child: Text('Next'),
            onPressed: (){

            },
          ),

        ),
    );


  }



  Future _pickDate(BuildContext context) async{
   final  date= await showDatePicker(
      context:context,
      firstDate:DateTime(DateTime.now().year-5),
      lastDate:DateTime(DateTime.now().year+5),
      initialDate:_dateTime,
    );
    if (date!=null)
      setState(() {
        _dateTime=date;
      });
  }
}
