import 'package:flutter/cupertino.dart';

import '../repo/tws_form_repository.dart';

class TwsFormProvider with ChangeNotifier{
  TextEditingController movingDateController = TextEditingController();
  TextEditingController lrNumberController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController moveFromCityController = TextEditingController();
  TextEditingController moveFromAddressController = TextEditingController();
  TextEditingController moveToCityController = TextEditingController();
  TextEditingController moveToAddressController = TextEditingController();

  Future<void> twsform({
    required String mobileNumber,
    required BuildContext context,
  }) async {
    final twsformRepository = TwsFormRepository();

    try {
      var response = await twsformRepository.businessapi({
        "formData": {
         // "movingType": movingTypeController.text.trim(), // <-- Add this
          "date": movingDateController.text.trim(),
          "lrNumber": lrNumberController.text.trim(),
          "name": nameController.text.trim(),
          "phone": phoneController.text.trim(),
          "email": emailController.text.trim(),
          "moveFromCity": moveFromCityController.text.trim(),
          "moveFromAddress": moveFromAddressController.text.trim(),
          "moveToCity": moveToCityController.text.trim(),
          "moveToAddress": moveToAddressController.text.trim(),
        }
      });

      print("TWS form submitted successfully: $response");
      clearFields();

    } catch (e) {
      print('Error submitting TWS form: $e');
    }

    notifyListeners();
  }
  void clearFields() {
    movingDateController.clear();
    lrNumberController.clear();
    nameController.clear();
    phoneController.clear();
    emailController.clear();
    moveFromCityController.clear();
    moveFromAddressController.clear();
    moveToCityController.clear();
    moveToAddressController.clear();

    notifyListeners();
  }
}