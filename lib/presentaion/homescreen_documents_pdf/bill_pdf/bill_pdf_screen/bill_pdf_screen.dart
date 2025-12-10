/*
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:provider/provider.dart';
import '../../../../core/widgets/custom_app_bar/ui/customAppBar.dart';
import '../provider/bill_pdf_provider.dart';

class billPdfWebViewScreen extends StatefulWidget {
  final String id;
  const billPdfWebViewScreen({Key? key, required this.id}) : super(key: key);
  @override
  _billPdfWebViewScreenState createState() => _billPdfWebViewScreenState();
}

class _billPdfWebViewScreenState extends State<billPdfWebViewScreen> {
  @override
  void initState() {
    super.initState();
    print("📩 Received quotation ID: ${widget.id}");
    Future.microtask(() {
      context.read<BillPdfProvider>().fetchbillPdf(widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Bill PDF'),
      body: Consumer<BillPdfProvider>(
        builder: (context, provider, _) {
          if (provider.pdfLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (provider.errorMessage != null) {
            return Center(child: Text(provider.errorMessage!));
          } else if (provider.pdfLocalPath != null) {
            return PDFView(filePath: provider.pdfLocalPath!);
          } else {
            return const Center(child: Text("No PDF available"));
          }
        },
      ),
    );
  }
}
*/

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:provider/provider.dart';
import 'package:screen_protector/screen_protector.dart';

import '../../../../core/widgets/custom_app_bar/ui/customAppBar.dart';
import '../../quotation_pdf/subscription_pdf/subscription_pdf_provider.dart';
import '../provider/bill_pdf_provider.dart';


class BillPdfWebViewScreen extends StatefulWidget {
  final String id;
  const BillPdfWebViewScreen({Key? key, required this.id}) : super(key: key);

  @override
  _BillPdfWebViewScreenState createState() => _BillPdfWebViewScreenState();
}

class _BillPdfWebViewScreenState extends State<BillPdfWebViewScreen> {
  String loadingText = "Loading PDF";
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startLoadingAnimation();

    Future.microtask(() async {
      try {
        // ✅ Fetch subscription info first
        final subscriptionProvider =
        context.read<SubscriptionPdfProvider>();
        await subscriptionProvider.fetchSubscriptionPdf();

        final isSubscribed = subscriptionProvider.isSubscribed;
        print('🧾 Bill Subscription status: $isSubscribed');

        if (!isSubscribed) {
          print('Blocking screenshots because user is not subscribed (Bill)');
          try {
            await ScreenProtector.preventScreenshotOn();
            print('✅ Screenshot protection enabled for Bill PDF');
          } catch (e) {
            print("⚠️ Failed to block screenshots: $e");
          }
        } else {
          print('Allowing screenshots because user is subscribed (Bill)');
          try {
            await ScreenProtector.preventScreenshotOff();
          } catch (e) {
            print("⚠️ Failed to allow screenshots: $e");
          }
        }
      } catch (e) {
        print("⚠️ Bill subscription check failed: $e");
      } finally {
        // ✅ Always fetch PDF regardless of subscription status
        context.read<BillPdfProvider>().fetchbillPdf(widget.id);
      }
    });
  }

  void _startLoadingAnimation() {
    int dotCount = 0;
    _timer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      setState(() {
        dotCount = (dotCount + 1) % 4;
        loadingText = "Loading PDF" + "." * dotCount;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();

    // ✅ Reset screenshot protection when leaving
    try {
      ScreenProtector.preventScreenshotOff();
    } catch (e) {
      print("⚠️ Failed to clear screenshot protection: $e");
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Bill PDF'),
      body: Consumer<BillPdfProvider>(
        builder: (context, provider, _) {
          if (provider.pdfLoading) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircularProgressIndicator(),
                  const SizedBox(height: 20),
                  Text(
                    loadingText,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            );
          } else if (provider.errorMessage != null) {
            return Center(child: Text(provider.errorMessage!));
          } else if (provider.pdfLocalPath != null) {
            return PDFView(filePath: provider.pdfLocalPath!);
          } else {
            return const Center(child: Text("No PDF available"));
          }
        },
      ),
    );
  }
}
