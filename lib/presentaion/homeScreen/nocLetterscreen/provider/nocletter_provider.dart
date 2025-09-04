import 'package:flutter/cupertino.dart';

import '../repo/nocletter_repository.dart';

class NocLetterProvider with ChangeNotifier{
  TextEditingController nocDateController = TextEditingController();
  TextEditingController nocLrNumberController = TextEditingController();
  TextEditingController nocLrDateController = TextEditingController();
  TextEditingController nocNameController = TextEditingController();
  TextEditingController nocPhoneController = TextEditingController();
  TextEditingController nocEmailController = TextEditingController();
  TextEditingController nocMoveFromCityController = TextEditingController();
  TextEditingController nocMoveToCityController = TextEditingController();

  Future<void> nocletter({required String mobileNumber, required BuildContext context}) async {
    final nocletterRepository = NocLetterRepository();

    try {
      var response = await nocletterRepository.businessapi({
        'formData': {
          'nocLetterFor': {
            'nocType': 'Household Goods', // Make dynamic if needed
          },
          'nocForm': {
            'date': nocDateController.text.trim(),
            'lrNumber': nocLrNumberController.text.trim(),
            'lrDate': nocLrDateController.text.trim(),
            'name': nocNameController.text.trim(),
            'phone': nocPhoneController.text.trim(),
            'email': nocEmailController.text.trim(),
            'moveFromCity': nocMoveFromCityController.text.trim(),
            'moveToCity': nocMoveToCityController.text.trim(),
          },
        }
      });

      print('Response: $response'); // Optional: for debugging
      clearFields();
    } catch (e) {
      print('Error: $e');
    }

    notifyListeners();
  }

  void clearFields(){

    nocDateController.clear();
    nocLrNumberController.clear();
    nocLrDateController.clear();
    nocNameController.clear();
    nocPhoneController.clear();
    nocEmailController.clear();
    nocMoveFromCityController.clear();
    nocMoveToCityController.clear();

    notifyListeners();
  }
}