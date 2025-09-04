import 'package:flutter/material.dart';
import '../model/cms_model.dart';
import '../repo/cms_repo.dart';


class CmsProvider with ChangeNotifier {
  final CmsRepository _cmsRepository = CmsRepository();

  CMSModel? _cmsModel;
  bool _isLoading = false;
  String? _error;

  // Getters
  CMSModel? get cmsModel => _cmsModel;
  bool get isLoading => _isLoading;
  String? get error => _error;

  // Fetch CMS data
  Future<void> fetchCmsData() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      CMSModel? response = await _cmsRepository.businessapi(null); // pass null if no params
      _cmsModel = response;
    } catch (e) {
      _error = e.toString();
      _cmsModel = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
