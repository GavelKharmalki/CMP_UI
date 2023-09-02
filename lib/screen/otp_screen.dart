import 'package:craftmyplateui/helper/rescale.dart';
import 'package:craftmyplateui/screen/lets_start_screen.dart';
import 'package:craftmyplateui/screen/login_screen.dart';
import 'package:craftmyplateui/screen/otp_form.dart';
import 'package:craftmyplateui/screen/splashscreen2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class OtpScreen extends StatefulWidget {
  final String phoneNumber;
  const OtpScreen({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String pin1 = "";
  String pin2 = "";
  String pin3 = "";
  String pin4 = "";
  String pin5 = "";
  String pin6 = "";
  String getOtp() {
    return pin1 + pin2 + pin3 + pin4 + pin5 + pin6;
  }

  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    String maskedPhoneNumber = '+91-XXXXXX' + widget.phoneNumber.substring(6);
    return Scaffold(
        backgroundColor: const Color(0xfff7f6f0),
        appBar: AppBar(
          backgroundColor: Color(0xfff7f6f0),
          elevation: 0,
          leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              alignment: Alignment.center,
              height: 14,
              width: 7,
              child: Icon(
                Icons.arrow_back_ios,
                size: 20,
              ),
            ),
          ),
          title: Text(
            'OTP Verification',
            style: GoogleFonts.lexend(
              color: Colors.black,
              fontSize: rescale(context, 16),
            ),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            SizedBox(
              height: rescale(context, 24),
            ),
            //Text and number
            Container(
              //color: Colors.blue,
              child: Text(
                'We have sent a verification code to',
                style: GoogleFonts.lexend(
                  color: Colors.black,
                  fontSize: rescale(context, 16),
                ),
              ),
            ),
            Container(
              //color: Colors.blue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    maskedPhoneNumber,
                    //widget.phoneNumber,
                    style: GoogleFonts.lexend(
                      color: Colors.black,
                      fontSize: rescale(context, 16),
                    ),
                  ),
                  Icon(
                    Icons.verified,
                    color: Colors.green,
                  )
                ],
              ),
            ),
            SizedBox(
              height: rescale(context, 44),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child:
                    //OtpForm(otp:),
                    Form(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 38,
                        width: 38,
                        child: TextFormField(
                          onChanged: (value) {
                            setState(() {
                              pin1 = value;
                            });
                            if (value.length == 1) {}
                            FocusScope.of(context).nextFocus();
                          },
                          onSaved: (pin1) {},
                          style: Theme.of(context).textTheme.titleLarge,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 38,
                        width: 38,
                        child: TextFormField(
                          onChanged: (value) {
                            setState(() {
                              pin2 = value;
                            });
                            if (value.length == 1) {}
                            FocusScope.of(context).nextFocus();
                          },
                          onSaved: (pin2) {},
                          style: Theme.of(context).textTheme.titleLarge,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 38,
                        width: 38,
                        child: TextFormField(
                          onChanged: (value) {
                            setState(() {
                              pin3 = value;
                            });
                            if (value.length == 1) {}
                            FocusScope.of(context).nextFocus();
                          },
                          onSaved: (pin3) {},
                          style: Theme.of(context).textTheme.titleLarge,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 38,
                        width: 38,
                        child: TextFormField(
                          onChanged: (value) {
                            setState(() {
                              pin4 = value;
                            });
                            if (value.length == 1) {}
                            FocusScope.of(context).nextFocus();
                          },
                          onSaved: (pin4) {},
                          style: Theme.of(context).textTheme.titleLarge,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 38,
                        width: 38,
                        child: TextFormField(
                          onChanged: (value) {
                            setState(() {
                              pin5 = value;
                            });
                            if (value.length == 1) {}
                            FocusScope.of(context).nextFocus();
                          },
                          onSaved: (pin5) {},
                          style: Theme.of(context).textTheme.titleLarge,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 38,
                        width: 38,
                        child: TextFormField(
                          onChanged: (value) {
                            setState(() {
                              pin6 = value;
                            });
                            if (value.length == 1) {}
                            FocusScope.of(context).nextFocus();
                          },
                          onSaved: (pin6) {},
                          style: Theme.of(context).textTheme.titleLarge,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: rescale(context, 16),
            ),
            SizedBox(
              height: rescale(context, 44),
              width: rescale(context, 327),
              child: Container(
                alignment: Alignment.center,
                decoration: ShapeDecoration(
                  color: const Color(0xFF6318AF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: TextButton(
                  onPressed: () async {
                    String otp = getOtp();
                    try {
                      PhoneAuthCredential credential =
                          PhoneAuthProvider.credential(
                              verificationId: LoginScreen.verify, smsCode: otp);

                      // Sign the user in (or link) with the credential
                      await auth.signInWithCredential(credential);
                      print("OTP: $otp");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LetStart(),
                          ));
                    } catch (e) {
                      // Handle verification failure or other errors
                      print('Error: $e');
                      // You can display an error message to the user
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Verification failed')),
                      );
                    }
                  },
                  child: Text(
                    "Submit",
                    style: GoogleFonts.lexend(
                      color: Colors.white,
                      fontSize: rescale(context, 16),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
            //Resend Again text
            SizedBox(
              height: rescale(context, 16),
            ),
            SizedBox(
              child: Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Didn't receive code?",
                      style: GoogleFonts.lexend(
                        fontSize: rescale(context, 16),
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.50,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        //resendOtp();
                      },
                      child: Text(
                        "Resend Again.",
                        style: GoogleFonts.lexend(
                          color: const Color(0xFF6318AF),
                          fontSize: rescale(context, 16),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            //OTP form
          ],
        ));
  }
}
