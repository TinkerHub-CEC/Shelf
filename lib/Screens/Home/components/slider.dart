import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class SliderBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
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
                  image: AssetImage("assets/images/event-utsav.png"),
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black12),
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: AssetImage("assets/images/event-hacktober.png"),
                    fit: BoxFit.fitWidth),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black12),
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage("assets/images/event-uyilo.png"),
                  fit: BoxFit.fitHeight,
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
