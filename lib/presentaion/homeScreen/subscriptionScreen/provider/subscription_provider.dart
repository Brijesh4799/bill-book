import 'package:flutter/cupertino.dart';

import '../../../../core/payment/payment_service.dart';
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

  SubscriptionPostModel? subscriptionResponse;

  PaymentService paymentService=PaymentService();

  /// ✅ Submit subscription plan (your new method)
  Future<void> submitSubscription({


    required String id,

    required BuildContext context,
  }) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final data = {
        //"price": price,
        "subscriptionId": id,

      };


      final response = await _subscriptionRepository.CreateRozpay(data);

      subscriptionResponse = response;
      print("✅ Submit Response: $response");
      if(response!=null&&response.success==true){
        print("✅ Submit 2222:");
        paymentService.openCheckout(context:context ,onPaymentSuccess:response.success.toString,orderId:response.data!.orderId.toString() ,price:response.data!.amount.toString() );
      }
    } catch (e) {
      _errorMessage = "Error submitting subscription: $e";
      print(_errorMessage);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}


