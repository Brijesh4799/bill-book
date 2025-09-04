import 'package:flutter/cupertino.dart';

import '../repo/fov_scf_form_repository.dart';

class FovScfFormProvider with ChangeNotifier{

  TextEditingController fovMovingDateController = TextEditingController();
  TextEditingController fovLrNumberController = TextEditingController();
  TextEditingController fovNameController = TextEditingController();
  TextEditingController fovPhoneController = TextEditingController();
  TextEditingController fovEmailController = TextEditingController();
  TextEditingController fovMoveFromCityController = TextEditingController();
  TextEditingController fovMoveToCityController = TextEditingController();

  Future<void> fovscfform({required String mobileNumber, required BuildContext context}) async {
    final fovscfformRepository = FovScfFormRepository();

    try {
      var response = await fovscfformRepository.businessapi({
        'formData': {
          'fovScf': {
            'fovScfType': 'Household Goods',  // you can replace this with a dynamic value if needed
            'date': fovMovingDateController.text.trim(),
            'lrNumber': fovLrNumberController.text.trim(),
            'name': fovNameController.text.trim(),
            'phone': fovPhoneController.text.trim(),
            'email': fovEmailController.text.trim(),
            'moveFromCity': fovMoveFromCityController.text.trim(),
            'moveToCity': fovMoveToCityController.text.trim(),
          },
          'insuranceDetails': {
            'insuranceRiskType': "Not Insured - At Owner's Risk",  // also make dynamic if needed
            'insuranceChargePercent': "0%",
          }
        }
      });

      // You may want to show a success message or handle the response
      print('Response: $response');
      clearFields();
    } catch (e) {
      print('Error: $e');
    }

    notifyListeners();
  }

  void clearFields() {
    fovMovingDateController.clear();
    fovLrNumberController.clear();
    fovNameController.clear();
    fovPhoneController.clear();
    fovEmailController.clear();
    fovMoveFromCityController.clear();
    fovMoveToCityController.clear();


    notifyListeners();
  }

}