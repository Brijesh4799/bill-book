import 'package:BillBook/presentaion/homescreen_documents_pdf/quotation_pdf/subscription_pdf/subscription_pdf.dart';
import 'package:flutter/material.dart';

import '../repo/quotation_pdf_repositroy.dart';


class SubscriptionPdfProvider extends ChangeNotifier {
  final QuotationPdfRepository _repo = QuotationPdfRepository();

  bool _loading = false;
  SubscriptionPdf? _subscriptionPdf;
  String? _error;

  bool get loading => _loading;
  SubscriptionPdf? get subscriptionPdf => _subscriptionPdf;
  String? get error => _error;

  Future<void> fetchSubscriptionPdf() async {
    _loading = true;
    _error = null;
    notifyListeners();

    try {
      final result = await _repo.suscriptionpdf();
      _subscriptionPdf = result;
    } catch (e) {
      _error = e.toString();
    }

    _loading = false;
    notifyListeners();
  }

  bool get isSubscribed => _subscriptionPdf?.isSubscribed ?? false;
}
