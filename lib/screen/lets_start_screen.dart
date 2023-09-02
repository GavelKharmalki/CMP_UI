import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:craftmyplateui/screen/homescreen/homescreen.dart';
import 'package:craftmyplateui/screen/splashscreen2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../helper/rescale.dart';

class LetStart extends StatefulWidget {
  LetStart({Key? key}) : super(key: key);

  @override
  State<LetStart> createState() => _LetStartState();
}

class _LetStartState extends State<LetStart> {
  final TextEditingController _fullname = TextEditingController();

  final TextEditingController _emailid = TextEditingController();

  void _savetoDatabase() async {
    String fullname = _fullname.text;
    String email = _emailid.text;

    // Save to Firestore
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    DocumentReference userRef = await firestore.collection('users').add({
      'fullname': fullname,
      'email': email,
    });

    // Get the current user
    User? currentUser = FirebaseAuth.instance.currentUser;

    // Update display name and email in FirebaseAuth
    if (currentUser != null) {
      try {
        // Update display name
        await currentUser.updateDisplayName(fullname);
        print('Display name updated successfully');

        // Update email
        await currentUser.updateEmail(email);

        print('Email updated successfully');
      } catch (e) {
        print('Failed to update display name and email: $e');
      }
    }
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomeScreen()));
    // Data saved successfully
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Color(0xfff7f6f0),
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            alignment: Alignment.center,
            // height: 14,
            // width: 7,
            child: Icon(
              Icons.arrow_back_ios,
              size: 20,
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: rescale(context, 24),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              "Just a step away !",
              textAlign: TextAlign.left,
              style: GoogleFonts.lexend(
                fontSize: rescale(context, 20),
                //height: 30 / rescale(context, 20),
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(
            height: rescale(context, 24),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Container(
              width: rescale(context, 326),
              height: rescale(context, 40),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Color(0xFFC9C5C9)),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 13, top: 12),
                child: TextField(
                  controller: _fullname,
                  style: GoogleFonts.lexend(
                    fontSize: rescale(context, 16),
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                  //controller: _emailController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Full name*',
                    hintStyle: GoogleFonts.lexend(
                      fontSize: rescale(context, 14),
                      fontWeight: FontWeight.w400,
                      color: Color(0xFFAAAAAA),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: rescale(context, 16),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Container(
              width: rescale(context, 326),
              height: rescale(context, 40),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Color(0xFFC9C5C9)),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 13, top: 12),
                child: TextField(
                  controller: _emailid,
                  style: GoogleFonts.lexend(
                    fontSize: rescale(context, 16),
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                  //controller: _emailController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Email ID*',
                    hintStyle: GoogleFonts.lexend(
                      fontSize: rescale(context, 14),
                      fontWeight: FontWeight.w400,
                      color: Color(0xFFAAAAAA),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Spacer(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: GestureDetector(
                onTap: () async {
                  print("what should i do");
                  print(_fullname);
                  _savetoDatabase();
                },
                child: Container(
                  width: rescale(context, 327),
                  height: rescale(context, 44),
                  decoration: BoxDecoration(
                    color: Color(0xFF6318AF),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      "Let's Start",
                      style: GoogleFonts.lexend(
                        fontSize: rescale(context, 16),
                        fontWeight: FontWeight.w400,
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: rescale(context, 10),
          )
        ],
      ),
    );
  }
}
