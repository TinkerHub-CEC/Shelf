import 'package:flutter/material.dart';

import 'package:shelf/Screens/Home/components/slider.dart';

import 'package:shelf/providers/is_user_admin.dart';
import 'package:shelf/size_config.dart';

class HomeAdminFeatures extends StatelessWidget {
  const HomeAdminFeatures({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    SizeConfig().init(context);
    Size size = MediaQuery.of(context).size;
    return FutureBuilder<bool?>(
        future: isUserAdmin(),
        builder: (context, AsyncSnapshot<bool?> snapshot) {
          if (snapshot.data == true) {
            return Container(
              child: Center(
                child: Text("Ongoing Events",
                    style: TextStyle(
                      fontSize: 17,
                    ),
                    textAlign: TextAlign.center),
              ),
            );
          } else {
            return Column(
              children: [
                Container(child: SliderBox()),
                SizedBox(height: size.height * 0.04),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          left: SizeConfig.blockSizeHorizontal * 9),
                      child: Text(
                        "UPCOMING EVENTS",
                        style: TextStyle(
                            fontSize: SizeConfig.safeBlockHorizontal * 4.6,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            );
          }
        });
  }
}
