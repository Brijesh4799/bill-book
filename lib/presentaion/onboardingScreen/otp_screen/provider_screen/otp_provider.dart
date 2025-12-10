

import 'dart:async';
import 'package:BillBook/core/widgets/navigation_method.dart';
import 'package:BillBook/presentaion/onboardingScreen/otp_screen/model/otp_verify_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../homeScreen/home_controller.dart';
import '../../update_profile/ui/detail_form_screen.dart';
import '../../login_screen/repo/login_repository.dart';
import '../repo/otp_repository.dart';

class OtpProvider with ChangeNotifier {
  final TextEditingController otpController = TextEditingController();
  final FocusNode otpFocusNode = FocusNode();
  VerifyOtpModel? verifyOtpModel;

  int _timeLeft = 30;
  Timer? _timer;
  bool isResendEnabled = false;

  int get timeLeft => _timeLeft;
  String get timerText => "$_timeLeft seconds remaining";

  // ✅ Updated to accept fcmToken
  Future<void> verifyOtp({
    required String mobileNumber,
    required BuildContext context,
    required String fcmToken, // ✅ Added parameter here
  }) async {
    final resendOtpRepository = VerifyOtpRepository();
    try {
      // ✅ Send fcmToken along with the other parameters
      var response = await resendOtpRepository.verifyOtpApi({
        'mobileNo': mobileNumber,
        'otp': otpController.text.trim(),
        'deviceToken': fcmToken, // ✅ Added here in API payload
      });

      if (response!.status == true) {
        verifyOtpModel = response;

        SharedPreferences pref = await SharedPreferences.getInstance();
        pref.setString("token", verifyOtpModel!.token!);
        print("Token stored in SharedPreferences: ${verifyOtpModel!.token}");
        print('>>>>>>>>>>>>>>>>>>>${fcmToken}');

        if (verifyOtpModel!.data!.user!.isNewUser == true) {
          navPushRemove(
              context: context,
              action: DetailForm(mobileNumber: mobileNumber));
        } else {
          navPushRemove(context: context, action: HomeNavController());
        }
      } else {
        print("Failed to verify OTP.");
      }
    } catch (e) {
      print("Error verifying OTP: $e");
    }
    notifyListeners();
  }

  void startTimer() {
    _timeLeft = 30;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timeLeft > 0) {
        _timeLeft--;
        notifyListeners();
      } else {
        _timer?.cancel();
      }
    });
    notifyListeners();
  }

  void disposeTimer() {
    _timer?.cancel();
    otpFocusNode.dispose();
    otpController.dispose();
  }

  void clearFields() {
    otpController.clear();
    _timeLeft = 30;
    isResendEnabled = false;
    notifyListeners();
  }

  String get otp => otpController.text;
}
