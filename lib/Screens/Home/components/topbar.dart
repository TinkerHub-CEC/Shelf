import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TopBox extends StatelessWidget {
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
                        //IconButton(
                        //  onPressed: (

                        //      ) { print("object");
                        //   },
                        //  icon: Icon(
                        //     Icons.menu_sharp,
                        //   ),
                        // ),
                        SizedBox(width: size.width* .05),
                        Container(
                          width: size.width* .07,
                          alignment: Alignment.center,
                          child: Text(
                            "A",
                            style: TextStyle(fontSize: 15),
                          ),
                          // child ://CircleAvatar(
                          // backgroundColor: Colors.white54,
                          //backgroundImage:
                          //   AssetImage('assets/images/h_photo.png'),
                          //radius: 15.0,
                          //  ),
                          decoration: BoxDecoration(
                              color: Colors.black12,
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: Colors.deepOrange, width: 1)),
                        ),
                        SizedBox(width: size.width* .05),
                        adminUser
                            ? Container(
                                //color: Colors.black,
                                alignment: Alignment.centerLeft,
                                width: size.width * .70, // .58,
                                height: 30,
                                //color: Colors.red,
                                child: Text("Admin Dashboard",
                                    style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold)))
                            : Container(
                                //color: Colors.black,
                                alignment: Alignment.centerLeft,
                                width: size.width * .70, // .58,
                                height: 30,
                                //color: Colors.red,
                                child: Text("Dashboard",
                                    style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold))),
                      ],
                    ),
                  ),

                  //Container(
                  //width: size.height * .07,
                  //      height: size.height * .07,
                  //       decoration: BoxDecoration(
                  //            border: Border.all(color: Colors.black12),

                  //color: Colors.black12,
                  //            borderRadius: BorderRadius.circular(10),
                  //             ),
                  //       child: IconButton(
                  //            color: Colors.black,
                  //            onPressed: () {
                  //    print("object");
                  //    },
                  //               icon: Icon(
                  //          Icons.notifications_none
                  //           ),
                  //           ),
                  //         ),
                ]),
          ),
        ],
      ),
    );
  }
}
