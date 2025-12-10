import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../quotation_pdf/repo/quotation_pdf_repositroy.dart';

class PdfDownloadershare {
  static final _repository = QuotationPdfRepository();

  /// Download and share PDF using quotation ID
  static Future<void> downloadAndSharePdf(String quotationId) async {
    try {
      // Fetch PDF bytes from repository
      final responseBytes = await _repository.quotationpdfApi(quotationId);

      if (responseBytes != null) {
        // Save PDF locally
        final directory = await getTemporaryDirectory();
        final filePath = '${directory.path}/quotation_$quotationId.pdf';
        final file = File(filePath);
        await file.writeAsBytes(responseBytes);

        print("✅ PDF saved at: $filePath");

        // Share the PDF
        await Share.shareXFiles([XFile(filePath)], text: 'Here is your Servey PDF!');
      } else {
        print("❌ Empty PDF response from API");
      }
    } catch (e) {
      print("❌ Error downloading or sharing PDF: $e");
    }
  }
}



