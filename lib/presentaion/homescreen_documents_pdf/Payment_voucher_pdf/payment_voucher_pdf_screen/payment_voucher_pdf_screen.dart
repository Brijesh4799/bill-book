import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:path_provider/path_provider.dart';

import '../../../../core/widgets/custom_app_bar/ui/customAppBar.dart';

class PaymentVoucherPdfWebViewScreen extends StatefulWidget {
  final String id;

  const PaymentVoucherPdfWebViewScreen({Key? key, required this.id}) : super(key: key);

  @override
  _PaymentVoucherPdfWebViewScreenState createState() => _PaymentVoucherPdfWebViewScreenState();
}

class _PaymentVoucherPdfWebViewScreenState extends State<PaymentVoucherPdfWebViewScreen> {
  String? localPath;

  @override
  void initState() {
    super.initState();
    print(" Received paymentVoucher ID: ${widget.id}"); // Debug log
    _downloadPdf();
  }

  Future<void> _downloadPdf() async {
    if (widget.id.isEmpty) {
      print(" No paymentVoucher ID provided!");
      return;
    }

    final url = 'http://167.71.232.245:8970/api/user/paymentVoucher/${widget.id}/pdf';
    print(" Downloading PDF from: $url");

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final dir = await getTemporaryDirectory();
        final file = File('${dir.path}/paymentVoucher_${widget.id}.pdf');
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
      appBar: CustomAppBar(title: 'PaymentVoucher PDF'),
      body: localPath == null
          ? const Center(child: CircularProgressIndicator())
          : PDFView(filePath: localPath!),
    );
  }
}
