/*
import 'package:flutter/cupertino.dart';

import '../repo/money_receipt_repository.dart';

class MoneyReceiptProvider with ChangeNotifier{

  TextEditingController receiptNumberController = TextEditingController();
  TextEditingController receiptDateController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController receiptAgainstNumberController = TextEditingController();
  TextEditingController billQuotationDateController = TextEditingController();
  TextEditingController moveFromController = TextEditingController();
  TextEditingController moveToController = TextEditingController();
  TextEditingController receiptAmountController = TextEditingController();
  TextEditingController transactionNumberController = TextEditingController();
  TextEditingController branchController = TextEditingController();
  TextEditingController remarkController = TextEditingController();

  Future<void> moneyovider({required String mobileNumber, required BuildContext context}) async {
    final moneyRepository = MoneyReceiptRepository();
    try {
      var response = await moneyRepository.businessapi({
        "formData": {
          'receiptNumber': receiptNumberController.text.trim(),
          'receiptDate': receiptDateController.text.trim(),
          'name': nameController.text.trim(),
          'phone': phoneController.text.trim(),
          'receiptAgainst': receiptAgainstNumberController.text.trim(),
          //'billNumber': billNumberController.text.trim(),  // Make sure this controller exists
          'billDate': billQuotationDateController.text.trim(),
          'moveFrom': moveFromController.text.trim(),
          'moveTo': moveToController.text.trim(),
          //'paymentType': paymentTypeController.text.trim(),  // Add controller if not exists
          'receiptAmount': receiptAmountController.text.trim(),
         // 'paymentMode': paymentModeController.text.trim(),  // Add controller if not exists
          'transactionNumber': transactionNumberController.text.trim(),
          'branch': branchController.text.trim(),
          'remark': remarkController.text.trim(),
        }
      });


      print('Money Receipt response: $response');
    } catch (e) {
      print('Money Receipt error: $e');
    }

    notifyListeners();
  }


}*/

import 'package:flutter/cupertino.dart';
import '../repo/money_receipt_repository.dart';

class MoneyReceiptProvider with ChangeNotifier {
  TextEditingController receiptNumberController = TextEditingController();
  TextEditingController receiptDateController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController receiptAgainstNumberController = TextEditingController();
  TextEditingController billQuotationDateController = TextEditingController();
  TextEditingController moveFromController = TextEditingController();
  TextEditingController moveToController = TextEditingController();
  TextEditingController receiptAmountController = TextEditingController();
  TextEditingController transactionNumberController = TextEditingController();
  TextEditingController branchController = TextEditingController();
  TextEditingController remarkController = TextEditingController();

  Future<void> moneyovider({
    required String mobileNumber,
    required BuildContext context,
  }) async {
    final moneyRepository = MoneyReceiptRepository();
    try {
      var response = await moneyRepository.businessapi({
        "formData": {
          'receiptNumber': receiptNumberController.text.trim(),
          'receiptDate': receiptDateController.text.trim(),
          'name': nameController.text.trim(),
          'phone': phoneController.text.trim(),
          'receiptAgainst': receiptAgainstNumberController.text.trim(),
          'billDate': billQuotationDateController.text.trim(),
          'moveFrom': moveFromController.text.trim(),
          'moveTo': moveToController.text.trim(),
          'receiptAmount': receiptAmountController.text.trim(),
          'transactionNumber': transactionNumberController.text.trim(),
          'branch': branchController.text.trim(),
          'remark': remarkController.text.trim(),
        }
      });

      print('Money Receipt response: $response');

      // ✅ Clear all fields after success
      clearFields();
    } catch (e) {
      print('Money Receipt error: $e');
    }

    notifyListeners();
  }

  // 🔹 Method to clear all fields
  void clearFields() {
    receiptNumberController.clear();
    receiptDateController.clear();
    nameController.clear();
    phoneController.clear();
    receiptAgainstNumberController.clear();
    billQuotationDateController.clear();
    moveFromController.clear();
    moveToController.clear();
    receiptAmountController.clear();
    transactionNumberController.clear();
    branchController.clear();
    remarkController.clear();

    notifyListeners();
  }
}
