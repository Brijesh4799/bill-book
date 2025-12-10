/*
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';

import '../repo/quotation_pdf_repositroy.dart';


class PdfDownloader {
  static final _repository = QuotationPdfRepository();

  /// Download PDF using quotation ID and open it
  static Future<void> downloadAndOpenPdf(String quotationId) async {
    try {
      // Fetch PDF bytes from repository
      final responseBytes = await _repository.quotationpdfApi(quotationId);

      if (responseBytes != null) {
        // Save PDF locally
        final dir = await getTemporaryDirectory();
        String filePath = "${dir.path}/quotation_$quotationId.pdf";
        File file = File(filePath);
        await file.writeAsBytes(responseBytes);

        print("✅ PDF saved at: $filePath");

        // Open the PDF
        await OpenFile.open(filePath);
      } else {
        print("❌ Empty PDF response from API");
      }
    } catch (e) {
      print("❌ Error downloading PDF: $e");
    }
  }
}
*/


import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import '../repo/quotation_pdf_repositroy.dart';
import '../subscription_pdf/subscription_pdf_provider.dart';

class PdfDownloader {
  static final _repository = QuotationPdfRepository();

  /// Download PDF using quotation ID and open it
  static Future<void> downloadAndOpenPdf(BuildContext context, String quotationId) async {
    final subscriptionProvider =
    Provider.of<SubscriptionPdfProvider>(context, listen: false);

    // 🔄 Ensure subscription is loaded
    if (subscriptionProvider.subscriptionPdf == null) {
      await subscriptionProvider.fetchSubscriptionPdf();
    }

    if (subscriptionProvider.isSubscribed) {
      // ✅ Subscribed → download
      try {
        final responseBytes = await _repository.quotationpdfApi(quotationId);

        if (responseBytes != null) {
          final dir = await getTemporaryDirectory();
          String filePath = "${dir.path}/quotation_$quotationId.pdf";
          File file = File(filePath);
          await file.writeAsBytes(responseBytes);

          print("✅ PDF saved at: $filePath");
          await OpenFile.open(filePath);
        } else {
          print("❌ Empty PDF response");
          _showToast("No PDF data received.");
        }
      } catch (e) {
        print("❌ Error downloading PDF: $e");
        _showToast("Error downloading PDF.");
      }
    } else {
      // 🚫 Not subscribed
      _showToast("You are not subscribed! Get a subscription plan.");
    }
  }

  static void _showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
    );
  }
}
