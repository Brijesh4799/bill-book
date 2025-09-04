import 'package:flutter/cupertino.dart';

import '../repo/payment_repository.dart';

class PaymentVoucherProvider with ChangeNotifier{

  TextEditingController voucherNumberController = TextEditingController();
  TextEditingController voucherDateController = TextEditingController();
  TextEditingController receiverNameController = TextEditingController();
  TextEditingController receiverPhoneController = TextEditingController();
  TextEditingController voucherAmountController = TextEditingController();
  TextEditingController transactionNumberController = TextEditingController();
  TextEditingController payForController = TextEditingController();
  TextEditingController remarkController = TextEditingController();


  Future<void> paymentvoucherprovider({
    required String mobileNumber,
    required BuildContext context,
  }) async {
    final paymentvoucherRepository = PaymentVocherRepository();

    try {
      var response = await paymentvoucherRepository.businessapi({
        "formData": {
          'voucherNumber': voucherNumberController.text.trim(),
          'voucherDate': voucherDateController.text.trim(),
          'receiverName': receiverNameController.text.trim(),
          'receiverPhone': receiverPhoneController.text.trim(),
        //  'paymentType': paymentTypeController.text.trim(), // <-- Make sure this exists
          'voucherAmount': double.tryParse(voucherAmountController.text.trim()) ?? 0.0,
         // 'paymentMode': paymentModeController.text.trim(), // <-- Make sure this exists
          'number': transactionNumberController.text.trim(),
          'payFor': payForController.text.trim(),
          'remark': remarkController.text.trim(),
        }
      });

      // You can log or handle response here if needed
      print("Payment voucher response: $response");
      clearFields();

    } catch (e) {
      print('Error in paymentvoucherprovider: $e');
    }

    notifyListeners();
  }
  void clearFields() {
    voucherNumberController.clear();
    voucherDateController.clear();
    receiverNameController.clear();
    receiverPhoneController.clear();
    voucherAmountController.clear();
    transactionNumberController.clear();
    payForController.clear();
    remarkController.clear();
    notifyListeners();
  }


}