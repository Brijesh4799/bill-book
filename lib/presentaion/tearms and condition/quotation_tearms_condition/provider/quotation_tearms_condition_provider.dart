import 'package:flutter/cupertino.dart';

import '../model/quotation_tearms_condition.dart';
import '../repo/quotation_tearms_condition_repo.dart';

class QuotationTearmsandCondition with ChangeNotifier{
  final QuotationTearmsConditionRepo _tearmsConditionRepo = QuotationTearmsConditionRepo();

  QuotationTearmsAndConditionModel? _tearmscondition;
  QuotationTearmsAndConditionModel? get tearmscondition => _tearmscondition;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;


  Future<void> billListData() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _tearmscondition = await _tearmsConditionRepo.gettearmsApi();


    } catch (e) {
      _errorMessage = 'Failed to load survey list: ${e.toString()}';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}