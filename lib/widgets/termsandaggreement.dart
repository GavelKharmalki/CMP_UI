import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Term extends StatelessWidget {
  const Term({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "By continuing, you agree to our",
            style: GoogleFonts.lexend(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0xFF7B7B7B),
            ),
          ),
          Text(
            "By continuing, you agree to our",
            style: GoogleFonts.lexend(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0xFF7B7B7B),
            ),
          ),
        ],
      ),
    );
  }
}
