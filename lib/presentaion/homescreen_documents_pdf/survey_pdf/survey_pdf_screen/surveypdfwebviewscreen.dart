import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:provider/provider.dart';
import 'package:screen_protector/screen_protector.dart';
import '../../../../core/widgets/custom_app_bar/ui/customAppBar.dart';
import '../../quotation_pdf/subscription_pdf/subscription_pdf_provider.dart';
import '../provider/survey_pdf_provider.dart';


class SurveyPdfWebViewScreen extends StatefulWidget {
  final String id;
  const SurveyPdfWebViewScreen({Key? key, required this.id}) : super(key: key);

  @override
  _SurveyPdfWebViewScreenState createState() => _SurveyPdfWebViewScreenState();
}

class _SurveyPdfWebViewScreenState extends State<SurveyPdfWebViewScreen> {
  String loadingText = "Loading PDF";
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startLoadingAnimation();

    // Fetch subscription and handle screenshot blocking
    Future.microtask(() async {
      try {
        final subscriptionProvider =
        context.read<SubscriptionPdfProvider>();
        await subscriptionProvider.fetchSubscriptionPdf();

        final isSubscribed = subscriptionProvider.isSubscribed;
        print('Survey Subscription status: $isSubscribed');

        if (!isSubscribed) {
          print('Blocking screenshots because user is not subscribed (Survey)');
          try {
            await ScreenProtector.preventScreenshotOn();
            print('Screenshot protection enabled for Survey PDF');
          } catch (e) {
            print("Failed to block screenshots: $e");
          }
        } else {
          print('Allowing screenshots because user is subscribed (Survey)');
          try {
            await ScreenProtector.preventScreenshotOff();
          } catch (e) {
            print("Failed to allow screenshots: $e");
          }
        }
      } catch (e) {
        print("Survey subscription check failed: $e");
      } finally {
        // Always fetch PDF regardless of subscription check
        context.read<SurveyPdfProvider>().fetchserveyPdf(widget.id);
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

    // Always allow screenshots again when leaving screen
    try {
      ScreenProtector.preventScreenshotOff();
    } catch (e) {
      print("Failed to clear screenshot protection: $e");
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Survey PDF'),
      body: Consumer<SurveyPdfProvider>(
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
                        fontSize: 16, fontWeight: FontWeight.w500),
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



/*



import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:provider/provider.dart';
import '../../../../core/widgets/custom_app_bar/ui/customAppBar.dart';

import '../provider/survey_pdf_provider.dart';

class SurveyPdfWebViewScreen extends StatefulWidget {
  final String id;
  const SurveyPdfWebViewScreen({Key? key, required this.id}) : super(key: key);

  @override
  _SurveyPdfWebViewScreenState createState() => _SurveyPdfWebViewScreenState();
}

class _SurveyPdfWebViewScreenState extends State<SurveyPdfWebViewScreen> {
  @override
  void initState() {
    super.initState();
    print("📩 Received quotation ID: ${widget.id}");
    Future.microtask(() {
      context.read<SurveyPdfProvider>().fetchserveyPdf(widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Servey PDF'),
      body: Consumer<SurveyPdfProvider>(
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
