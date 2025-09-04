

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentService {
  Razorpay? _razorpay;
  BuildContext? _context;
  VoidCallback? onPaymentSuccessCallback;
  String? paymentId;
  PaymentService() {
    _razorpay = Razorpay();
    _razorpay!.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay!.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay!.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void dispose() {
    _razorpay?.clear();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    debugPrint("🟢 Payment Success: ${response.paymentId}");
    paymentId = response.paymentId;
    Fluttertoast.showToast(msg: 'Payment Successful: ${response.paymentId}');
    if (onPaymentSuccessCallback != null) {
      onPaymentSuccessCallback!();
    }
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    debugPrint("🔴 Payment Error: ${response.code} | ${response.message}");
    Fluttertoast.showToast(
      msg: "ERROR: ${response.code} - ${response.message ?? 'Unknown Error'}",
      toastLength: Toast.LENGTH_SHORT,
    );
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    debugPrint("🟡 External Wallet Chosen: ${response.walletName}");
    Fluttertoast.showToast(msg: 'External Wallet Selected: ${response.walletName}');
  }

  Future<void> openCheckout({
    required String price,
    required String orderId,
    required BuildContext context,
    required VoidCallback onPaymentSuccess,
  }) async {
    _context = context;
    onPaymentSuccessCallback = onPaymentSuccess;

    var options = {
      'key': 'rzp_test_ikM9rKia4yUbG5',
      'amount': int.parse(price),
      'name': 'Positive Milk',
      'description': 'Order Payment',
      'order_id': orderId,
      'prefill': {
        'contact': '9123456789',
        'email': 'test@example.com'
      },
      'external': {
        'wallets': ['paytm']
      },
      'theme': {
        'color': '#30B41D',
      }
    };

    try {
      _razorpay?.open(options);
    } catch (e) {
      debugPrint('Error: $e');
      Fluttertoast.showToast(msg: 'Payment initiation failed');
    }
  }
}




