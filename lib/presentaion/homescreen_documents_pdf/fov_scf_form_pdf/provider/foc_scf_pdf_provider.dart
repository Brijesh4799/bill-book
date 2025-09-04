import 'package:flutter/cupertino.dart';

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


  Future<void> focscfData() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _carCondition = await _carConditionPdfRepository.getfocscfdataApi();


    } catch (e) {
      _errorMessage = 'Failed to load survey list: ${e.toString()}';
    } finally {
      _isLoading = false;
      notifyListeners();
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

}
