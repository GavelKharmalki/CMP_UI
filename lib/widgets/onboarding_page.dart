import 'package:craftmyplateui/helper/rescale.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingPage extends StatelessWidget {
  final Color colour;
  final String gifUrl;
  final String title;
  final String description;
  OnboardingPage({
    Key? key,
    required this.colour,
    required this.title,
    required this.description,
    required this.gifUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //width 375
    //height 667
    double screenwidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    print(screenHeight);
    print(screenwidth);
    return Column(
      children: [
        SizedBox(height: rescale(context, 70)),
        Container(
          height: rescale(context, 242),
          width: rescale(context, 242),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            //color: colour,
          ),
          child: Image.asset(gifUrl),
        ),
        SizedBox(
          height: rescale(context, 23),
        ),
        Container(
          height: rescale(context, 31),
          width: rescale(context, 327),
          child: Text(title,
              textAlign: TextAlign.center,
              style: GoogleFonts.lexend(
                fontSize: rescale(context, 25),
                fontWeight: FontWeight.w400,
              )),
        ),
        SizedBox(
          height: rescale(context, 16),
        ),
        Container(
          //color: Colors.red,
          width: rescale(context, 328),
          height: rescale(context, 120),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: GoogleFonts.lexend(
              fontSize: rescale(context, 16),
              fontWeight: FontWeight.w300,
              color: const Color(0xFF7B7B7B),
            ),
          ),
        ),
      ],
    );
  }
}
