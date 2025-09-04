/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../model/survey_list_model.dart';
import '../repo/survey_repository.dart';
class SurveyProvider  with ChangeNotifier{
  TextEditingController nameController = TextEditingController();
   TextEditingController dateController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
   TextEditingController assessmentSurveyController = TextEditingController();
   TextEditingController moveFromController = TextEditingController();
   TextEditingController moveToController = TextEditingController();
 TextEditingController itemNameController = TextEditingController();
 TextEditingController itemQuantityController = TextEditingController();
 TextEditingController itemValueController = TextEditingController();
   TextEditingController itemRemarkController = TextEditingController();
 TextEditingController itemCFTController = TextEditingController();
   TextEditingController itemBoxNumberController = TextEditingController();
  SurveyListModel?surveyListModel;
  Future<void> surveylist({required String mobileNumber, required BuildContext context}) async {
    final updateSurveyListRepository = SurveyRepository();
    try {
      final requestBody = {
        "formData": {
          "customerDetails": {
            "name": nameController.text.trim(),
            "phone": phoneController.text.trim(),
            "assessmentSurvey": assessmentSurveyController.text.trim(),
            "date": dateController.text.trim(),
            "moveFrom": moveFromController.text.trim(),
            "moveTo": moveToController.text.trim(),
          },
          "itemParticulars": [
            {
              "itemName": itemNameController.text.trim(),
              "boxNumber": itemBoxNumberController.text.trim(),
              "quantity": int.tryParse(itemQuantityController.text.trim()) ?? 0,
              "value": double.tryParse(itemValueController.text.trim()) ?? 0,
              "cft": double.tryParse(itemCFTController.text.trim()) ?? 0,
              "remark": itemRemarkController.text.trim(),
            }
          ]
        }
      };
      var response = await updateSurveyListRepository.businessapi(requestBody);


      if (response != null && response.status == true) {
        // Clear form after success
        nameController.clear();
        dateController.clear();
        phoneController.clear();
        assessmentSurveyController.clear();
        moveFromController.clear();
        moveToController.clear();
        itemNameController.clear();
        itemQuantityController.clear();
        itemValueController.clear();
        itemRemarkController.clear();
        itemCFTController.clear();
        itemBoxNumberController.clear();


        // Optional: Show success message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Survey added successfully!")),
        );

        notifyListeners();
      } else {
        print("Something went wrong");
      }

    } catch (e) {
      print("Error sending Survey List: $e");
    }
    notifyListeners();
  }
}*/


import 'package:flutter/material.dart';
import '../model/survey_list_model.dart';
import '../repo/survey_repository.dart';

class SurveyProvider with ChangeNotifier {
  // Customer details controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController assessmentSurveyController = TextEditingController();
  TextEditingController moveFromController = TextEditingController();
  TextEditingController moveToController = TextEditingController();
  TextEditingController itemNameController = TextEditingController();
  TextEditingController itemQuantityController = TextEditingController();
  TextEditingController itemValueController = TextEditingController();
  TextEditingController itemRemarkController = TextEditingController();
  TextEditingController itemCFTController = TextEditingController();
  TextEditingController itemBoxNumberController = TextEditingController();

  // Items list (instead of single controllers for each item)
  List<Map<String, dynamic>> itemParticulars = [];

  SurveyListModel? surveyListModel;

  /// Add item manually
  void addItem({
    required String itemName,
    required String boxNumber,
    required String quantity,
    required String value,
    required String cft,
    required String remark,
  }) {
    itemParticulars.add({
      "itemName": itemName.trim(),
      "boxNumber": boxNumber.trim(),
      "quantity": int.tryParse(quantity.trim()) ?? 0,
      "value": double.tryParse(value.trim()) ?? 0,
      "cft": double.tryParse(cft.trim()) ?? 0,
      "remark": remark.trim(),
    });
    notifyListeners();
  }

  /// Remove item by index
  void removeItem(int index) {
    if (index >= 0 && index < itemParticulars.length) {
      itemParticulars.removeAt(index);
      notifyListeners();
    }
  }

  /// Clear everything
  void clearAll() {
    nameController.clear();
    dateController.clear();
    phoneController.clear();
    assessmentSurveyController.clear();
    moveFromController.clear();
    moveToController.clear();
    itemParticulars.clear();
    notifyListeners();
  }

  /// API call
  Future<void> surveylist({
    required String mobileNumber,
    required BuildContext context,
  }) async {
    final updateSurveyListRepository = SurveyRepository();
    try {
      final requestBody = {
        "formData": {
          "customerDetails": {
            "name": nameController.text.trim(),
            "phone": phoneController.text.trim(),
            "assessmentSurvey": assessmentSurveyController.text.trim(),
            "date": dateController.text.trim(),
            "moveFrom": moveFromController.text.trim(),
            "moveTo": moveToController.text.trim(),
          },
          "itemParticulars": itemParticulars, // dynamic list of items
        }
      };

      var response = await updateSurveyListRepository.businessapi(requestBody);

      if (response != null && response.status == true) {
        clearAll();

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Survey added successfully!")),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Something went wrong!")),
        );
      }
    } catch (e) {
      print("Error sending Survey List: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
    }
  }
}

