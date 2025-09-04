import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/helperFuntions.dart';
import '../../../../core/widgets/custom_Textbutton.dart';
import '../../../../core/widgets/custom_image_view.dart';
import '../../../../core/widgets/navigation_method.dart';
import '../../otp_screen/ui/otp_screen.dart';
import '../repo/login_repository.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String selectedCountryCode = '+91';
  final List<String> countryCodes = ['+91', '+1', '+44', '+61'];
  final TextEditingController numberController = TextEditingController();

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            width: screenWidth,
            height: screenHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomImageView(
                  imagePath: 'assets/images/LoGo.png',
                  width: screenWidth * 0.8,
                ),
                SizedBox(height: screenHeight * 0.03),
                Text(
                  'Please Enter Your Mobile Number',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: screenHeight * 0.03),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFF137DC7), width: 1.5),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: selectedCountryCode,
                          items: countryCodes.map((String code) {
                            return DropdownMenuItem<String>(
                              value: code,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  code,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedCountryCode = newValue!;
                            });
                          },
                          icon: Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Icon(Icons.arrow_drop_down),
                          ),
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 1.5,
                        color: Color(0xFF137DC7),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: TextField(
                            keyboardType: TextInputType.phone,
                            controller: numberController,
                            maxLength: 10,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              counterText: '',
                              hintText: 'Enter your Mobile number',
                              hintStyle: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Checkbox(
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value ?? false;
                        });
                      },
                    ),
                    Expanded( // Added Expanded to prevent overflow
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'I agree with the ',
                              style: TextStyle(color: Colors.black, fontSize: 16),
                            ),
                            TextSpan(
                              text: 'Terms & Conditions',
                              style: TextStyle(color: Color(0xFF137DC7), fontSize: 16),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  print('Terms & Conditions tapped');
                                },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.06),
                CustomButton(
                  label: 'Get OTP',
                  onPressed: () async {
                    HelperFunctions helper = HelperFunctions();
                    bool isConnected = await helper.isConnected();

                    if (!isConnected) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('No internet connection')),
                      );
                      return;
                    }

                    if (numberController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Please enter your number')),
                      );
                      return;
                    } else if (numberController.text.length < 10) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Please enter your correct number')),
                      );
                      return;
                    } else if (!isChecked) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Please agree to the Terms & Conditions')),
                      );
                      return;
                    }

                    try {
                      final payload = {
                        'mobileNo': numberController.text.trim(),
                        'countryCode': selectedCountryCode,
                      };

                      var response = await LoginRepository().getOtpApi(payload);

                      if (response['success'] == true) {
                        navPush(
                          context: context,
                          action: OTPScreen(mobileNumber: numberController.text.trim()),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(response['message'] ?? "Something went wrong")),
                        );
                      }
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("An error occurred: $e")),
                      );
                    }
                  },

                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
