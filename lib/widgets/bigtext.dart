import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BigText extends StatelessWidget {
  final String text;
  const BigText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontFamily: 'Capriola',
          fontSize: 32,
          fontWeight: FontWeight.w400,
          color: Color(0xFFF7E5B7)),
    );
  }
}
