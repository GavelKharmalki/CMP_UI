import 'package:craftmyplateui/helper/rescale.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../model/starters_item_model.dart';

class CustomCard extends StatelessWidget {
  final String text;
  final String imageUrl;

  CustomCard({required this.text, required this.imageUrl, Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: EdgeInsets.only(left: 20),
      child: Card(
        //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
        //color: Colors.transparent,
        elevation: 2, // Set elevation to 0
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
            child: Image.asset(
              'assets/plate-food-with-different-dishes-including-chicken-rice-other-food 1.png',
              fit: BoxFit.cover,
              height: rescale(context, 83), // Adjust the height as desired
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text("YES",
                  style: GoogleFonts.lexend(
                    fontSize: rescale(context, 14),
                    fontWeight: FontWeight.w400,
                  )),
            ),
          ),
        ]),
      ),
    );
  }
}
