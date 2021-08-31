import 'package:flutter/material.dart';

import 'package:shelf/Screens/Home/components/slider.dart';

import 'package:shelf/providers/is_user_admin.dart';

class HomeAdminFeatures extends StatelessWidget {
  const HomeAdminFeatures({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
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
            return SliderBox();
          }
        });
  }
}
