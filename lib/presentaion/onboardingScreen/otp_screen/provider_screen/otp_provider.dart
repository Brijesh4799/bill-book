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
  VerifyOtpModel?verifyOtpModel;

  int _timeLeft = 30;
  Timer? _timer;
  //int timerSeconds = 30;
  bool isResendEnabled = false;


  int get timeLeft => _timeLeft;
  String get timerText => "$_timeLeft seconds remaining";


  Future<void> verifyOtp({required String mobileNumber,required BuildContext context}) async {


    final resendOtpRepository = VerifyOtpRepository();
    try {
      var response = await resendOtpRepository.verifyOtpApi({
        'mobileNo': mobileNumber,
        'otp':otpController.text.trim()
      });
      if (response!.status == true) {
        verifyOtpModel=response;

        print("OTP resent successfully.");
        SharedPreferences pref = await SharedPreferences.getInstance();
        pref.setString("token", verifyOtpModel!.token!);
        print("Log in token is >>>>>>>>${pref.getString("token")}");
        if(verifyOtpModel!.data!.user!.isNewUser==true){
          navPushRemove(context: context, action: DetailForm(mobileNumber:mobileNumber,));

        }else{
          navPushRemove(context: context, action: HomeNavController());
        }


      } else {
        print("Failed to resend OTP.");
      }
    } catch (e) {
      print("Error resending OTP: $e");
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

  String get otp => otpController.text;
}

