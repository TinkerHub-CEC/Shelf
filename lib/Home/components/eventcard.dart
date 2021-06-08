import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EventCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width*1,
      child: Column(
        children: [
          SizedBox(height: size.height * 0.03),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                //margin: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                width: size.width * .85,
                height: size.height * .48,
                decoration: BoxDecoration(

                  color: Colors.white,
                  //border: Border.all(color: Colors.black26),
                  borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow( blurRadius: 10 ,offset: const Offset(0,0) ,spreadRadius : 5, color: Colors.black12)
                    ]
                ),
                child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        //margin: EdgeInsets.symmetric(vertical: 20, horizontal: 0),
                        width: size.width * .85,
                        height: size.height * .3,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          //border: Border.all(color: Colors.black26),

                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.asset("assets/images/Screenshot (20).png",
                            fit: BoxFit.scaleDown),
                      ),
                      Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          //padding: EdgeInsets.only(left: 12 ,right: 12 ,top:  3, bottom: 3),
                          child: Text(
                              "Thinkerhub project hunt,run on test.needs volunteers to study back-end and front-end using flutter and django .interested please update your registrtyion",
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black))),
                      Container(
                          margin:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                          //padding: EdgeInsets.only(left: 12 ,right: 12 ,top:  3, bottom: 3),
                          child: Row(children: [
                            Text("20-02-2021",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black))
                          ]))
                    ]),
              )
            ],
          ),
          SizedBox(height: size.height * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                //margin: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                width: size.width * .85,
                height: size.height * .48,
                decoration: BoxDecoration(

                    color: Colors.white,
                    //border: Border.all(color: Colors.black26),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow( blurRadius: 10 ,offset: const Offset(0,0) ,spreadRadius : 5, color: Colors.black12)
                    ]
                ),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        //margin: EdgeInsets.symmetric(vertical: 20, horizontal: 0),
                        width: size.width * .85,
                        height: size.height * .3,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          //border: Border.all(color: Colors.black26),

                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.asset("assets/images/Screenshot (20).png",
                            fit: BoxFit.scaleDown),
                      ),
                      Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          //padding: EdgeInsets.only(left: 12 ,right: 12 ,top:  3, bottom: 3),
                          child: Text(
                              "Thinkerhub project hunt,run on test.needs volunteers to study back-end and front-end using flutter and django .interested please update your registrtyion",
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black))),
                      Container(
                          margin:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                          //padding: EdgeInsets.only(left: 12 ,right: 12 ,top:  3, bottom: 3),
                          child: Row(children: [
                            Text("20-02-2021",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black))
                          ]))
                    ]),
              )
            ],
          ),
          SizedBox(height: size.height * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                //margin: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                width: size.width * .85,
                height: size.height * .48,
                decoration: BoxDecoration(

                    color: Colors.white,
                    //border: Border.all(color: Colors.black26),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow( blurRadius: 10 ,offset: const Offset(0,0) ,spreadRadius : 5, color: Colors.black12)
                    ]
                ),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        //margin: EdgeInsets.symmetric(vertical: 20, horizontal: 0),
                        width: size.width * .85,
                        height: size.height * .3,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          //border: Border.all(color: Colors.black26),

                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.asset("assets/images/Screenshot (20).png",
                            fit: BoxFit.scaleDown),
                      ),
                      Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          //padding: EdgeInsets.only(left: 12 ,right: 12 ,top:  3, bottom: 3),
                          child: Text(
                              "Thinkerhub project hunt,run on test.needs volunteers to study back-end and front-end using flutter and django .interested please update your registrtyion",
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black))),
                      Container(
                          margin:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                          //padding: EdgeInsets.only(left: 12 ,right: 12 ,top:  3, bottom: 3),
                          child: Row(children: [
                            Text("20-02-2021",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black))
                          ]))
                    ]),
              )
            ],
          ),
          SizedBox(height: size.height * 0.05),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                //margin: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                width: size.width * .85,
                height: size.height * .48,
                decoration: BoxDecoration(

                    color: Colors.white,
                    //border: Border.all(color: Colors.black26),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow( blurRadius: 10 ,offset: const Offset(0,0) ,spreadRadius : 5, color: Colors.black12)
                    ]
                ),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        //margin: EdgeInsets.symmetric(vertical: 20, horizontal: 0),
                        width: size.width * .85,
                        height: size.height * .3,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          //border: Border.all(color: Colors.black26),

                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.asset("assets/images/Screenshot (20).png",
                            fit: BoxFit.fill),
                      ),
                      Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          //padding: EdgeInsets.only(left: 12 ,right: 12 ,top:  3, bottom: 3),
                          child: Text(
                              "Thinkerhub project hunt,run on test.needs volunteers to study back-end and front-end using flutter and django .interested please update your registrtyion",
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black))),
                      Container(
                          margin:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                          //padding: EdgeInsets.only(left: 12 ,right: 12 ,top:  3, bottom: 3),
                          child: Row(children: [
                            Text("20-02-2021",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black))
                          ]))
                    ]),
              )
            ],
          ),
        ],
      ),
    );
  }
}
