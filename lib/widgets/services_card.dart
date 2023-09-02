import 'package:craftmyplateui/helper/rescale.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ServicesCard extends StatelessWidget {
  final String imageUrl;
  final String iconImage;
  final String iconText;
  final String des1;
  final String des2;
  final String des3;
  final String des4;

  ServicesCard(
      {Key? key,
      required this.imageUrl,
      required this.iconImage,
      required this.iconText,
      required this.des1,
      required this.des2,
      required this.des3,
      required this.des4})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: rescale(context, 310),
      //height: rescale(context, 200),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade300, width: 1),
          boxShadow: [
            BoxShadow(
              // Shadow color
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 1, // How far the shadow spreads
              blurRadius: 4, // The degree of blurring effect
              offset: Offset(0, 3),
            )
          ]),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset(
                  imageUrl, // Replace with your image path
                  width: rescale(context, 300),
                  height: rescale(context, 110),
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, bottom: 8),
                child: Row(
                  children: [
                    Image.asset(
                      iconImage, // Replace with your image path
                      width: rescale(context, 20),
                      height: rescale(context, 20),
                      fit: BoxFit.cover,
                    ),
                    //Image(image: AssetImage(iconImage,)),
                    SizedBox(
                      width: 3,
                    ),
                    Text(
                      iconText,
                      style: TextStyle(
                        fontSize: rescale(context, 18),
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF6318AF),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, bottom: 11),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image(image: AssetImage("assets/sparkles.png")),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          des1,
                          style: TextStyle(
                            fontSize: rescale(context, 14),
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF000000),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: rescale(context, 5),
                    ),
                    Row(
                      children: [
                        Image(image: AssetImage("assets/sparkles.png")),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          des2,
                          style: TextStyle(
                            fontSize: rescale(context, 14),
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF000000),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: rescale(context, 5),
                    ),
                    Row(
                      children: [
                        Image(image: AssetImage("assets/sparkles.png")),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          des3,
                          style: TextStyle(
                            fontSize: rescale(context, 14),
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF000000),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: rescale(context, 5),
                    ),
                    Row(
                      children: [
                        Image(image: AssetImage("assets/sparkles.png")),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          des4,
                          style: TextStyle(
                            fontSize: rescale(context, 14),
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF000000),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Center(
                child: Text(
                  ' Know More',
                  style: TextStyle(
                    fontSize: rescale(context, 12),
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF6318AF),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Color(0xFF6318AF),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                ),
              ),
              child: Text(
                "Recommended",
                style: GoogleFonts.lexend(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
