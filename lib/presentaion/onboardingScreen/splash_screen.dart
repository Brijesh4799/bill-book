/*
import 'package:BillBook/core/widgets/custom_image_view.dart';
import 'package:BillBook/presentaion/homeScreen/home_controller.dart';
import 'package:BillBook/presentaion/onboardingScreen/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/localStorage/auth_token.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String? userToken;

  @override
  void initState() {
    super.initState();
    _checkToken();
  }

  Future<void> _checkToken() async {
    // Simulate a delay for the splash screen
    await Future.delayed(const Duration(milliseconds: 2500));

    SharedPreferences pref = await SharedPreferences.getInstance();
    //pref.setString("token", verifyOtpModel!.token!);
    print("Log in token is >>>>>>>>${pref.getString("token")}");

    // Navigate based on the token
    if (pref.getString("token") == true) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HomeNavController()),
       // MaterialPageRoute(builder: (context) => OBScreen()),
      );
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const OBScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: CustomImageView(
           imagePath:  "assets/images/Splash_Image.png",
          ),
        ),
      ),
    );
  }
}*/
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/widgets/custom_image_view.dart';
import '../homeScreen/home_controller.dart';
import 'onboarding_screen.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkToken();
  }

  Future<void> _checkToken() async {
    await Future.delayed(const Duration(milliseconds: 2500));

    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString("token");

    print("Login token is >>>>>>> $token");

    if (token != null && token.isNotEmpty) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HomeNavController()),
      );
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const OBScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: CustomImageView(
            imagePath: "assets/images/Splash_Image.png",
          ),
        ),
      ),
    );
  }
}
