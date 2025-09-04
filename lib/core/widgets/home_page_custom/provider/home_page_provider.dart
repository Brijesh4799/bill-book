import 'package:flutter/cupertino.dart';

import '../model/home_page_model.dart';
import '../repo/home_page_repo.dart';
class HomePageProvider with ChangeNotifier {
  final HomePageRepogistory _homeRepository = HomePageRepogistory();

  HomePageModel? _homeList;
  HomePageModel? get homeList => _homeList;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  String? _errorMessage;
  String? get errorMessage => _errorMessage;
  Future<void> homeListData() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _homeList = await _homeRepository.gethomepageApi();
    } catch (e) {
      _errorMessage = 'Failed to load survey list: ${e.toString()}';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
