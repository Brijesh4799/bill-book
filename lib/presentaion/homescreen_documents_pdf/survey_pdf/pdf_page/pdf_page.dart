
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import '../repo/survey_repository.dart';
import '../../quotation_pdf/subscription_pdf/subscription_pdf_provider.dart';

class PdfDownloadershareservey {
  static final _repository = SurveyPdfRepository();

  /// Download and share PDF only if subscribed
  static Future<void> downloadAndSharePdf({
    required BuildContext context,
    required String surveyId,
    required SubscriptionPdfProvider provider,
  }) async {
    try {
      // Check subscription status
      if (!provider.isSubscribed) {
        // Show popup if not subscribed
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text("Subscription Required"),
            content: const Text(
                "You are not subscribed. Please subscribe to share surveys."),
            actions: [
              TextButton(
                  onPressed: () => Navigator.of(ctx).pop(),
                  child: const Text("OK"))
            ],
          ),
        );
        return;
      }

      // Fetch PDF bytes from repository
      final responseBytes = await _repository.serveypdfApi(surveyId);

      if (responseBytes != null && responseBytes.isNotEmpty) {
        // Save PDF locally
        final directory = await getTemporaryDirectory();
        final filePath = '${directory.path}/survey_$surveyId.pdf';
        final file = File(filePath);
        await file.writeAsBytes(responseBytes);

        print("✅ PDF saved at: $filePath");

        // Share the PDF
        await Share.shareXFiles(
          [XFile(filePath)],
          text: 'Here is your Survey PDF!',
        );
      } else {
        // Show SnackBar if PDF is empty
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("PDF is empty or not available."),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      print("❌ Error downloading or sharing PDF: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Error downloading or sharing PDF: $e"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}

