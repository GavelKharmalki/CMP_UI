import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../helper/rescale.dart';

class CarouselItem extends StatelessWidget {
  const CarouselItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //CAROUSEL ITEMS
    List<Widget> foodItems = [
      Stack(children: [
        Container(
          margin: const EdgeInsets.only(right: 9),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            image: const DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                    "assets/top-view-food-frame-with-copy-space.png")),
          ),
        ),
        Positioned(
          top: rescale(context, 15),
          left: rescale(context, 12),
          child: SizedBox(
            width: rescale(
                context, 165), // Set width as half of the available width
            child: Text(
              'Enjoy your first order, the taste of our delicious food!',
              style: GoogleFonts.lexend(
                  fontSize: rescale(context, 16),
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
              textAlign: TextAlign.start,
              softWrap: true,
            ),
          ),
        ),
        Positioned(
          bottom: rescale(context, 15),
          left: rescale(context, 12),
          child: DottedBorder(
            dashPattern: const [3, 4],
            borderType: BorderType.RRect,
            strokeWidth: 1,
            color: const Color(0xFF7B7B7B),
            child: ClipRRect(
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  child: Text("FIRSTPLATE01",
                      style: GoogleFonts.lexend(
                        color: const Color(0xFFF7E5B7),
                        letterSpacing: rescale(context, 2),
                        fontSize: rescale(context, 13),
                        fontWeight: FontWeight.w400,
                      )),
                ),
              ),
            ),
          ),
        )
      ]),
      Stack(children: [
        Container(
          margin: const EdgeInsets.only(right: 9),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            image: const DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                    "assets/top-view-food-frame-with-copy-space.png")),
          ),
        ),
        Positioned(
          top: rescale(context, 15),
          left: rescale(context, 12),
          child: SizedBox(
            width: rescale(context, 165),
            child: Text(
              'Enjoy your first order, the taste of our delicious food!',
              style: GoogleFonts.lexend(
                  fontSize: rescale(context, 16),
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
              textAlign: TextAlign.start,
              softWrap: true,
            ),
          ),
        ),
        Positioned(
          bottom: rescale(context, 15),
          left: rescale(context, 12),
          child: DottedBorder(
            dashPattern: const [3, 4],
            strokeWidth: 1,
            color: const Color(0xFF7B7B7B),
            child: ClipRRect(
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  child: Text("FIRSTPLATE01",
                      style: GoogleFonts.lexend(
                        color: const Color(0xFFF7E5B7),
                        letterSpacing: rescale(context, 2),
                        fontSize: rescale(context, 13),
                        fontWeight: FontWeight.w400,
                      )),
                ),
              ),
            ),
          ),
        )
      ]),
    ];

    return Container(
      margin: const EdgeInsets.only(top: 15),
      child: CarouselSlider(
        options: CarouselOptions(
          aspectRatio: 13 / 5,
          viewportFraction: 0.9,
          initialPage: 0,
          enableInfiniteScroll: false,
          reverse: false,
          autoPlay: false,
          autoPlayCurve: Curves.fastOutSlowIn,
          scrollDirection: Axis.horizontal,
          scrollPhysics: BouncingScrollPhysics(),
        ),
        items: foodItems,
      ),
    );
  }
}
