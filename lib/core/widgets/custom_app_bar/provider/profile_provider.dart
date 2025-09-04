import 'package:flutter/cupertino.dart';

import '../model/profile_model.dart';
import '../repo/profile_repo.dart';



class GetProfileProvider with ChangeNotifier {
  final ProfileDataRepository _profiledatRepository = ProfileDataRepository();

  GetProfileModel? _profiledata;
  GetProfileModel? get profiledata => _profiledata;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;


  Future<void> profiledataData() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _profiledata = await _profiledatRepository.getprofileApi();


    } catch (e) {
      _errorMessage = 'Failed to load survey list: ${e.toString()}';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
