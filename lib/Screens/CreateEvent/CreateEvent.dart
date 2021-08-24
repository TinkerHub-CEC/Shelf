import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:shelf/Screens/CreateEventMethod/components/topBar.dart';
import 'package:shelf/constants.dart';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shelf/Screens/Home/homepage.dart';

enum Attendance { Method1, Method2, None }

class CreateEvent extends StatefulWidget {
  @override
  _CreateEventState createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  Widget _previewImage() {
    if (_image != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.file(File(_image!.path), width: 150.0, height: 150.0),
            SizedBox(
              height: 1.0,
              width: 1.0,
            ),
          ],
        ),
      );
    } else {
      return Text(
        'Image not selected',
        textAlign: TextAlign.center,
      );
    }
  }

  Widget _date2Validator() {
    if (((_dateTime2.month == _dateTime1.month) &&
            (_dateTime2.year == _dateTime1.year) &&
            (_dateTime2.day < _dateTime1.day)) ||
        ((_dateTime2.month == _dateTime1.month) &&
            (_dateTime2.year == _dateTime1.year) &&
            (_dateTime2.day == _dateTime1.day) &&
            (time2.hour < time1.hour))) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            children: [
              SizedBox(
                width: 150,
                child: Column(
                  children: [
                    Text(
                      'Registration close date came before ',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 12.0,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.visible,
                      softWrap: false,
                    ),
                    Text(
                      ' registration open date',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 12.0,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.visible,
                      softWrap: false,
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      );
    } else {
      return Text(
        '',
        textAlign: TextAlign.center,
      );
    }
  }

  Widget _date4Validator() {
    if (((_dateTime4.month == _dateTime3.month) &&
            (_dateTime4.year == _dateTime3.year) &&
            (_dateTime4.day < _dateTime3.day)) ||
        ((_dateTime4.month == _dateTime3.month) &&
            (_dateTime4.year == _dateTime3.year) &&
            (_dateTime4.day == _dateTime3.day) &&
            (time4.hour < time3.hour))) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            children: [
              SizedBox(
                width: 150,
                child: Column(
                  children: [
                    Text(
                      'Event close date came before',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 12.0,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.visible,
                      softWrap: false,
                    ),
                    Text(
                      ' event start date',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 12.0,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.visible,
                      softWrap: false,
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      );
    } else {
      return Text(
        '',
        textAlign: TextAlign.center,
      );
    }
  }

  Widget _date32Validator() {
    if (((_dateTime3.month == _dateTime2.month) &&
            (_dateTime3.year == _dateTime2.year) &&
            (_dateTime3.day < _dateTime2.day)) ||
        ((_dateTime3.month == _dateTime2.month) &&
            (_dateTime3.year == _dateTime2.year) &&
            (_dateTime3.day == _dateTime2.day) &&
            (time3.hour < time2.hour))) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: 150,
            child: Column(
              children: [
                Text(
                  '*Event start date came before ',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 15.0,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.visible,
                  softWrap: false,
                ),
                Text(
                  ' registration close date',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 15.0,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.visible,
                  softWrap: false,
                ),
              ],
            ),
          ),
        ],
      );
    } else {
      return Text(
        '',
        textAlign: TextAlign.center,
      );
    }
  }

  final TextEditingController MaxParticipantsController =
      TextEditingController();
  final TextEditingController VenueController = TextEditingController();
  var _numberForm = GlobalKey<FormState>();
  RegExp _digitRegex = RegExp("[0-9]+");

  int AttendanceType = -1;
  bool isANumber = true;
  bool isValidForm = false;
  int MaxParticipants = 0;
  String Venue = '';
  Map data = {};
  int? Type = -1;
  final picker = ImagePicker();
  File? _image;

  Future getImage() async {
    final image = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (image != null) {
        _image = File(image.path);
      } else {
        print("no image selected");
      }
    });
  }

  void setValidator(valid) {
    setState(() {
      isANumber = valid;
    });
  }

  final TextEditingController EventnameController = TextEditingController();
  final TextEditingController ShortDescriptionController =
      TextEditingController();
  final TextEditingController LongDescriptionController =
      TextEditingController();

  var _Form = GlobalKey<FormState>();

  RegExp digitValidator = RegExp("[0-9]+");

  String EventName = '';
  String shortDescription = '';
  String longDescription = '';
  String Datetime1 = '';
  String Datetime2 = '';
  String Datetime3 = '';
  String Datetime4 = '';
  DateTime _dateTime1 = DateTime(2021, 5, 25);
  DateTime _dateTime2 = DateTime(2021, 5, 25);
  DateTime _dateTime3 = DateTime(2021, 5, 25);
  DateTime _dateTime4 = DateTime(2021, 5, 25);
  TimeOfDay time1 = TimeOfDay.now();
  TimeOfDay time2 = TimeOfDay.now();
  TimeOfDay time3 = TimeOfDay.now();
  TimeOfDay time4 = TimeOfDay.now();

  @override
  void initState() {
    super.initState();
    _dateTime1 = DateTime.now();
    _dateTime2 = DateTime.now();
    _dateTime3 = DateTime.now();
    _dateTime4 = DateTime.now();
    time1 = TimeOfDay.now();
    time2 = TimeOfDay.now();
    time3 = TimeOfDay.now();
    time4 = TimeOfDay.now();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        top: true,
        child: Scaffold(
          drawer: Drawer(
            child: ListView(children: [Text('data')]),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Form(
                  key: _Form,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          decoration: BoxDecoration(
                            /*color: Colors.deepOrange,*/
                            border: Border(
                                left: BorderSide(
                                    color: Colors.deepOrange, width: 15)),
                          ),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "please fill this field";
                              }
                              return null;
                            },
                            onChanged: (value) {
                              EventName = value;
                            },
                            controller: EventnameController,
                            decoration: InputDecoration(
                              hintText: "Event Name",
                              /* labelText:'Event Name',*/
                              border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 1.0),
                                borderRadius: BorderRadius.circular(0.0),
                              ),
                              /*enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(color:Colors.deepOrange,width:10.0),
                                                )*/
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          decoration: BoxDecoration(
                            /*color: Colors.deepOrange,*/
                            border: Border(
                                left: BorderSide(
                                    color: Colors.deepOrange, width: 15)),
                          ),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "please fill this field";
                              }
                              return null;
                            },
                            onChanged: (value) {
                              shortDescription = value;
                            },
                            controller: ShortDescriptionController,
                            maxLines: null,
                            decoration: InputDecoration(
                                hintText: "Short Description",
                                /* labelText:'Short Description',*/
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(0.0),
                                )),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          decoration: BoxDecoration(
                            /*color: Colors.deepOrange,*/
                            border: Border(
                                left: BorderSide(
                                    color: Colors.deepOrange, width: 15)),
                          ),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "please fill this field";
                              }
                              return null;
                            },
                            onChanged: (value) {
                              longDescription = value;
                            },
                            controller: LongDescriptionController,
                            maxLines: null,
                            decoration: InputDecoration(
                                hintText: "Long Description",
                                /*labelText:'Long Description',*/
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 1.0),
                                  borderRadius: BorderRadius.circular(0.0),
                                )),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          decoration: BoxDecoration(
                            /*color: Colors.deepOrange,*/
                            border: Border(
                                left: BorderSide(
                                    color: Colors.deepOrange, width: 15)),
                          ),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null ||
                                  value.isEmpty ||
                                  !_digitRegex.hasMatch(value)) {
                                return "please enter a number";
                              }
                              return null;
                            },
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              MaxParticipants = int.parse(value);
                            },
                            controller: MaxParticipantsController,
                            decoration: InputDecoration(
                                /*   errorText: isANumber?null:"please enter a number",*/
                                hintText: "Max Participants",
                                /*labelText:'Max Participants',*/
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 1.0),
                                  borderRadius: BorderRadius.circular(0.0),
                                )),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          decoration: BoxDecoration(
                            /*color: Colors.deepOrange,*/
                            border: Border(
                                left: BorderSide(
                                    color: Colors.deepOrange, width: 15)),
                          ),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "please fill this field";
                              }
                              return null;
                            },
                            onChanged: (value) {
                              Venue = value;
                              if (value.isEmpty) {
                                setValidator(true);
                              } else {
                                setValidator(false);
                              }
                            },
                            controller: VenueController,
                            decoration: InputDecoration(
                                hintText: "Venue",
                                /*labelText:'Venue',*/
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 1.0),
                                  borderRadius: BorderRadius.circular(0.0),
                                )),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          decoration: BoxDecoration(
                            /*color: Colors.deepOrange,*/
                            border: Border(
                              left: BorderSide(
                                  color: Colors.deepOrange, width: 15),
                              top: BorderSide(color: Colors.grey, width: 1.0),
                              right: BorderSide(color: Colors.grey, width: 1.0),
                              bottom:
                                  BorderSide(color: Colors.grey, width: 1.0),
                            ),
                          ),
                          /*border: Border.all(color: Colors.grey),
                                              borderRadius:BorderRadius.circular(20.0)*/

                          child: Column(
                            children: [
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
                                  children: <Widget>[
                                    Text('Starts:  '),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                          '${_dateTime1.day}/${_dateTime1.month}/${_dateTime1.year}'),
                                    ),
                                    Text('${time1.hour}:${time1.minute}'),
                                    IconButton(
                                      onPressed: () => _pickDate1(context),
                                      icon: Icon(Icons.date_range),
                                    ),
                                    IconButton(
                                      onPressed: () => _pickTime1(context),
                                      icon: Icon(Icons.access_time_outlined),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: <Widget>[
                                    Text('Ends:  '),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                          '${_dateTime2.day}/${_dateTime2.month}/${_dateTime2.year}'),
                                    ),
                                    Text('${time2.hour}:${time2.minute}'),
                                    IconButton(
                                      onPressed: () => _pickDate2(context),
                                      icon: Icon(Icons.date_range),
                                    ),
                                    IconButton(
                                      onPressed: () => _pickTime2(context),
                                      icon: Icon(Icons.access_time_outlined),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    _date2Validator(),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Container(
                                  width: 800,
                                  child: Text(
                                    'Event ',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 18.0,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: <Widget>[
                                    Text('Starts:  '),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                          '${_dateTime3.day}/${_dateTime3.month}/${_dateTime3.year}'),
                                    ),
                                    Text('${time3.hour}:${time3.minute}'),
                                    IconButton(
                                      onPressed: () => _pickDate3(context),
                                      icon: Icon(Icons.date_range),
                                    ),
                                    IconButton(
                                      onPressed: () => _pickTime3(context),
                                      icon: Icon(Icons.access_time_outlined),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    _date32Validator(),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: <Widget>[
                                    Text('Ends:  '),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                          '${_dateTime4.day}/${_dateTime4.month}/${_dateTime4.year}'),
                                    ),
                                    Text('${time4.hour}:${time4.minute}'),
                                    IconButton(
                                      onPressed: () => _pickDate4(context),
                                      icon: Icon(Icons.date_range),
                                    ),
                                    IconButton(
                                      onPressed: () => _pickTime4(context),
                                      icon: Icon(Icons.access_time_outlined),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    _date4Validator(),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        decoration: BoxDecoration(
                          /*color: Colors.deepOrange,*/
                          border: Border(
                            left:
                                BorderSide(color: Colors.deepOrange, width: 15),
                            top: BorderSide(color: Colors.grey, width: 1.0),
                            right: BorderSide(color: Colors.grey, width: 1.0),
                            bottom: BorderSide(color: Colors.grey, width: 1.0),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Upload Files"),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: RaisedButton.icon(
                                label: Text(""),
                                onPressed: getImage,
                                icon: Center(child: Icon(Icons.file_copy)),
                                color: Colors.white,
                                shape: CircleBorder(),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    _previewImage(),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        decoration: BoxDecoration(
                          /*color: Colors.deepOrange,*/
                          border: Border(
                            left:
                                BorderSide(color: Colors.deepOrange, width: 15),
                            top: BorderSide(color: Colors.grey, width: 1.0),
                            right: BorderSide(color: Colors.grey, width: 1.0),
                            bottom: BorderSide(color: Colors.grey, width: 1.0),
                          ),

                          /*border: Border.all(color: Colors.grey),*/
                          /* borderRadius:BorderRadius.circular(0.0)*/
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
                                value: 1,
                                groupValue: Type,
                                onChanged: radioValue,
                              ),
                            ),
                            ListTile(
                              title: const Text('Method 2'),
                              leading: Radio(
                                value: 2,
                                groupValue: Type,
                                onChanged: radioValue,
                              ),
                            ),
                            ListTile(
                              title: const Text('None'),
                              leading: Radio(
                                value: 0,
                                groupValue: Type,
                                onChanged: radioValue,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 140,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        side: BorderSide(
                          width: 1.0,
                          color: Colors.deepOrange,
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(50.0))),
                      ),
                      child: Text('Create',
                          style: TextStyle(
                            color: Colors.black,
                          )),
                      onPressed: () {
                        if (_Form.currentState!.validate()) {
                          setState(() {
                            isValidForm = true;
                          });
                        } else {
                          setState(() {
                            isValidForm = false;
                          });
                        }
                        if (_Form.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(isValidForm
                                  ? 'Event created successfully'
                                  : "please fix errors and submit")));
                        }
                        /* final formatter=DateFormat("yyyy-MM-dd 'T' hh:mm ':00Z'");
                       final datetime1=_dateTime1.toIso8601String();
                        final datetime2=_dateTime2.toIso8601String();
                        final datetime3=_dateTime3.toIso8601String();
                        final datetime4=_dateTime4.toIso8601String();*/
                        /*_dateTime1.=int.parse(time1.hour);
                      /*(Duration(hours:time1.hour,minutes:time1.minute));*/
                        _dateTime2.add(Duration(hours:time2.hour,minutes:time2.minute));
                        _dateTime3.add(Duration(hours:time3.hour,minutes:time3.minute));
                        _dateTime4.add(Duration(hours:time4.hour,minutes:time4.minute));*/

                        Datetime1 = (DateTime.parse((_dateTime1.year)
                                    .toString() +
                                '-' +
                                (_dateTime1.month).toString().padLeft(2, '0') +
                                '-' +
                                (_dateTime1.day).toString().padLeft(2, '0') +
                                'T' +
                                (time1.hour).toString() +
                                ':' +
                                (time1.minute).toString() +
                                ':00Z'))
                            .toString();

                        Datetime2 = (DateTime.parse((_dateTime2.year)
                                    .toString() +
                                '-' +
                                (_dateTime2.month).toString().padLeft(2, '0') +
                                '-' +
                                (_dateTime2.day).toString().padLeft(2, '0') +
                                'T' +
                                (time2.hour).toString() +
                                ':' +
                                (time2.minute).toString() +
                                ':00Z'))
                            .toString();

                        Datetime3 = (DateTime.parse((_dateTime3.year)
                                    .toString() +
                                '-' +
                                (_dateTime3.month).toString().padLeft(2, '0') +
                                '-' +
                                (_dateTime3.day).toString().padLeft(2, '0') +
                                'T' +
                                (time3.hour).toString() +
                                ':' +
                                (time3.minute).toString() +
                                ':00Z'))
                            .toString();
                        Datetime4 = (DateTime.parse((_dateTime4.year)
                                    .toString() +
                                '-' +
                                (_dateTime4.month).toString().padLeft(2, '0') +
                                '-' +
                                (_dateTime4.day).toString().padLeft(2, '0') +
                                'T' +
                                (time4.hour).toString() +
                                ':' +
                                (time4.minute).toString() +
                                ':00Z'))
                            .toString();

                        /* Datetime1=(_dateTime1.toString()+time1.toString());
                        Datetime2=(_dateTime2.toString()+time2.toString());
                        Datetime3=(_dateTime3.toString()+time3.toString());
                        Datetime4=(_dateTime4.toString()+time4.toString());*/
                        print(Datetime1);
                        print(Datetime2);
                        print(Datetime3);
                        print(Datetime4);
                        createEvent(
                          EventnameController.text,
                          Datetime3,
                          Datetime4,
                          VenueController.text,
                          MaxParticipantsController.text,
                          ShortDescriptionController.text,
                          LongDescriptionController.text,
                          _image,
                          Datetime1,
                          Datetime2,
                          AttendanceType,
                        );
                        if (isValidForm) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => Homepage()),
                          );
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future _pickDate1(BuildContext context) async {
    final date = await showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
      initialDate: _dateTime1,
    );
    if (date != null)
      setState(() {
        _dateTime1 = date;
      });
  }

  Future _pickDate2(BuildContext context) async {
    final date = await showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
      initialDate: _dateTime1,
    );
    if (date != null)
      setState(() {
        _dateTime2 = date;
      });
  }

  Future _pickDate3(BuildContext context) async {
    final date = await showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
      initialDate: _dateTime1,
    );
    if (date != null)
      setState(() {
        _dateTime3 = date;
      });
  }

  Future _pickDate4(BuildContext context) async {
    final date = await showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
      initialDate: _dateTime1,
    );
    if (date != null)
      setState(() {
        _dateTime4 = date;
      });
  }

  Future _pickTime1(BuildContext context) async {
    final t = await showTimePicker(
      context: context,
      initialTime: time1,
    );
    if (t != null)
      setState(() {
        time1 = t;
      });
  }

  Future _pickTime2(BuildContext context) async {
    final t = await showTimePicker(
      context: context,
      initialTime: time2,
    );
    if (t != null)
      setState(() {
        time2 = t;
      });
  }

  Future _pickTime3(BuildContext context) async {
    final t = await showTimePicker(
      context: context,
      initialTime: time3,
    );
    if (t != null)
      setState(() {
        time3 = t;
      });
  }

  Future _pickTime4(BuildContext context) async {
    final t = await showTimePicker(
      context: context,
      initialTime: time4,
    );
    if (t != null)
      setState(() {
        time4 = t;
      });
  }

  void radioValue(int? value) {
    setState(() {
      Type = value;
      switch (Type) {
        case 0:
          AttendanceType = 0;
          break;
        case 1:
          AttendanceType = 1;
          break;
        case 0:
          AttendanceType = 2;
          break;
      }
    });
  }

  Future<bool> createEvent(
    String eventname,
    String startDateTime,
    String endDateTime,
    String location,
    String maxParticipants,
    String shortDescription,
    String longDescription,
    File? image,
    String RegOpenDate,
    String RegCloseDate,
    int? attendance,
  ) async {
    try {
      Uri url = Uri.parse("${baseUrl}/api/events/");
      var sendRequest = http.MultipartRequest("POST", url);
      sendRequest.fields['title'] = eventname;
      sendRequest.fields['start_datetime'] = startDateTime;
      sendRequest.fields['end_datetime'] = endDateTime;
      sendRequest.fields['location'] = location;
      sendRequest.fields['max_participants'] = maxParticipants;
      sendRequest.fields['short_description'] = shortDescription;
      sendRequest.fields['long_description'] = longDescription;
      sendRequest.fields['reg_open_date'] = RegOpenDate;
      sendRequest.fields['reg_close_date'] = RegCloseDate;
      sendRequest.fields['attendance_method'] = (attendance).toString();
      sendRequest.files
          .add(await http.MultipartFile.fromPath('poster', _image!.path));
      http.StreamedResponse response = await sendRequest.send();
      final finalResp = await http.Response.fromStream(response);
      print(finalResp.body);
      return true;
    } on SocketException {
      print("No Internet while uploading ");
      return false;
    } catch (e) {
      print("ERROR ON UPLOADING  : $e");
      return false;
    }
  }
}
