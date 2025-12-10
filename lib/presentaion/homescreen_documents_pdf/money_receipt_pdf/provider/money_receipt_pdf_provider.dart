import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';

import '../get_by_id_model/money_get_by_id_model.dart';
import '../model/money_receipt_pdf_model.dart' hide FormData;
import '../money_recvide_edit_model/money_recvied_edit_model.dart' hide FormData;
import '../repo/money_receipt_repository.dart';
class MoneyReceiptPdfProvider with ChangeNotifier {

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
  final MoneyReceiptPdfRepository _moneyPdfRepository = MoneyReceiptPdfRepository();

  MoneyReceiptPdf_Model? _moneyList;
  MoneyReceiptPdf_Model? get moneyList => _moneyList;
  MoneyGetDataModel? moneyGetDataModel;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;


  // Future<void> fetchmoneyData() async {
  //   _isLoading = true;
  //   _errorMessage = null;
  //   notifyListeners();
  //   try {
  //     _moneyList = await _moneyPdfRepository.getpackinglistdataApi();
  //   } catch (e) {
  //     _errorMessage = 'Failed to load survey list: ${e.toString()}';
  //   } finally {
  //     _isLoading = false;
  //     notifyListeners();
  //   }
  // }

  bool isLoading2 = false;
  bool loading = false;
  bool isLoadMoreRunning = false;
  bool hasNextPage = true;
  int page = 1;
  void setLoading(bool loader) {
    loading = loader;
    notifyListeners();
  }
  Future<void> fetchmoneyData({bool isLoadMore = false}) async {
    if (!isLoadMore) {
      page = 1;
      hasNextPage = true;
      _moneyList = null;
      setLoading(true);
    } else {
      if (isLoadMoreRunning || !hasNextPage) return;
      isLoadMoreRunning = true;
      notifyListeners();
    }
    try {
      final response = await _moneyPdfRepository.getpackinglistdataApi(pageCount: page);
      if (response.status == true &&
          response.data != null &&
          response.data!.isNotEmpty) {
        if (isLoadMore) {
          _moneyList!.data!.addAll(response.data!);
        } else {
          _moneyList = response;
        }
        page++;
      } else {
        hasNextPage = false;
      }
    } catch (e) {
      print("Pagination Error: $e");
      hasNextPage = false;
    } finally {
      if (!isLoadMore) {
        setLoading(false);
      } else {
        isLoadMoreRunning = false;
        notifyListeners();
      }
    }
  }






  final _repo = MoneyReceiptPdfRepository();
  Future<bool> deletemoney(String id) async {
    try {
      final result = await _repo.deleteMoneyById(id);
      if (result.status == true) {
        await fetchmoneyData();
        return true;
      } else {
        print('Delete failed: ${result.message}');
        return false;
      }
    } catch (e) {
      print('Error deleting survey: $e');
      return false;
    }
  }

 /* Future<MoneyReceiptPdf_Model?> updatemoneyById(String billId) async {
    _isLoading = true;
    notifyListeners();

    try {
      // Build request body based on your FormData model
      final requestBody = {
        "formData": {
          "receiptNumber": receiptNumberController.text.trim(),
          "receiptDate": receiptDateController.text.trim(),
          "name": nameController.text.trim(),
          "phone": phoneController.text.trim(),
          "receiptAgainst": receiptAgainstNumberController.text.trim(),
          "billNumber": "", // Add if you have a bill number controller
          "billDate": billQuotationDateController.text.trim(),
          "moveFrom": moveFromController.text.trim(),
          "moveTo": moveToController.text.trim(),
          "paymentType": "", // Add if you have a payment type controller
          "receiptAmount": receiptAmountController.text.trim(),
          "paymentMode": "", // Add if you have a payment mode controller
          "transactionNumber": transactionNumberController.text.trim(),
          "branch": branchController.text.trim(),
          "remark": remarkController.text.trim(),
        }
      };


      _moneyList = await _moneyPdfRepository.patchbillByIdApi(billId, requestBody);




      return _moneyList;
    } catch (e) {
      print("Error updating bill: $e");
      return null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }*/

  Future<MoneyRecvideEditModel?> updatemoneyById(String billId) async {
    _isLoading = true;
    notifyListeners();
    print('provider>>>>>>>>>>>>>>>>>>>>>1');

    try {
      // Build FormData object from controllers
      final formData = FormData(

        receiptNumber: receiptNumberController.text.trim(),
        receiptDate: receiptDateController.text.trim(),
        name: nameController.text.trim(),
        phone: phoneController.text.trim(),
        receiptAgainst: receiptAgainstNumberController.text.trim(),
        billDate: billQuotationDateController.text.trim(),
        moveFrom: moveFromController.text.trim(),
        moveTo: moveToController.text.trim(),
        receiptAmount: receiptAmountController.text.trim(),
        transactionNumber: transactionNumberController.text.trim(),
        branch: branchController.text.trim(),
        remark: remarkController.text.trim(),
      );
      print('provider>>>>>>>>>>>>>>>>>>>>>2');
      // Wrap inside request body using your model
      final requestBody = {
        "formData": formData.toJson(),

      };

      // Call API
      final response = await _moneyPdfRepository.patchbillByIdApi(billId, requestBody);
      print('provider>>>>>>>>>>>>>>>>>>>>>3');
      // Parse into your model
      final updatedMoneyReceipt = MoneyRecvideEditModel.fromJson(response as Map<String, dynamic> );

      return updatedMoneyReceipt;
    } catch (e) {
      print('provider>>>>>>>>>>>>>>>>>>>>>4');
      print("Error updating bill: $e");
      return null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }




  Future<void> fetchmoneyById({required String id}) async {
    _errorMessage = null;

    try {
      // Use correct repository instance
      moneyGetDataModel = await _repo.getmoneyByIdApi(id);

      if (moneyGetDataModel != null &&
          moneyGetDataModel!.data != null) {
        final customer = moneyGetDataModel!.data!.formData;

        if (customer != null) {
          receiptNumberController.text = customer.receiptNumber ?? "";
          receiptDateController.text = customer.receiptDate ?? "";
          nameController.text = customer.name ?? "";
          phoneController.text = customer.phone ?? "";
          receiptAgainstNumberController.text = customer.receiptAgainst ?? "";
          billQuotationDateController.text = customer.billDate ?? "";
          moveFromController.text = customer.moveFrom ?? "";
          moveToController.text = customer.moveTo ?? "";
          receiptAmountController.text = customer.receiptAmount ?? "";
          transactionNumberController.text = customer.transactionNumber ?? "";
          branchController.text = customer.branch ?? "";
          remarkController.text = customer.remark ?? "";


        }




      }
    } catch (e) {
      _errorMessage = 'Failed to load packing data: ${e.toString()}';
      print(_errorMessage);
    }
  }

  String? pdfLocalPath;
  bool pdfLoading = false;
  String? _errorMessage2;

  String? get errorMessage2 => _errorMessage2;

  Future<void> fetchmoneyPdf(String id) async {
    pdfLoading = true;
    _errorMessage2 = null;
    notifyListeners();

    try {
      final responseBytes = await  _moneyPdfRepository.moneypdfApi(id);

      if (responseBytes != null) {
        // Save PDF in temporary directory
        final dir = await getTemporaryDirectory();
        final file = File('${dir.path}/packing_$id.pdf');
        await file.writeAsBytes(responseBytes);

        pdfLocalPath = file.path;
        print("✅ PDF saved at: $pdfLocalPath");
      } else {
        _errorMessage2 = "Empty PDF response";
      }
    } catch (e) {
      _errorMessage2 = "Failed to fetch PDF: $e";
      print(_errorMessage2);
    } finally {
      pdfLoading = false;
      notifyListeners();
    }
  }


}
