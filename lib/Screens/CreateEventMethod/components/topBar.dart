import 'package:flutter/material.dart';

class TopBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
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
                          SizedBox(width: 10),
                          Container(
                            width: 26,
                            alignment: Alignment.center,
                            child: Icon(
                              Icons.star_rounded,
                              color: Color(0xffF7DD14),
                            ),

                            /* decoration: BoxDecoration(
                                color: Colors.black12,
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.deepOrange ,width : 1)
                            ),*/
                          ),
                          SizedBox(width: 10),
                          Container(
                              //color: Colors.black,
                              alignment: Alignment.centerLeft,
                              width: size.width * .73, // .58,
                              height: 30,
                              //color: Colors.red,
                              child: Text("Create Event",
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
          ),
        ],
      ),
    );
  }
}
