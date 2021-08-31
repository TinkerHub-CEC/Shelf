// import 'dart:convert';

// import 'package:flutter/material.dart';

// import 'package:shelf/Screens/Signup/components/background.dart';
// import 'package:shelf/components/text_field_container.dart';

// class MoreBody extends StatefulWidget {
//   const MoreBody({
//     Key? key,
//   }) : super(key: key);

//   @override
//   _MoreBodyState createState() => _MoreBodyState();
// }

// class _MoreBodyState extends State<MoreBody> {
//   var nameController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;

//     return Background(
//         child: SingleChildScrollView(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Container(
//                 margin: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
//                 child: IconButton(
//                   highlightColor: Colors.white,
//                   iconSize: 22,
//                   icon: Icon(Icons.arrow_back),
//                   color: Colors.black,
//                   onPressed: () => Navigator.pop(context, false),
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: size.height * 0.16),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Container(
//                 margin: EdgeInsets.symmetric(vertical: 5, horizontal: 38),
//                 child: Text(
//                   "Register",
//                   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                 ),
//               ),
//             ],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Container(
//                 margin: EdgeInsets.symmetric(vertical: 10, horizontal: 38),
//                 child: Text(
//                   "Create your account",
//                   style: TextStyle(
//                       color: Color(0xff788190),
//                       fontSize: 14,
//                       fontWeight: FontWeight.w400),
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: size.height * 0.025),
//           Row(
//             children: [
//               Container(
//                 margin: EdgeInsets.symmetric(vertical: 5, horizontal: 38),
//                 child: Text(
//                   "Department",
//                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
//                 ),
//               ),
//             ],
//           ),
//           // SelectDropDown(),
//           SizedBox(height: size.height * 0.025),
//         ],
//       ),
//     ));
//   }
// }
