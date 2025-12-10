/*


import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:provider/provider.dart';
import '../../../../core/widgets/custom_app_bar/ui/customAppBar.dart';
import '../provider/tws_pdf_provider.dart';






class TwsPdfWebViewScreen extends StatefulWidget {
  final String id;
  const TwsPdfWebViewScreen({Key? key, required this.id}) : super(key: key);

  @override
  _TwsPdfWebViewScreenState createState() => _TwsPdfWebViewScreenState();
}

class _TwsPdfWebViewScreenState extends State<TwsPdfWebViewScreen> {
  @override
  void initState() {
    super.initState();
    print("📩 Received quotation ID: ${widget.id}");
    Future.microtask(() {
      context.read<TwsPdfProvider>().fetchtwsPdf(widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Tws PDF'),
      body: Consumer<TwsPdfProvider>(
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
import '../provider/tws_pdf_provider.dart';


class TwsPdfWebViewScreen extends StatefulWidget {
  final String id;
  const TwsPdfWebViewScreen({Key? key, required this.id}) : super(key: key);

  @override
  _TwsPdfWebViewScreenState createState() => _TwsPdfWebViewScreenState();
}

class _TwsPdfWebViewScreenState extends State<TwsPdfWebViewScreen> {
  String loadingText = "Loading PDF";
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startLoadingAnimation();

    // Subscription check + screenshot handling
    Future.microtask(() async {
      try {
        final subscriptionProvider = context.read<SubscriptionPdfProvider>();
        await subscriptionProvider.fetchSubscriptionPdf();

        final isSubscribed = subscriptionProvider.isSubscribed;
        print('📝 TWS PDF Subscription status: $isSubscribed');

        if (!isSubscribed) {
          print('Blocking screenshots because user is not subscribed (TWS PDF)');
          try {
            await ScreenProtector.preventScreenshotOn();
            print('✅ Screenshot protection enabled for TWS PDF');
          } catch (e) {
            print("⚠️ Failed to block screenshots: $e");
          }
        } else {
          print('Allowing screenshots because user is subscribed (TWS PDF)');
          try {
            await ScreenProtector.preventScreenshotOff();
          } catch (e) {
            print("⚠️ Failed to allow screenshots: $e");
          }
        }
      } catch (e) {
        print("⚠️ TWS PDF subscription check failed: $e");
      } finally {
        // Always fetch PDF regardless of subscription status
        context.read<TwsPdfProvider>().fetchtwsPdf(widget.id);
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

    // Reset screenshot protection
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
      appBar: CustomAppBar(title: 'TWS PDF'),
      body: Consumer<TwsPdfProvider>(
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
