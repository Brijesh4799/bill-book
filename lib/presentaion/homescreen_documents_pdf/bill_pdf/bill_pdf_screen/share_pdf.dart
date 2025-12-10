import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import '../repo/bill_pdf_repository.dart';

class PdfDownloadersharebill {
  static final _repository = BillPdfRepository();
  static Future<void> downloadAndSharePdf(String quotationId) async {
    try {

      final responseBytes = await _repository.billpdfApi(quotationId);
      if (responseBytes != null) {
        final directory = await getTemporaryDirectory();
        final filePath = '${directory.path}/bill_$quotationId.pdf';
        final file = File(filePath);
        await file.writeAsBytes(responseBytes);

        print(" PDF saved at: $filePath");

        await Share.shareXFiles([XFile(filePath)], text: 'Here is your Bill PDF!');
      } else {
        print(" Empty PDF response from API");
      }
    } catch (e) {
      print(" Error downloading or sharing PDF: $e");
    }
  }
}



