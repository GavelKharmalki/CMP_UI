import 'package:craftmyplateui/helper/rescale.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReusableCard extends StatelessWidget {
  final String text;
  final String imageUrl;
  const ReusableCard({Key? key, required this.text, required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        width: rescale(context, 140),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          //border: Border.all(color: Colors.grey.shade300, width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2), // Shadow color
              spreadRadius: 1, // How far the shadow spreads
              blurRadius: 5, // The degree of blurring effect
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 8,
              child: Container(
                decoration: BoxDecoration(
                  //borderRadius: BorderRadius.circular(16.0),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  image: DecorationImage(
                    image: AssetImage(imageUrl), // Replace with your image
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(text,
                  style: GoogleFonts.lexend(
                    fontSize: rescale(context, 14),
                    fontWeight: FontWeight.w500,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
