import 'package:craftmyplateui/helper/rescale.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

//import '../constants/apptheme.dart';
class RightCircle extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  const RightCircle(
      {required this.imageUrl,
      required this.title,
      required this.subtitle,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          //margin: const EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.lexend(
                  fontWeight: FontWeight.w500,
                  fontSize: rescale(context, 16),
                  color: Color(0xFF6318AF),
                ),
              ),
              SizedBox(
                width: rescale(context, 198),
                child: Text(
                  subtitle,
                  style: GoogleFonts.lexend(
                    fontSize: rescale(context, 14),
                    fontWeight: FontWeight.w300,
                  ),
                  softWrap: true,
                ),
              ),
            ],
          ),
        ),
        Stack(
          children: [
            Container(
              width: rescale(context, 160),
              height: rescale(context, 120),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFF9EFE9).withOpacity(0.3),
                    //color: Colors.red,
                    blurRadius: 10,
                    spreadRadius: 5,
                    offset: const Offset(0, 0),
                  ),
                ],
              ),
            ),
            Positioned.fill(
              child: Center(
                child: SvgPicture.asset(
                  imageUrl,
                  width: rescale(context, 112),
                  height: rescale(context, 86),
                  // Other image properties you may need
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
