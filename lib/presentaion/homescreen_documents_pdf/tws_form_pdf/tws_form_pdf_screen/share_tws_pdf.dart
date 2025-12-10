import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import '../repo/tws_pdf_repository.dart';




class PdfDownloadersharetws {
  static final _repository = TWSPdfRepository();

  /// Download and share PDF using quotation ID
  static Future<void> downloadAndSharePdf(String quotationId) async {
    try {
      // Fetch PDF bytes from repository
      final responseBytes = await _repository.twspdfApi(quotationId);

      if (responseBytes != null) {
        // Save PDF locally
        final directory = await getTemporaryDirectory();
        final filePath = '${directory.path}/tws_$quotationId.pdf';
        final file = File(filePath);
        await file.writeAsBytes(responseBytes);

        print("✅ PDF saved at: $filePath");

        // Share the PDF
        await Share.shareXFiles([XFile(filePath)], text: 'Here is your Tws PDF!');
      } else {
        print("❌ Empty PDF response from API");
      }
    } catch (e) {
      print("❌ Error downloading or sharing PDF: $e");
    }
  }
}



