import 'package:flutter/cupertino.dart';

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

  Future<void> fetchtwsListData() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _twslist = await _twsPdfRepository.gettwslistdataApi();
    } catch (e) {
      _errorMessage = 'Failed to load survey list: ${e.toString()}';
    } finally {
      _isLoading = false;
      notifyListeners();
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

}
