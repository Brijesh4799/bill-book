import 'package:flutter/cupertino.dart';

import '../model/subscription_model.dart';
import '../model/subscription_post_data_model.dart';
import '../repo/subscription_repo.dart';

class SubscriptionProvider with ChangeNotifier {
  final SubscriptionRepository _subscriptionRepository = SubscriptionRepository();

  SubscriptionModel? _subscriptionlist;
  SubscriptionModel? get subscriptionList => _subscriptionlist;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  /// ✅ Fetch subscription plans
  Future<void> billListData() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _subscriptionlist = await _subscriptionRepository.getsubscriptionApi();
    } catch (e) {
      _errorMessage = 'Failed to load subscription list: ${e.toString()}';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  SubscriptionPostModel? _subscriptionResponse;
  SubscriptionPostModel? get subscriptionResponse => _subscriptionResponse;

  /// ✅ Submit subscription plan (your new method)
  Future<void> submitSubscription({
    required String planId,
    required String name,
    required int durationDays,
    required int price,
    required int adminAccount,
    required int staffAccount,
    required String startDate,
    required String endDate,
    required bool isActive,
    required String paymentStatus,
  }) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final data = {
        "planId": planId,

        "name": name,
        "durationDays": durationDays,
        "price": price,
        "adminAccount": adminAccount,
        "staffAccount": staffAccount,
        "startDate": startDate,
        "endDate": endDate,
        "isActive": isActive,
        "paymentStatus": paymentStatus,
      };

      final response = await _subscriptionRepository.postsubscription(data);

      _subscriptionResponse = response;
      print("✅ Submit Response: $response");
    } catch (e) {
      _errorMessage = "Error submitting subscription: $e";
      print(_errorMessage);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}


/*
import 'package:flutter/cupertino.dart';

import '../model/subscription_model.dart';
import '../model/subscription_post_data_model.dart';
import '../repo/subscription_repo.dart';

class SubscriptionProvider with ChangeNotifier{
  final SubscriptionRepository _subscriptionRepository = SubscriptionRepository();

  SubscriptionModel? _subscriptionlist;
  SubscriptionModel? get subscriptionList => _subscriptionlist;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;


  Future<void> billListData() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _subscriptionlist = await _subscriptionRepository.getsubscriptionApi();


    } catch (e) {
      _errorMessage = 'Failed to load survey list: ${e.toString()}';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  final SubscriptionRepository _repository = SubscriptionRepository();

 //bool _isLoading = false;
  SubscriptionPostModel? _subscriptionResponse;
  //String? _errorMessage;

  //bool get isLoading => _isLoading;
  SubscriptionPostModel? get subscriptionResponse => _subscriptionResponse;
 // String? get errorMessage => _errorMessage;


  /// Post subscription data to the API
  Future<void> postSubscription({
    required String userId,
    required String planId,
    required String startDate,
    required String endDate,
    required bool isActive,
    required String paymentId,
    required int amount,
    required String paymentStatus, required name, required durationDays, required price,
  }) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final data = {
        "userId": userId,
        "planId": planId,
        "startDate": startDate,
        "endDate": endDate,
        "isActive": isActive,
        "paymentId": paymentId,
        "amount": amount,
        "paymentStatus": paymentStatus,
      };

      final response = await _repository.postsubscription(data);

      _subscriptionResponse = response;
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

}*/
