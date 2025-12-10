


import 'dart:io';

import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

import '../repo/tws_pdf_repository.dart';



class PdfDownloadertws {
  static final _repository = TWSPdfRepository();

  /// Download PDF using quotation ID and open it
  static Future<void> downloadAndOpenPdf(String quotationId) async {
    try {
      // Fetch PDF bytes from repository
      final responseBytes = await _repository.twspdfApi(quotationId);

      if (responseBytes != null) {
        // Save PDF locally
        final dir = await getTemporaryDirectory();
        String filePath = "${dir.path}/tws_$quotationId.pdf";
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
