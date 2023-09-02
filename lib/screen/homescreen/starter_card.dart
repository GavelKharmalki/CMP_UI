import 'package:craftmyplateui/helper/rescale.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StarterCard extends StatelessWidget {
  final String text;
  final String imageUrl;
  StarterCard({super.key, required this.text, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: Colors.white,
      elevation: 2,
      shadowColor: Colors.black.withOpacity(0.6),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
          child: Image.asset(
            imageUrl,
            fit: BoxFit.cover,
            height: rescale(context, 90), // Adjust the height as desired
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(text,
                style: GoogleFonts.lexend(
                  fontSize: rescale(context, 14),
                  fontWeight: FontWeight.w500,
                )),
          ),
        ),
      ]),
    );
  }
}
