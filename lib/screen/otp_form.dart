import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtpForm extends StatefulWidget {
  final String otp;
  const OtpForm({Key? key, required this.otp}) : super(key: key);

  @override
  State<OtpForm> createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  String otp = "";
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: 38,
            width: 38,
            child: TextFormField(
              onChanged: (value) {
                if (value.length == 1) {
                  setState(() {
                    otp += value; // Append the entered digit to the OTP string
                  });
                }
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
                if (value.length == 1) {
                  setState(() {
                    otp += value; // Append the entered digit to the OTP string
                  });
                }
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
                if (value.length == 1) {
                  setState(() {
                    otp += value; // Append the entered digit to the OTP string
                  });
                }
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
                if (value.length == 1) {
                  setState(() {
                    otp += value; // Append the entered digit to the OTP string
                  });
                }
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
                if (value.length == 1) {
                  setState(() {
                    otp += value; // Append the entered digit to the OTP string
                  });
                }
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
                if (value.length == 1) {
                  setState(() {
                    otp += value; // Append the entered digit to the OTP string
                  });
                }
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
    );
  }
}
