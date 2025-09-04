import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:path_provider/path_provider.dart';

import '../../../../core/widgets/custom_app_bar/ui/customAppBar.dart';

class BillPdfWebViewScreen extends StatefulWidget {
  final String id;

  const BillPdfWebViewScreen({Key? key, required this.id}) : super(key: key);

  @override
  _BillPdfWebViewScreenState createState() => _BillPdfWebViewScreenState();
}

class _BillPdfWebViewScreenState extends State<BillPdfWebViewScreen> {
  String? localPath;

  @override
  void initState() {
    super.initState();
    print(" Received Survey ID: ${widget.id}"); // Debug log
    _downloadPdf();
  }

  Future<void> _downloadPdf() async {
    if (widget.id.isEmpty) {
      print(" No survey ID provided!");
      return;
    }

    final url = 'http://167.71.232.245:8970/api/user/bill/${widget.id}/pdf';
    //final url = 'http://192.168.1.50:5050/api/user/bill/${widget.id}/pdf';
    print(" Downloading PDF from: $url");

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final dir = await getTemporaryDirectory();
        final file = File('${dir.path}/bill_${widget.id}.pdf');
        await file.writeAsBytes(response.bodyBytes);
        setState(() {
          localPath = file.path;
        });
        print(" PDF saved at: ${file.path}");
      } else {
        print(" Failed to download PDF. Status code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error downloading PDF: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Bill PDF'),
      body: localPath == null
          ? const Center(child: CircularProgressIndicator())
          : PDFView(filePath: localPath!),
    );
  }
}
