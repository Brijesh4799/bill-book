import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';

import '../get_by_id_model/fov_scf_get_byid_model.dart';
import '../model/fov_scf_form_pdf_model.dart';
import '../repo/foc_scf_pdf_repository.dart';


class FocScfPdfProvider with ChangeNotifier {

  TextEditingController fovMovingDateController = TextEditingController();
  TextEditingController fovLrNumberController = TextEditingController();
  TextEditingController fovNameController = TextEditingController();
  TextEditingController fovPhoneController = TextEditingController();
  TextEditingController fovEmailController = TextEditingController();
  TextEditingController fovMoveFromCityController = TextEditingController();
  TextEditingController fovMoveToCityController = TextEditingController();

  final FocScfPdfRepository _carConditionPdfRepository = FocScfPdfRepository();

  FocScfPdfModel? _carCondition;
  FocScfPdfModel? get focscflist => _carCondition;
  FovScfGetDataModel? fovScfGetDataModel;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;


  // Future<void> focscfData() async {
  //   _isLoading = true;
  //   _errorMessage = null;
  //   notifyListeners();
  //   try {
  //     _carCondition = await _carConditionPdfRepository.getfocscfdataApi();
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
  Future<void> focscfData({bool isLoadMore = false}) async {
    if (!isLoadMore) {
      page = 1;
      hasNextPage = true;
      _carCondition = null;
      setLoading(true);
    } else {
      if (isLoadMoreRunning || !hasNextPage) return;
      isLoadMoreRunning = true;
      notifyListeners();
    }
    try {
      final response = await _carConditionPdfRepository.getfocscfdataApi(pageCount: page);
      if (response.status == true &&
          response.data != null &&
          response.data!.isNotEmpty) {
        if (isLoadMore) {
          _carCondition!.data!.addAll(response.data!);
        } else {
          _carCondition = response;
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






  final _repo = FocScfPdfRepository();
  Future<bool> deleteFoc(String id) async {
    try {
      final result = await _repo.deleteFocById(id);
      if (result.status == true) {
        await focscfData();
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

  Future<FocScfPdfModel?> updatetwsById(String paymentId) async {
    _isLoading = true;
    notifyListeners();

    try {
      // Build request body
      final requestBody = {
        'formData': {
          'fovScf': {
            'fovScfType': 'Household Goods', // make dynamic if needed
            'date': fovMovingDateController.text.trim(),
            'lrNumber': fovLrNumberController.text.trim(),
            'name': fovNameController.text.trim(),
            'phone': fovPhoneController.text.trim(),
            'email': fovEmailController.text.trim(),
            'moveFromCity': fovMoveFromCityController.text.trim(),
            'moveToCity': fovMoveToCityController.text.trim(),
          },
          'insuranceDetails': {
            'insuranceRiskType': "Not Insured - At Owner's Risk",
            'insuranceChargePercent': "0%",
          }
        }
      };

      // Call the repo method
      _carCondition = await _carConditionPdfRepository.patchtwsByIdApi(
        paymentId,
        requestBody,
      );

      if (_carCondition?.data != null && _carCondition!.data!.isNotEmpty) {
        final formData = _carCondition!.data!.first.formData;
        print("Updated form data: $formData");
      }

      return _carCondition;
    } catch (e) {
      print("Error updating FOC SCF: $e");
      return null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }


  Future<void> fetchfovscfById({required String id}) async {
    _errorMessage = null;

    try {
      // Use correct repository instance
      fovScfGetDataModel = await _repo.getfocscfByIdApi(id);

      if (fovScfGetDataModel != null &&
          fovScfGetDataModel!.data != null) {
        final customer = fovScfGetDataModel!.data!.formData?.fovScf;

        if (customer != null) {
          fovMovingDateController.text = customer.date ?? "";
          fovLrNumberController.text = customer.lrNumber ?? "";
          fovNameController.text = customer.name ?? "";
          fovPhoneController.text = customer.phone ?? "";
          fovEmailController.text = customer.email ?? "";
          fovMoveFromCityController.text = customer.moveFromCity ?? "";
          fovMoveToCityController.text = customer.moveToCity ?? "";

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

  Future<void> fetchfovscfPdf(String id) async {
    pdfLoading = true;
    _errorMessage2 = null;
    notifyListeners();

    try {
      final responseBytes = await  _carConditionPdfRepository.foccfpdfApi(id);

      if (responseBytes != null) {
        // Save PDF in temporary directory
        final dir = await getTemporaryDirectory();
        final file = File('${dir.path}/bill_$id.pdf');
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
