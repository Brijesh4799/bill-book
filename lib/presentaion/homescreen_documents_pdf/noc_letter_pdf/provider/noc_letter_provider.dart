import 'package:flutter/cupertino.dart';

import '../get_by_id_model/noc_get_byid_model.dart';
import '../model/noc_letter_pdf_model.dart';
import '../repo/noc_letter_pdf_repository.dart';




class NocLetterPdfProvider with ChangeNotifier {

  TextEditingController nocDateController = TextEditingController();
  TextEditingController nocLrNumberController = TextEditingController();
  TextEditingController nocLrDateController = TextEditingController();
  TextEditingController nocNameController = TextEditingController();
  TextEditingController nocPhoneController = TextEditingController();
  TextEditingController nocEmailController = TextEditingController();
  TextEditingController nocMoveFromCityController = TextEditingController();
  TextEditingController nocMoveToCityController = TextEditingController();
  NocGetDataModel? nocGetDataModel;
  final NocLetterPdfRepository _nocletterPdfRepository = NocLetterPdfRepository();

  NocLetterPdfModel? _nocletter;
  NocLetterPdfModel? get nocletter => _nocletter;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;


  Future<void> fetchnocletterData() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _nocletter = await _nocletterPdfRepository.getnocletterdataApi();


    } catch (e) {
      _errorMessage = 'Failed to load survey list: ${e.toString()}';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
  final _repo = NocLetterPdfRepository();
  Future<bool> deletenoc(String id) async {
    try {
      final result = await _repo.deleteNocById(id);
      if (result.status == true) {
        await fetchnocletterData();
        fetchnocletterData();
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


  Future<NocLetterPdfModel?> updatenocById(String paymentId) async {
    _isLoading = true;
    notifyListeners();

    try {
      // Build request body
      final requestBody = {
        'formData': {
          'nocLetterFor': {
            'nocType': 'Household Goods', // Make dynamic if needed
          },
          'nocForm': {
            'date': nocDateController.text.trim(),
            'lrNumber': nocLrNumberController.text.trim(),
            'lrDate': nocLrDateController.text.trim(),
            'name': nocNameController.text.trim(),
            'phone': nocPhoneController.text.trim(),
            'email': nocEmailController.text.trim(),
            'moveFromCity': nocMoveFromCityController.text.trim(),
            'moveToCity': nocMoveToCityController.text.trim(),
          },
        }
      };

      // Call the repo method and store in _nocletter
      _nocletter = await _nocletterPdfRepository.patchtwsByIdApi(
        paymentId,
        requestBody,
      );

      // Optional: print updated data if your model supports it
      if (_nocletter?.data != null && _nocletter!.data!.isNotEmpty) {
        final formData = _nocletter!.data!.first.formData;
        print("Updated form data: $formData");
      }

      return _nocletter;
    } catch (e) {
      print("Error updating NOC: $e");
      return null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchnocById({required String id}) async {
    _errorMessage = null;

    try {
      // Use correct repository instance
      nocGetDataModel = await _repo.getnocByIdApi(id);

      if (nocGetDataModel != null &&
          nocGetDataModel!.data != null) {
        final customer = nocGetDataModel!.data!.formData?.nocForm;

        if (customer != null) {
          nocDateController.text = customer.date ?? "";
          nocLrNumberController.text = customer.lrNumber ?? "";
          nocLrDateController.text = customer.lrDate ?? "";
          nocNameController.text = customer.name ?? "";
          nocPhoneController.text = customer.phone ?? "";
          nocEmailController.text = customer.email ?? "";
          nocMoveFromCityController.text = customer.moveFromCity ?? "";
          nocMoveToCityController.text = customer.moveToCity ?? "";


        }











      }
    } catch (e) {
      _errorMessage = 'Failed to load packing data: ${e.toString()}';
      print(_errorMessage);
    }
  }

}
