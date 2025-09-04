/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../repo/packing_list_repository.dart';

class PackingProvider  with ChangeNotifier{

   TextEditingController nameController = TextEditingController();
   TextEditingController dateController = TextEditingController();
   TextEditingController phoneController = TextEditingController();
   TextEditingController packingNoController = TextEditingController();
   TextEditingController moveFromController = TextEditingController();
   TextEditingController moveToController = TextEditingController();
   TextEditingController vehicalNoController = TextEditingController();

   //iteam particul details
   TextEditingController itemNameController = TextEditingController();
   TextEditingController itemQuantityController = TextEditingController();
   TextEditingController itemValueController = TextEditingController();
   TextEditingController itemRemarkController = TextEditingController();
   TextEditingController itemCFTController = TextEditingController();
   TextEditingController itemBoxNumberController = TextEditingController();


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

   Future<void> packinglist({required String mobileNumber, required BuildContext context}) async {
     final updatePackingListRepository = PackingListRepository();
     try {
       final requestBody = {
         "formData": {
           "customerDetails": {
             "name": nameController.text.trim(),
             "phone": phoneController.text.trim(),
             "packingNumber": packingNoController.text.trim(),
             "date": dateController.text.trim(),
             "moveFrom": moveFromController.text.trim(),
             "moveTo": moveToController.text.trim(),
             "vehicleNo": vehicalNoController.text.trim(),
           },
          */
/* "itemParticulars": [
             {
               "itemName": itemNameController.text.trim(),
               "boxNumber": itemBoxNumberController.text.trim(),
               "quantity": int.tryParse(itemQuantityController.text.trim()) ?? 0,
               "value": double.tryParse(itemValueController.text.trim()) ?? 0,
               "cft": double.tryParse(itemCFTController.text.trim()) ?? 0,
               "remark": itemRemarkController.text.trim(),
             }
           ]*//*

           "itemParticulars": itemParticulars,
         }
       };

       var response = await updatePackingListRepository.businessapi(requestBody);
       print("Packing List Submitted: $response");
       if (response != null && response.status == true) {
         // Clear form after success
         nameController.clear();
         dateController.clear();
         phoneController.clear();
         packingNoController.clear();
         moveFromController.clear();
         moveToController.clear();
         vehicalNoController.clear();
         itemNameController.clear();
         itemQuantityController.clear();
         itemValueController.clear();
         itemRemarkController.clear();
         itemCFTController.clear();
         itemBoxNumberController.clear();



         // Optional: Show success message
         ScaffoldMessenger.of(context).showSnackBar(
           SnackBar(content: Text("Packing added successfully!")),
         );

         notifyListeners();
       } else {
         print("Something went wrong");
       }

     } catch (e) {
       print('Error sending Packing List: $e');
     }
     notifyListeners();
   }
}*/

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../repo/packing_list_repository.dart';

class PackingProvider with ChangeNotifier {
  // Customer Details Controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController packingNoController = TextEditingController();
  TextEditingController moveFromController = TextEditingController();
  TextEditingController moveToController = TextEditingController();
  TextEditingController vehicalNoController = TextEditingController();

  // Item Particulars Controllers
  TextEditingController itemNameController = TextEditingController();
  TextEditingController itemQuantityController = TextEditingController();
  TextEditingController itemValueController = TextEditingController();
  TextEditingController itemRemarkController = TextEditingController();
  TextEditingController itemCFTController = TextEditingController();
  TextEditingController itemBoxNumberController = TextEditingController();

  // List to store multiple items
  List<Map<String, dynamic>> itemParticulars = [];

  /// Add a new item to the list
  void addItem({
    required String itemName,
    required String boxNumber,
    required String quantity,
    required String value,
    required String cft,
    required String remark,
  }) {
    if (itemName.trim().isEmpty) return;

    itemParticulars.add({
      "itemName": itemName.trim(),
      "boxNumber": boxNumber.trim(),
      "quantity": int.tryParse(quantity.trim()) ?? 0,
      "value": double.tryParse(value.trim()) ?? 0,
      "cft": double.tryParse(cft.trim()) ?? 0,
      "remark": remark.trim(),
    });

    // Clear item input fields after adding
    itemNameController.clear();
    itemBoxNumberController.clear();
    itemQuantityController.clear();
    itemValueController.clear();
    itemCFTController.clear();
    itemRemarkController.clear();

    notifyListeners();
  }

  /// Remove an item by index
  void removeItem(int index) {
    if (index >= 0 && index < itemParticulars.length) {
      itemParticulars.removeAt(index);
      notifyListeners();
    }
  }

  /// Clear all customer and item fields
  void clearAll() {
    nameController.clear();
    dateController.clear();
    phoneController.clear();
    packingNoController.clear();
    moveFromController.clear();
    moveToController.clear();
    vehicalNoController.clear();

    itemNameController.clear();
    itemQuantityController.clear();
    itemValueController.clear();
    itemRemarkController.clear();
    itemCFTController.clear();
    itemBoxNumberController.clear();

    itemParticulars.clear();
    notifyListeners();
  }

  /// Submit packing list
  Future<void> packinglist({
    required String mobileNumber,
    required BuildContext context,
  }) async {
    final repository = PackingListRepository();

    try {
      final requestBody = {
        "formData": {
          "customerDetails": {
            "name": nameController.text.trim(),
            "phone": phoneController.text.trim(),
            "packingNumber": packingNoController.text.trim(),
            "date": dateController.text.trim(),
            "moveFrom": moveFromController.text.trim(),
            "moveTo": moveToController.text.trim(),
            "vehicleNo": vehicalNoController.text.trim(),
          },
          "itemParticulars": itemParticulars, // send multiple items
        }
      };

      final response = await repository.businessapi(requestBody);

      if (response != null && response.status == true) {
        clearAll();

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Packing added successfully!")),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to submit packing list")),
        );
      }
    } catch (e) {
      print('Error sending Packing List: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
    }
  }
}
