import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/helperFuntions.dart';
import '../../../../core/widgets/custom_Textbutton.dart';
import '../../../../core/widgets/custom_image_view.dart';
import '../../update_profile/ui/detail_form_screen.dart';

import '../provider_screen/otp_provider.dart';


class OTPScreen extends StatefulWidget {
  final String mobileNumber;
  const OTPScreen({Key? key, required this.mobileNumber}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final otpProvider = Provider.of<OtpProvider>(context, listen: true);

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
          color: Colors.white,
          width: screenWidth,
          height: screenHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomImageView(imagePath: 'assets/images/LoGo.png', width: screenWidth),
              SizedBox(height: screenHeight * 0.02),
              Text(
                'Please Enter 4 Digit OTP We have sent To +91 ${widget.mobileNumber}',
                style: TextStyle(fontSize: screenWidth * 0.04),
              ),
              SizedBox(height: screenHeight * 0.02),
              Center(
                child: Pinput(

                  controller: otpProvider.otpController,
                  length: 4,
                  focusNode: otpProvider.otpFocusNode,
                  defaultPinTheme: PinTheme(
                    width: screenWidth * 0.15,
                    height: screenHeight * 0.08,
                    textStyle: TextStyle(
                      color: const Color(0xFF137DC7),
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFF137DC7)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: screenHeight * 0.008),
                alignment: Alignment.centerLeft,
                child: otpProvider.timeLeft == 30 || otpProvider.timeLeft == 0
                    ? RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Didn\'t get OTP? ',
                        style: TextStyle(color: Colors.black),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            otpProvider.startTimer();
                          },
                      ),
                      TextSpan(
                        text: 'Resend OTP?',
                        style: TextStyle(color: Color(0xFF137DC7)),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            otpProvider.startTimer();
                          },
                      ),
                    ],
                  ),
                )
                    : Text(otpProvider.timerText),
              ),
              SizedBox(height: screenHeight * 0.06),
              CustomButton(
                label: 'Continue',
                onPressed: () async {
                  otpProvider.verifyOtp(mobileNumber: widget.mobileNumber,context: context);

                  // Proceed to next screen
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => const DetailForm()),
                  // );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}


