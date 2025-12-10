

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';

import '../get_by-id_model/payment_get_by_id_model.dart';
import '../model/payment_voucher_pdf_model.dart';
import '../repo/payment_voucher_pdf_repository.dart';


class PaymentPdfProvider with ChangeNotifier{

  TextEditingController voucherNumberController = TextEditingController();
  TextEditingController voucherDateController = TextEditingController();
  TextEditingController receiverNameController = TextEditingController();
  TextEditingController receiverPhoneController = TextEditingController();
  TextEditingController voucherAmountController = TextEditingController();
  TextEditingController transactionNumberController = TextEditingController();
  TextEditingController payForController = TextEditingController();
  TextEditingController remarkController = TextEditingController();
  final PaymentPdfRepository _paymentPdfRepository = PaymentPdfRepository();

  PaymentGetDataModel? paymentGetDataModel;
  PaymentVoucherPdfModel? _paymentvoucher;
  PaymentVoucherPdfModel? get paymentvoucher => _paymentvoucher;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;


  // Future<void> fetchpaymentData() async {
  //   _isLoading = true;
  //   _errorMessage = null;
  //   notifyListeners();
  //   try {
  //     _paymentvoucher = await _paymentPdfRepository.getPaymentData();
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
  Future<void> fetchpaymentData({bool isLoadMore = false}) async {
    if (!isLoadMore) {
      page = 1;
      hasNextPage = true;
      _paymentvoucher = null;
      setLoading(true);
    } else {
      if (isLoadMoreRunning || !hasNextPage) return;
      isLoadMoreRunning = true;
      notifyListeners();
    }
    try {
      final response = await _paymentPdfRepository.getPaymentData(pageCount: page);
      if (response.status == true &&
          response.data != null &&
          response.data!.isNotEmpty) {
        if (isLoadMore) {
          _paymentvoucher!.data!.addAll(response.data!);
        } else {
          _paymentvoucher = response;
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





  final _repo = PaymentPdfRepository();
  Future<bool> deletepayment(String id) async {
    try {
      final result = await _repo.deletePaymentById(id);
      if (result.status == true) {
        await fetchpaymentData();
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

  Future<PaymentVoucherPdfModel?> updatepaymntById(String paymentId) async {
    _isLoading = true;
    notifyListeners();

    try {
      // Build request body
      final requestBody = {
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
      };


      _paymentvoucher = await _paymentPdfRepository.patchpaymentByIdApi(paymentId, requestBody);


      if (_paymentvoucher?.data != null && _paymentvoucher!.data!.isNotEmpty) {
        final formData = _paymentvoucher!.data!.first.formData;

      }

      return _paymentvoucher;
    } catch (e) {
      print("Error updating payment voucher: $e");
      return null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchpaymentById({required String id}) async {
    _errorMessage = null;

    try {
      // Use correct repository instance
      paymentGetDataModel = await _repo.getpaymentByIdApi(id);

      if (paymentGetDataModel != null &&
          paymentGetDataModel!.data != null) {
        final customer = paymentGetDataModel!.data!.formData;

        if (customer != null) {
          voucherNumberController.text = customer.voucherNumber ?? "";
          voucherDateController.text = customer.voucherDate ?? "";
          receiverNameController.text = customer.receiverName ?? "";
          receiverPhoneController.text = customer.receiverPhone ?? "";
          //voucherAmountController.text = customer.voucherAmount ?? "";
          transactionNumberController.text = customer.number ?? "";
          payForController.text = customer.payFor ?? "";
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

  Future<void> fetchpaymentPdf(String id) async {
    pdfLoading = true;
    _errorMessage2 = null;
    notifyListeners();

    try {
      final responseBytes = await  _paymentPdfRepository.paymentpdfApi(id);

      if (responseBytes != null) {
        // Save PDF in temporary directory
        final dir = await getTemporaryDirectory();
        final file = File('${dir.path}/payment_$id.pdf');
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

