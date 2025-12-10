import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import '../get_byid_model/get_by_id_model.dart';
import '../model/survey_pdf_model.dart' hide ItemParticulars;
import '../repo/survey_repository.dart';

class SurveyPdfProvider with ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController assessmentSurveyController = TextEditingController();
  TextEditingController moveFromController = TextEditingController();
  TextEditingController moveToController = TextEditingController();
  TextEditingController itemNameController = TextEditingController();
  TextEditingController itemQuantityController = TextEditingController();
  TextEditingController itemValueController = TextEditingController();
  TextEditingController itemRemarkController = TextEditingController();
  TextEditingController itemCFTController = TextEditingController();
  TextEditingController itemBoxNumberController = TextEditingController();
  final SurveyPdfRepository _repository = SurveyPdfRepository();

  SurveyPdfModel? _surveyList;
  SurveyPdfModel? _surveyPdfModel;
  SurveyGetDataByIdModel? surveyGetDataByIdModel;
  bool _isLoading = false;
  String? _errorMessage;

  SurveyPdfModel? get surveyList => _surveyList;
  SurveyPdfModel? get surveyPdfModel => _surveyPdfModel;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  // Future<void> fetchSurveyListData() async {
  //   _setLoading(true);
  //   _errorMessage = null;
  //
  //   try {
  //     _surveyList = await _repository.getsurveylistdataApi();
  //   } catch (e) {
  //     _errorMessage = 'Failed to load survey list: ${e.toString()}';
  //   }
  //
  //   _setLoading(false);
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
  Future<void> fetchSurveyListData({bool isLoadMore = false}) async {
    if (!isLoadMore) {
      page = 1;
      hasNextPage = true;
      _surveyList = null;
      setLoading(true);
    } else {
      if (isLoadMoreRunning || !hasNextPage) return;
      isLoadMoreRunning = true;
      notifyListeners();
    }
    try {
      final response = await _repository.getsurveylistdataApi(pageCount: page);
      if (response.status == true &&
          response.data != null &&
          response.data!.isNotEmpty) {
        if (isLoadMore) {
          _surveyList!.data!.addAll(response.data!);
        } else {
          _surveyList = response;
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

  Future<void> fetchSurveyPdf(String id) async {
    _setLoading(true);
    _errorMessage = null;

    try {
      _surveyPdfModel = await _repository.getsurveyIdApi(id);
    } catch (e) {
      _errorMessage = 'Failed to load survey PDF: ${e.toString()}';
    }

    _setLoading(false);
  }

  Future<void> fetchQuotationById(String id) async {
    _setLoading(true);
    _errorMessage = null;

    try {
      _surveyPdfModel = await _repository.getsurveyIdData(id);
    } catch (e) {
      _errorMessage = 'Failed to load quotation details: ${e.toString()}';
    }

    _setLoading(false);
  }

  Future<bool> deleteSurvey(String id) async {
    try {
      final result = await _repository.deleteQuotationById(id);
      if (result.status == true) {
        await fetchSurveyListData();
        return true;
      } else {
        _errorMessage = result.message ?? 'Delete failed';
        return false;
      }
    } catch (e) {
      _errorMessage = 'Error deleting survey: ${e.toString()}';
      return false;
    }
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<SurveyPdfModel?> updateSurveyById(String userId, Map<String, dynamic> updateData) async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await _repository.patchsurveyByIdApi(userId, updateData);
      _surveyPdfModel = response;

      if (_surveyPdfModel != null &&
          _surveyPdfModel!.data != null &&
          _surveyPdfModel!.data!.isNotEmpty) {
        final customer = _surveyPdfModel!.data!.first.formData?.customerDetails;

        if (customer != null) {
          nameController.text = customer.name ?? "";
          phoneController.text = customer.phone ?? "";
          dateController.text = customer.date ?? "";
          assessmentSurveyController.text = customer.assessmentSurvey ?? "";
          moveFromController.text = customer.moveFrom ?? "";
          moveToController.text = customer.moveTo ?? "";
        }

        if (_surveyPdfModel!.data!.first.formData?.itemParticulars != null &&
            _surveyPdfModel!.data!.first.formData!.itemParticulars!.isNotEmpty) {
          final item = _surveyPdfModel!.data!.first.formData!.itemParticulars!.first;

          itemNameController.text = item.itemName ?? "";
          itemBoxNumberController.text = item.boxNumber ?? "";
          itemQuantityController.text = item.quantity?.toString() ?? "";
          itemValueController.text = item.value?.toString() ?? "";
          itemCFTController.text = item.cft?.toString() ?? "";
          itemRemarkController.text = item.remark ?? "";
        }
      }

      _isLoading = false;
      notifyListeners();
      return _surveyPdfModel;
    } catch (e) {
      print("Error updating survey: $e");
      _isLoading = false;
      notifyListeners();
      return null;
    }
  }

  Future<void> fetchSurveyById({required String id}) async {
    _setLoading(true);
    _errorMessage = null;
    print("balawant1");

    try {
      print("balawant2");
      surveyGetDataByIdModel = await _repository.getsurveyByIdApi(id);
      print("balawant3");

      if (surveyGetDataByIdModel != null &&
          surveyGetDataByIdModel!.data != null ) {
        print("balawant4");

        final customer = surveyGetDataByIdModel!.data!.formData?.customerDetails;
        if (customer != null) {
          print("balawant5");
          nameController.text = customer.name ?? "dfgfd";
          phoneController.text = customer.phone ?? "";
          print("balawant6");
          dateController.text = customer.date ?? "";
          assessmentSurveyController.text = customer.assessmentSurvey ?? "";
          moveFromController.text = customer.moveFrom ?? "";
          moveToController.text = customer.moveTo ?? "";
        }

        if (_surveyPdfModel!.data!.first.formData?.itemParticulars != null &&
            _surveyPdfModel!.data!.first.formData!.itemParticulars!.isNotEmpty) {
          final item = _surveyPdfModel!.data!.first.formData!.itemParticulars!.first;

          itemNameController.text = item.itemName ?? "";
          itemBoxNumberController.text = item.boxNumber ?? "";
          itemQuantityController.text = item.quantity?.toString() ?? "";
          itemValueController.text = item.value?.toString() ?? "";
          itemCFTController.text = item.cft?.toString() ?? "";
          itemRemarkController.text = item.remark ?? "";
        }
      }
    } catch (e) {
      _errorMessage = 'Failed to load survey: ${e.toString()}';
    }

    _setLoading(false);
  }

  List<ItemParticulars> get items =>
      surveyGetDataByIdModel?.data?.formData?.itemParticulars ?? [];
  void loadItemIntoControllers(ItemParticulars item) {
    itemNameController.text = item.itemName ?? "";
    itemBoxNumberController.text = item.boxNumber?.toString() ?? "";
    itemQuantityController.text = item.quantity?.toString() ?? "";
    itemValueController.text = item.value?.toString() ?? "";
    itemCFTController.text = item.cft?.toString() ?? "";
    itemRemarkController.text = item.remark ?? "";
    notifyListeners();
  }

  String? pdfLocalPath;
  bool pdfLoading = false;
  String? _errorMessage2;

  String? get errorMessage2 => _errorMessage2;

  Future<void> fetchserveyPdf(String id) async {
    pdfLoading = true;
    _errorMessage2 = null;
    notifyListeners();

    try {
      final responseBytes = await  _repository.serveypdfApi(id);

      if (responseBytes != null) {
        // Save PDF in temporary directory
        final dir = await getTemporaryDirectory();
        final file = File('${dir.path}/quotation_$id.pdf');
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
