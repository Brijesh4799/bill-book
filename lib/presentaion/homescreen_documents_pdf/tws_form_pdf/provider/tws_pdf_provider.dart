import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';

import '../get_by_id_model/tws_get_byid_model.dart';
import '../model/tws_pdf_model.dart';
import '../repo/tws_pdf_repository.dart';

class TwsPdfProvider with ChangeNotifier {
  TextEditingController movingDateController = TextEditingController();
  TextEditingController lrNumberController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController moveFromCityController = TextEditingController();
  TextEditingController moveFromAddressController = TextEditingController();
  TextEditingController moveToCityController = TextEditingController();
  TextEditingController moveToAddressController = TextEditingController();

  TWSGetDataModel? tWSGetDataModel;

  final TWSPdfRepository _twsPdfRepository = TWSPdfRepository();

  TwsPdfModel? _twslist;
  TwsPdfModel? get twsList => _twslist;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;



  // Future<void> fetchtwsListData() async {
  //   _isLoading = true;
  //   _errorMessage = null;
  //   notifyListeners();
  //   try {
  //     _twslist = await _twsPdfRepository.gettwslistdataApi();
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
  Future<void> fetchtwsListData({bool isLoadMore = false}) async {
    if (!isLoadMore) {
      page = 1;
      hasNextPage = true;
      _twslist = null;
      setLoading(true);
    } else {
      if (isLoadMoreRunning || !hasNextPage) return;
      isLoadMoreRunning = true;
      notifyListeners();
    }
    try {
      final response = await _twsPdfRepository.gettwslistdataApi(pageCount: page);
      if (response.status == true &&
          response.data != null &&
          response.data!.isNotEmpty) {
        if (isLoadMore) {
          _twslist!.data!.addAll(response.data!);
        } else {
          _twslist = response;
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



  final _repo = TWSPdfRepository();
  Future<bool> deletetws(String id) async {
    try {
      final result = await _repo.deletetwsById(id);
      if (result.status == true) {
        await fetchtwsListData();
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

  Future<TwsPdfModel?> updatetwsById(String paymentId) async {
    _isLoading = true;
    notifyListeners();

    try {
      // Build request body
      final requestBody = {
        "formData": {
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
      };

      // store result into _twslist instead of _paymentvoucher
      _twslist = await _twsPdfRepository.patchtwsByIdApi(paymentId, requestBody);

      if (_twslist?.data != null && _twslist!.data!.isNotEmpty) {
        final formData = _twslist!.data!.first.formData;
        print("Updated form data: $formData");
      }

      return _twslist;
    } catch (e) {
      print("Error updating tws: $e");
      return null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchtwsById({required String id}) async {
    _errorMessage = null;

    try {
      // Use correct repository instance
      tWSGetDataModel = await _repo.gettwsByIdApi(id);

      if (tWSGetDataModel != null &&
          tWSGetDataModel!.data != null) {
        final customer = tWSGetDataModel!.data!.formData;

        if (customer != null) {
          movingDateController.text = customer.movingType ?? "";
          lrNumberController.text = customer.lrNumber ?? "";
          nameController.text = customer.name ?? "";
          phoneController.text = customer.phone ?? "";
          emailController.text = customer.email ?? "";
          moveFromCityController.text = customer.moveFromCity ?? "";
          moveFromAddressController .text = customer.moveFromAddress ?? "";
          moveToCityController .text = customer.moveToCity ?? "";
          moveToAddressController .text = customer.moveToAddress ?? "";



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

  Future<void> fetchtwsPdf(String id) async {
    pdfLoading = true;
    _errorMessage2 = null;
    notifyListeners();

    try {
      final responseBytes = await  _repo.twspdfApi(id);

      if (responseBytes != null) {
        // Save PDF in temporary directory
        final dir = await getTemporaryDirectory();
        final file = File('${dir.path}/tws_$id.pdf');
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
