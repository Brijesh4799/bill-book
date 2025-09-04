import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:permission_handler/permission_handler.dart';

class PdfDownloader {
  static Future<void> downloadAndSharePdf(String url) async {
    // Request storage permission
    var status = await Permission.storage.request();
    if (!status.isGranted) {
      return;
    }

    try {
      // Download file
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final bytes = response.bodyBytes;

        // Save to temp directory
        final dir = await getTemporaryDirectory();
        final file = File("${dir.path}/survey.pdf");
        await file.writeAsBytes(bytes);

        // Share PDF
        await Share.shareXFiles([XFile(file.path)], text: "Here is your survey PDF");
      }
    } catch (e) {
      print("Error downloading PDF: $e");
    }
  }

  static void downloadAndOpenPdf(String s) async {
    try {
      final response = await http.get(Uri.parse(s));
      if (response.statusCode == 200) {
        final dir = await getTemporaryDirectory();
        String filePath = "${dir.path}/downloaded_file.pdf";
        File file = File(filePath);
        await file.writeAsBytes(response.bodyBytes);
        await OpenFile.open(filePath);
      } else {
        throw Exception("Failed to download PDF. Status: ${response.statusCode}");
      }
    } catch (e) {
      debugPrint("Error downloading PDF: $e");
    }
  }



  //static void downloadAndOpenPdf(String s) {}
}





class PdfDownloadershare {
  static Future<void> downloadAndSharePdf(String url) async {
    try {
      // Download PDF from API
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final directory = await getTemporaryDirectory();
        final filePath = '${directory.path}/shared_pdf.pdf';
        final file = File(filePath);

        // Save the PDF locally
        await file.writeAsBytes(response.bodyBytes);

        // Share the file
        await Share.shareXFiles([XFile(filePath)], text: 'Here is your Survey PDF!');
      } else {
        print("Failed to download PDF. Status code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error downloading or sharing PDF: $e");
    }
  }
}
