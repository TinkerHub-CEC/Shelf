// ignore_for_file: non_constant_identifier_names, unused_field, deprecated_member_use, duplicate_ignore

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shelf/Screens/CreateEventMethod/components/topBar.dart';
import 'package:shelf/constants.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:shelf/Screens/Home/homepage.dart';
import 'package:shelf/Api/api.dart';
import 'package:shelf/providers/session_timedout.dart';

enum Attendance { Method1, Method2, None }

class CreateEvent extends StatefulWidget {
  @override
  _CreateEventState createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  bool isLoading = false;
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
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Text(
                        'Registration close date came before ',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 12.0,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.visible,
                        softWrap: false,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 60),
                      child: Text(
                        ' registration open date',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 12.0,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.visible,
                        softWrap: false,
                      ),
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
                    Padding(
                      padding: const EdgeInsets.only(left: 50),
                      child: Text(
                        'Event close date came before',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 12.0,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.visible,
                        softWrap: false,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 80),
                      child: Text(
                        ' event start date',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 12.0,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.visible,
                        softWrap: false,
                      ),
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

  // ignore: unused_element
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
                Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: Text(
                    '*Event start date came before ',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 15.0,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.visible,
                    softWrap: false,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 80),
                  child: Text(
                    ' registration close date',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 15.0,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.visible,
                    softWrap: false,
                  ),
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
    // ignore: deprecated_member_use
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
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

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
    Size size = MediaQuery.of(context).size;

    return MaterialApp(
      home: SafeArea(
        top: true,
        child: Scaffold(
          key: _scaffoldKey,
          drawer: Drawer(
            child: ListView(children: [Text('data')]),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 76.0),
                  child: TopBox(),
                ),
                Form(
                  key: _Form,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20.0, 19, 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: size.width * .89,
                              height: size.height * .07,
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xffE1E8E8)),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xffff7a45),
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                    padding: EdgeInsets.only(
                                      left: 4,
                                    ),
                                    height: size.height * 1,
                                    width: size.width * 0.05,
                                    child: RotatedBox(
                                      quarterTurns: 3,
                                    ),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.20,
                                    width: size.width * 0.832,
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
                                          contentPadding:
                                              const EdgeInsets.only(left: 12),
                                          /* labelText:'Event Name',*/
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.deepOrange,
                                                width: 2.0),
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(5.0),
                                              bottomRight: Radius.circular(5.0),
                                            ),
                                          ),
                                          border: InputBorder.none),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20.0, 19, 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: size.width * .89,
                              height: size.height * .07,
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xffE1E8E8)),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xffff7a45),
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                    padding: EdgeInsets.only(
                                      left: 4,
                                    ),
                                    height: size.height * 1,
                                    width: size.width * 0.05,
                                    child: RotatedBox(
                                      quarterTurns: 3,
                                    ),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.20,
                                    width: size.width * 0.832,
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
                                          contentPadding:
                                              const EdgeInsets.only(left: 12),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.deepOrange,
                                                width: 2.0),
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(5.0),
                                              bottomRight: Radius.circular(5.0),
                                            ),
                                          ),
                                          border: InputBorder.none),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20.0, 19, 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: size.width * .89,
                              height: size.height * .30,
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xffE1E8E8)),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xffff7a45),
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                    padding: EdgeInsets.only(
                                      left: 4,
                                    ),
                                    height: size.height * 1,
                                    width: size.width * 0.05,
                                    child: RotatedBox(
                                      quarterTurns: 3,
                                    ),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.50,
                                    width: size.width * 0.832,
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
                                      minLines: 15,
                                      decoration: InputDecoration(
                                          hintText: "Long Description",
                                          contentPadding:
                                              const EdgeInsets.fromLTRB(
                                                  12.0, 12.0, 0.0, 0.0),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.deepOrange,
                                                width: 2.0),
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(5.0),
                                              bottomRight: Radius.circular(5.0),
                                            ),
                                          ),
                                          border: InputBorder.none),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20.0, 19, 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: size.width * .89,
                              height: size.height * .07,
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xffE1E8E8)),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xffff7a45),
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                    padding: EdgeInsets.only(
                                      left: 4,
                                    ),
                                    height: size.height * 1,
                                    width: size.width * 0.05,
                                    child: RotatedBox(
                                      quarterTurns: 3,
                                    ),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.20,
                                    width: size.width * 0.832,
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
                                          hintText: "Max Participants",
                                          contentPadding:
                                              const EdgeInsets.only(left: 12),
                                          /*labelText:'Max Participants',*/
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.deepOrange,
                                                width: 2.0),
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(5.0),
                                              bottomRight: Radius.circular(5.0),
                                            ),
                                          ),
                                          border: InputBorder.none),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20.0, 19, 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: size.width * .89,
                              height: size.height * .07,
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xffE1E8E8)),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xffff7a45),
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                    padding: EdgeInsets.only(
                                      left: 4,
                                    ),
                                    height: size.height * 1,
                                    width: size.width * 0.05,
                                    child: RotatedBox(
                                      quarterTurns: 3,
                                    ),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.20,
                                    width: size.width * 0.832,
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
                                          contentPadding:
                                              const EdgeInsets.only(left: 12),
                                          /*labelText:'Venue',*/
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.deepOrange,
                                                width: 2.0),
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(5.0),
                                              bottomRight: Radius.circular(5.0),
                                            ),
                                          ),
                                          border: InputBorder.none),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20.0, 19, 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: size.width * .89,
                              height: size.height * .66,
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xffE1E8E8)),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xffff7a45),
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                    padding: EdgeInsets.only(
                                      left: 4,
                                    ),
                                    height: size.height * 1,
                                    width: size.width * 0.05,
                                    child: RotatedBox(
                                      quarterTurns: 3,
                                    ),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.60,
                                    width: size.width * 0.832,
                                    child: Column(
                                      children: [
                                        Row(
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15.0),
                                              child: Text(
                                                  'Registration starts:  '),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                  '${_dateTime1.day}/${_dateTime1.month}/${_dateTime1.year}'),
                                            ),
                                            Text(
                                                '${time1.hour}:${time1.minute}'),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 150),
                                          child: Row(
                                            children: [
                                              IconButton(
                                                onPressed: () =>
                                                    _pickDate1(context),
                                                icon: Icon(Icons.date_range),
                                              ),
                                              IconButton(
                                                onPressed: () =>
                                                    _pickTime1(context),
                                                icon: Icon(
                                                    Icons.access_time_outlined),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15.0),
                                              child:
                                                  Text('Registration ends:  '),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                  '${_dateTime2.day}/${_dateTime2.month}/${_dateTime2.year}'),
                                            ),
                                            Text(
                                                '${time2.hour}:${time2.minute}'),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 150),
                                          child: Row(
                                            children: [
                                              IconButton(
                                                onPressed: () =>
                                                    _pickDate2(context),
                                                icon: Icon(Icons.date_range),
                                              ),
                                              IconButton(
                                                onPressed: () =>
                                                    _pickTime2(context),
                                                icon: Icon(
                                                    Icons.access_time_outlined),
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
                                        Divider(
                                          color: Color(0xffE1E8E8),
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15.0),
                                              child: Text('Event starts:  '),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                  '${_dateTime3.day}/${_dateTime3.month}/${_dateTime3.year}'),
                                            ),
                                            Text(
                                                '${time3.hour}:${time3.minute}'),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 150),
                                          child: Row(
                                            children: [
                                              IconButton(
                                                onPressed: () =>
                                                    _pickDate3(context),
                                                icon: Icon(Icons.date_range),
                                              ),
                                              IconButton(
                                                onPressed: () =>
                                                    _pickTime3(context),
                                                icon: Icon(
                                                    Icons.access_time_outlined),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(1.0),
                                          child: Row(
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 15.0),
                                                child: Text('Event ends:  '),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                    '${_dateTime4.day}/${_dateTime4.month}/${_dateTime4.year}'),
                                              ),
                                              Text(
                                                  '${time4.hour}:${time4.minute}'),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 150),
                                          child: Row(
                                            children: [
                                              IconButton(
                                                onPressed: () =>
                                                    _pickDate4(context),
                                                icon: Icon(Icons.date_range),
                                              ),
                                              IconButton(
                                                onPressed: () =>
                                                    _pickTime4(context),
                                                icon: Icon(
                                                    Icons.access_time_outlined),
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
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20.0, 19, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: size.width * .89,
                            height: size.height * 0.09,
                            decoration: BoxDecoration(
                              border: Border.all(color: Color(0xffE1E8E8)),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xffff7a45),
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                  height: size.height * 1,
                                  width: size.width * 0.05,
                                  child: RotatedBox(
                                    quarterTurns: 3,
                                  ),
                                ),
                                Column(
                                  children: [
                                    Container(
                                      color: Colors.white,
                                      padding: EdgeInsets.symmetric(
                                        vertical: 6,
                                        horizontal: 11,
                                      ),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 12.0),
                                            child: Text("Upload Files"),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 30.0),
                                            child: RaisedButton.icon(
                                              label: Text(""),
                                              onPressed: getImage,
                                              icon: Center(
                                                  child: Icon(Icons.file_copy)),
                                              color: Colors.white,
                                              shape: CircleBorder(),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    _previewImage(),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 19, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: size.width * .89,
                        height: size.height * .30,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xffE1E8E8)),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Color(0xffff7a45),
                                borderRadius: BorderRadius.circular(2),
                              ),
                              padding: EdgeInsets.only(
                                left: 4,
                              ),
                              height: size.height * 1,
                              width: size.width * 0.05,
                              child: RotatedBox(
                                quarterTurns: 3,
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.50,
                              width: size.width * 0.832,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(25, 12, 0, 0),
                                    child: Text(
                                      'Attendance',
                                      style: TextStyle(
                                        fontSize: 15.0,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 25.0),
                                    child: Text(
                                      'Method',
                                      style: TextStyle(
                                        fontSize: 15.0,
                                      ),
                                    ),
                                  ),
                                  ListTile(
                                    title:
                                        const Text('CheckBox Marking Method'),
                                    leading: Radio(
                                      value: 1,
                                      groupValue: Type,
                                      onChanged: radioValue,
                                    ),
                                  ),
                                  ListTile(
                                    title: const Text('Proof Uploading Method'),
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
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                isLoading
                    ? Padding(
                        padding: const EdgeInsets.fromLTRB(123, 63, 120, 52),
                        child: Center(
                            child: CircularProgressIndicator(
                          valueColor:
                              new AlwaysStoppedAnimation<Color>(kPrimaryColor),
                        )),
                      )
                    : Padding(
                        padding: const EdgeInsets.fromLTRB(123, 63, 120, 52),
                        child: Container(
                          width: 140,
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              side: BorderSide(
                                width: 1.0,
                                color: Color(0xffff7a45),
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
                                  isLoading = true;
                                });
                              } else {
                                setState(() {
                                  isValidForm = false;
                                });
                              }
                              if (_Form.currentState!.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(isValidForm
                                            ? ''
                                            : "please fix errors and submit")));
                              }

                              Datetime1 = (DateTime.parse((_dateTime1.year)
                                          .toString() +
                                      '-' +
                                      (_dateTime1.month)
                                          .toString()
                                          .padLeft(2, '0') +
                                      '-' +
                                      (_dateTime1.day)
                                          .toString()
                                          .padLeft(2, '0') +
                                      'T' +
                                      (time1.hour).toString().padLeft(2, '0') +
                                      ':' +
                                      (time1.minute)
                                          .toString()
                                          .padLeft(2, '0') +
                                      ':00'))
                                  .toString();
                              Datetime2 = (DateTime.parse((_dateTime2.year)
                                          .toString() +
                                      '-' +
                                      (_dateTime2.month)
                                          .toString()
                                          .padLeft(2, '0') +
                                      '-' +
                                      (_dateTime2.day)
                                          .toString()
                                          .padLeft(2, '0') +
                                      'T' +
                                      (time2.hour).toString().padLeft(2, '0') +
                                      ':' +
                                      (time2.minute)
                                          .toString()
                                          .padLeft(2, '0') +
                                      ':00'))
                                  .toString();
                              Datetime3 = (DateTime.parse((_dateTime3.year)
                                          .toString() +
                                      '-' +
                                      (_dateTime3.month)
                                          .toString()
                                          .padLeft(2, '0') +
                                      '-' +
                                      (_dateTime3.day)
                                          .toString()
                                          .padLeft(2, '0') +
                                      'T' +
                                      (time3.hour).toString().padLeft(2, '0') +
                                      ':' +
                                      (time3.minute)
                                          .toString()
                                          .padLeft(2, '0') +
                                      ':00'))
                                  .toString();
                              Datetime4 = (DateTime.parse((_dateTime4.year)
                                          .toString() +
                                      '-' +
                                      (_dateTime4.month)
                                          .toString()
                                          .padLeft(2, '0') +
                                      '-' +
                                      (_dateTime4.day)
                                          .toString()
                                          .padLeft(2, '0') +
                                      'T' +
                                      (time4.hour).toString().padLeft(2, '0') +
                                      ':' +
                                      (time4.minute)
                                          .toString()
                                          .padLeft(2, '0') +
                                      ':00'))
                                  .toString();
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
        case 2:
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
      final data = await getData('auth_data');
      Map<String, String> headers = {
        HttpHeaders.authorizationHeader: 'Bearer ' + data!
      };
      Uri url = Uri.parse("$baseUrl/api/events/");

      var sendRequest = http.MultipartRequest("POST", url);
      sendRequest.headers.addAll(headers);

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

      print("Create Events Status Code:${finalResp.statusCode}");
      print(finalResp.body);
      if (finalResp.statusCode == 201) {
        setState(() {
          isLoading = false;
        });
        Fluttertoast.showToast(
            msg: "Event created successfully",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Homepage()),
        );
      } else if (response.statusCode == 401) {
        sessionTimeOut(context);
      } else {
        setState(() {
          isLoading = false;
        });
        Fluttertoast.showToast(
            msg: "Error in creating the event",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
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
