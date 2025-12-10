import 'dart:io';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import '../repo/bill_pdf_repository.dart';

class PdfDownloaderbill {
  static final _repository = BillPdfRepository();

  static Future<void> downloadAndOpenPdf(String quotationId) async {
    try {
      final responseBytes = await _repository.billpdfApi(quotationId);

      if (responseBytes != null) {
        final dir = await getTemporaryDirectory();
        String filePath = "${dir.path}/bill_$quotationId.pdf";
        File file = File(filePath);
        await file.writeAsBytes(responseBytes);
        print(" PDF saved at: $filePath");

        await OpenFile.open(filePath);
      } else {
        print(" Empty PDF response from API");
      }
    } catch (e) {
      print(" Error downloading PDF: $e");
    }
  }
}
