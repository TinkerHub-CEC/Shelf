import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class SliderBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(children: [

          CarouselSlider(
            options: CarouselOptions(

              enlargeCenterPage: true,
              autoPlay: true,
              height: size.height * 0.25,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastLinearToSlowEaseIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              viewportFraction: 0.8,
            ),
            items: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12),
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image:  AssetImage("assets/images/welcome.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12),
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage("assets/images/Screenshot (20).png"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12),
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage("assets/images/login.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              )
            ],
          )
        ],
      );
  }
}
