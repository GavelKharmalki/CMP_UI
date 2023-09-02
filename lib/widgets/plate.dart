import 'package:craftmyplateui/helper/rescale.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContainerWithShape extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        //159
        //149
        width: rescale(context, 159),
        //height: rescale(context, 100),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8), // Set container border radius
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2), // Shadow color
              spreadRadius: 1, // Spread radius controls the shadow size
              blurRadius: 5, // Blur radius controls the blur effect
              offset: Offset(0, 3), // Offset controls the shadow's position
            ),
          ],
        ),
        //color: Colors.grey,
        child: Stack(
          clipBehavior: Clip.none, // Allow children to overflow the stack
          children: [
            // Positioned(
            //   top: 20,
            //   left: -28,
            //   child: Image.asset(
            //     "assets/plate.png",
            //     width: 103,
            //     height: 85,
            //   ),
            // ),
            Positioned(
              top: rescale(context, 11),
              left: rescale(context, -28),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Container(
                      //width: 159,
                      //height: 200,
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: -5,
                          blurRadius: 5,
                          offset: Offset(-11, 0),
                        ),
                      ], shape: BoxShape.circle),
                    ),
                  ),
                  Image.asset(
                    "assets/plate.png",
                    width: rescale(context, 110),
                    height: rescale(context, 85),
                  ),
                ],
              ),
            ),
            Positioned(
              top: rescale(context, 1), // Position the text at the top
              left: rescale(context, 10), // Align the text to the left
              right: 0, // Make the text take the full width
              child: Text(
                'Default Menu 1',
                style: GoogleFonts.lexend(
                  color: Colors.black,
                  fontSize: rescale(context, 12),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Positioned(
              top: rescale(context, 33), // Position the column text
              right: rescale(
                  context, 5), // Position the column to the right of the circle
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('3 starters',
                      style: GoogleFonts.lexend(
                          fontWeight: FontWeight.w300,
                          fontSize: rescale(context, 11))),
                  Text('3 maincourse',
                      style: GoogleFonts.lexend(
                          fontWeight: FontWeight.w300,
                          fontSize: rescale(context, 11))),
                  Text('3 desserts',
                      style: GoogleFonts.lexend(
                          fontWeight: FontWeight.w300,
                          fontSize: rescale(context, 11))),
                  Text('3 drink',
                      style: GoogleFonts.lexend(
                          fontWeight: FontWeight.w300,
                          fontSize: rescale(context, 11))),
                ],
              ),
            ),
            Positioned(
              //top: rescale(context, 100),
              bottom: rescale(
                  context, 1), // Position the new column below the "plate"
              left: 0, // Align the column to the left
              right: 0, // Make the column take the full width
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.person,
                          size: rescale(context, 13),
                          color: Color(0xFF7E7E7E),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: Text('Min 800',
                              style: GoogleFonts.lexend(
                                  color: Color(0xFF7E7E7E),
                                  fontWeight: FontWeight.w400,
                                  fontSize: rescale(context, 11))),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Row(
                        children: [
                          Text('Starts at',
                              style: GoogleFonts.lexend(
                                  color: Color(0xFF6318AF),
                                  fontWeight: FontWeight.w400,
                                  fontSize: rescale(context, 12))),
                          Text(' \u{20B9} 777',
                              style: GoogleFonts.lexend(
                                  color: Color(0xFF6318AF),
                                  fontWeight: FontWeight.w400,
                                  fontSize: rescale(context, 14))),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
