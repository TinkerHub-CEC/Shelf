import 'package:flutter/material.dart';

class TopBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: size.width * .85,
            height: size.height * .07,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    //padding: EdgeInsets.symmetric(),
                    alignment: Alignment.center,
                    width: size.width * .67,
                    height: size.height * .07,
                    decoration: BoxDecoration(
                      //color: Colors.black12,
                      border: Border.all(color: Colors.black26),

                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            print("object");
                          },
                          icon: Icon(
                            Icons.menu_sharp,
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          width: 200,
                          height: 30,
                          //color: Colors.red,
                          child: Text(
                            "Dashboard",
                             style : TextStyle(fontSize: 19, fontWeight: FontWeight.bold)
                          )
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: size.height * .07,
                    height: size.height * .07,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black26),

                      //color: Colors.black12,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: IconButton(
                      color: Colors.red,
                      onPressed: () {
                        print("object");
                      },
                      icon: Icon(
                        Icons.notifications_active_outlined,
                      ),
                    ),
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}
