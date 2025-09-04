import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';

class PdfDownloader {
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

 // static void downloadAndSharePdf(String s) {}

  //static void downloadAndSharePdf(String s) {}
}


