import 'dart:io';
import 'package:shelf/size_config.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shelf/components/custom_menu_bar.dart';
import '../../../constants.dart';
import 'package:http/http.dart' as http;
import 'package:shelf/Api/api.dart';
import "dart:convert";
import 'dart:async';
import 'package:shelf/models/verify_data.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';

class uploadImage extends StatefulWidget {
  final events;

  uploadImage(this.events);
  //const uploadImage({Key? key}) : super(key: key);

  @override
  _uploadImageState createState() => _uploadImageState();
}

class _uploadImageState extends State<uploadImage> {
  List eventdetails = [];
  final picker = ImagePicker();

  File? _image;

  Future getImage() async {
    final image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (image != null) {
        _image = File(image.path);
      } else {
        print("no image selected");
      }
    });
  }

  imageUpload() async {
    var eventid = widget.events['id'];

    print(eventid);
    final data = await getData('auth_data');
    Map<String, String> headers = {
      HttpHeaders.authorizationHeader: 'Bearer ' + data!
    };
    Uri url = Uri.parse("$baseUrl/api/events/$eventid/uploadimage/");

    var sendRequest = http.MultipartRequest("PUT", url);
    sendRequest.headers.addAll(headers);
    sendRequest.files.add(
        await http.MultipartFile.fromPath('photosubmission', _image!.path));

    http.StreamedResponse response = await sendRequest.send();
    final finalResp = await http.Response.fromStream(response);
    print(finalResp.statusCode);
    if (finalResp.statusCode == 201) {
      Fluttertoast.showToast(
          msg: "Image uploaded",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 3,
          backgroundColor: Colors.grey[800],
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var outputFormat = DateFormat('dd/MM/yyyy');
    var edatetime = widget.events['end_datetime'];
    String edate = edatetime.substring(0, 10);

    edate = outputFormat.format(DateTime.parse(edate));

    print(edate);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: size.height * 0.07),
            // CustomMenuBar(text: "Submit Attendance"),
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(
                  vertical: 10,
                ),
                //padding: EdgeInsets.symmetric(
                //  vertical: 10,
                //horizontal: 5,
                //),

                height: size.height * 0.055,
                width: size.width * 0.8,
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xffE1E8E8)),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                ),

                // borderRadius: BorderRadius.circular(32),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: IconButton(
                        highlightColor: Colors.white,
                        iconSize: 22,
                        icon: Icon(Icons.arrow_back),
                        color: Colors.black,
                        onPressed: () => Navigator.pop(context, false),
                      ),
                      // child: Icon(
                      //   Icons.star_rounded,
                      //   color: Color(0xffF7DD14),)
                    ),
                    Text(
                      "Upload Documents",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: SizeConfig.safeBlockHorizontal * 4.2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: size.height * 0.07),
            Container(
              width: size.width * 0.8,
              height: size.height * 0.29,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  border: Border.all(
                    color: Color.fromRGBO(56, 90, 100, 1),
                    width: 3,
                  )),
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  SizedBox(height: size.height * 0.02),
                  Text(
                    widget.events['title'],
                    style: TextStyle(
                        fontSize: SizeConfig.safeBlockHorizontal * 5.2,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Text(
                    edate,
                    style: TextStyle(
                      fontSize: SizeConfig.safeBlockHorizontal * 4.5,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.06,
                  ),
                  Divider(
                    color: Color.fromRGBO(56, 90, 100, 1),
                    thickness: 3,
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        height: size.height * 0.06,
                      ),
                      Text(
                        "Upload Files",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: SizeConfig.safeBlockHorizontal * 4.6,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: size.width * 0.35,
                      ),
                      IconButton(
                        iconSize: 25,
                        onPressed: getImage,
                        icon: Center(child: Icon(Icons.file_copy)),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            Container(
              width: size.width * .39,
              height: size.height * 0.06,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: TextButton(
                  onPressed: () {
                    imageUpload();
                  },
                  child: Text("Upload Docs"),
                  style: TextButton.styleFrom(
                      backgroundColor: Color.fromRGBO(56, 90, 100, 1),
                      primary: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
