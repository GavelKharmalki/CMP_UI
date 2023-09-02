import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../helper/rescale.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(top: 24, left: 24, right: 24),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Container(
        //margin: EdgeInsets.only(top: 10, left: 24, right: 24),
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Color(0x1A7A20D4),
              spreadRadius: 1,
              blurRadius: 4,
              offset: Offset(0, 1), // Adjust the offset for the shadow
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search food or events',
                  hintStyle: GoogleFonts.lexend(
                    fontSize: rescale(context, 14),
                    fontWeight: FontWeight.w300,
                    color: Color(0xFF545454),
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            Icon(
              Icons.search,
              color: Color(0xFF6318AF),
            ),
          ],
        ),
      ),
    );
  }
}
