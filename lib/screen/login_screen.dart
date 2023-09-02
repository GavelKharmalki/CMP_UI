import 'package:craftmyplateui/helper/rescale.dart';
import 'package:craftmyplateui/screen/otp_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static String verify = "";
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController countryCode = TextEditingController();
  var phone = "";

  @override
  void initState() {
    countryCode.text = "+91";
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  //Cloud shape
                  Center(
                    child: Container(
                      height: rescale(context, 243),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage('assets/cloud.png'),
                        fit: BoxFit.cover,
                      )),
                      //color: Colors.green,
                      // child:
                      //     Image.asset('assets/cloud.png', fit: BoxFit.fitWidth),
                    ),
                  ),
                  //Logo
                  Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: rescale(context, 28),
                        ),
                        Container(
                          child:
                              Center(child: Image.asset('assets/CMPLogo.png')),
                        ),
                        Text(
                          "CraftMyPlate",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.lexend(
                            fontSize: rescale(context, 20),
                            //height: 30 / rescale(context, 20),
                            fontWeight: FontWeight.w400,
                            color: Color(0xFFFCFFF7),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: rescale(context, 30),
              ),

              //************************* Login or SignUp ****************************
              Padding(
                padding: const EdgeInsets.only(left: 24.0),
                child: Text(
                  "Login or Signup",
                  style: GoogleFonts.lexend(
                    fontSize: rescale(context, 14),
                    //height: 30 / rescale(context, 20),
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF787878),
                  ),
                ),
              ),
              SizedBox(
                height: rescale(context, 20),
              ),
              //*********************** Number Text field **************************
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Container(
                  decoration: BoxDecoration(
                    //color: Colors.grey[200],
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 16, right: 16), // Adjust padding as needed
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          '+91 ',
                          style: GoogleFonts.lexend(
                            fontSize: rescale(context, 14),
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF000000),
                          ),
                        ),
                        Expanded(
                          child: Baseline(
                            baseline: 25, // Adjust this value to align the text
                            baselineType: TextBaseline.alphabetic,
                            child: TextField(
                              onChanged: (value) {
                                phone = value;
                              },
                              //controller: phoneNumberController,
                              style: GoogleFonts.lexend(
                                fontSize: rescale(context, 14),
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF000000),
                              ),
                              keyboardType: TextInputType.numberWithOptions(),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Enter Phone Number',
                                hintStyle: GoogleFonts.lexend(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFFAAAAAA),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              //************************Continue Button************************
              SizedBox(
                height: rescale(context, 16),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: GestureDetector(
                  onTap: () async {
                    await FirebaseAuth.instance.verifyPhoneNumber(
                      phoneNumber: '${countryCode.text + phone}',
                      verificationCompleted:
                          (PhoneAuthCredential credential) {},
                      verificationFailed: (FirebaseAuthException e) {},
                      codeSent: (String verificationId, int? resendToken) {
                        LoginScreen.verify = verificationId;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  OtpScreen(phoneNumber: phone),
                            ));
                      },
                      codeAutoRetrievalTimeout: (String verificationId) {},
                    );
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
                        "Continue",
                        style: GoogleFonts.lexend(
                          fontSize: rescale(context, 14),
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              //******************** Terms of Service & Privacy Policy**************
              Spacer(),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: [
                    Text(
                      "By continuing, you agree to our",
                      style: GoogleFonts.lexend(
                        fontSize: rescale(context, 14),
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF7B7B7B),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Terms of Service",
                          style: GoogleFonts.lexend(
                            fontSize: rescale(context, 14),
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF7B7B7B),
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Privacy Policy",
                          style: GoogleFonts.lexend(
                            fontSize: rescale(context, 14),
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF7B7B7B),
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
