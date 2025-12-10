import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../core/widgets/custom_Textbutton.dart';
import '../../../../core/widgets/custom_app_bar/ui/customAppBar.dart';
import '../../../../core/widgets/custom_input_text_field.dart';
import '../../../../core/widgets/custom_more_horiz_scroll_page.dart';
import '../../../homescreen_documents_pdf/quotation_pdf/provider/quotation_pdf_provider.dart';
import '../../../homescreen_documents_pdf/quotation_pdf/quotation_edit_page/quotation_edit_screen.dart';
import '../../../homescreen_documents_pdf/quotation_pdf/quotation_pdf_download/quotation_pdf_download.dart';
import '../../../homescreen_documents_pdf/quotation_pdf/quotation_webview_pdf/loding_page.dart';
import '../../../homescreen_documents_pdf/quotation_pdf/quotation_webview_pdf/quotation_webview_pdf.dart';

import '../../../homescreen_documents_pdf/quotation_pdf/subscription_pdf/subscription_pdf_provider.dart';
import '../../../homescreen_documents_pdf/survey_pdf/servey_pdf_share/servey_pdf_share.dart' hide PdfDownloader;
import '../model/quotation_report_model.dart';
import '../repo/quotationReportRepogitory.dart';

class QuotationReportUi extends StatefulWidget {
  const QuotationReportUi({super.key});

  @override
  State<QuotationReportUi> createState() => _QuotationReportUiState();
}

class _QuotationReportUiState extends State<QuotationReportUi> {
  final QuotationreportRepogistory _repo = QuotationreportRepogistory();
  late Future<QuotationReportModel> _futureReport;
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  List<Data> reportData = [];
  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    final initialStart = now.subtract(const Duration(days: 30));
    startDateController.text = DateFormat('yyyy-MM-dd').format(initialStart);
    endDateController.text = DateFormat('yyyy-MM-dd').format(now);
    _fetchReports();
  }
  void _fetchReports() {
    final start = startDateController.text;
    final end = endDateController.text;
    setState(() {
      _futureReport = _repo.getquotationApi(start, end);
      _futureReport.then((value) {
        setState(() {
          reportData = value.data ?? [];
        });
      }).catchError((e) {
        setState(() {
          reportData = [];
        });
      });
    });
  }

  Future<void> _selectDate(BuildContext context, TextEditingController controller) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.tryParse(controller.text) ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        controller.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  void _downloadReport() {
    _fetchReports();
  }
  bool isLoading = false;
  Widget _buildReportCard(Data item, int index) {
    final formData = item.formData;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black, width: 1),
      ),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.black,
                width: 1,
              ),
            ),
            child: Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFF137DC7),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  height: 40,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Text(
                        '${index + 1}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        'QUOTATION: ${index + 1}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey[300],
                        ),
                        padding: const EdgeInsets.all(6),
                        child: const Icon(Icons.person, size: 20, color: Colors.black),
                      ),
                      const SizedBox(width: 8),
                      Text('${formData?.quotationDetails?.companyName ?? 'N/A'}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
                      const Spacer(),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey[300],
                            ),
                            padding: const EdgeInsets.all(6),
                            child: const Icon(Icons.currency_rupee, size: 20, color: Colors.black),
                          ),
                          const SizedBox(width: 8),
                          const Text('0.0',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                const Divider(height: 2, color: Colors.grey),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        'From',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: Color(0xff137DC7),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Text(
                        'To',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text('${formData?.moveFrom?.city ?? 'N/A'}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                    ),
                    Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text('${formData?.moveTo?.city ?? 'N/A'}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                    ),
                  ],
                ),
                SizedBox(height: 5,),
                Center(
                  child: Text('${formData?.quotationDetails?.packingDate ?? 'N/A'}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                ),
                const SizedBox(height: 10),
                const Divider(height: 2, color: Colors.grey),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey[300],
                        ),
                        padding: const EdgeInsets.all(6),
                        child: const Icon(Icons.call, size: 20, color: Colors.black),
                      ),
                      const SizedBox(width: 8,),
                      Text('${formData?.quotationDetails?.partyname ?? 'N/A'}'),
                      const Spacer(),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey[300],
                            ),
                            padding: const EdgeInsets.all(6),
                            child: const Icon(Icons.picture_as_pdf, size: 20, color: Colors.black),
                          ),
                          const SizedBox(width: 8),
                          const Text('Share Pdf'),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 10),
                ExpansionTileWrapper(
                  title: 'Quotation',
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () async {
                                final confirm = await showDialog<bool>(
                                  context: context,
                                  builder: (_) => AlertDialog(
                                    title: const Text('Confirm Delete'),
                                    content: const Text('Are you sure you want to delete this survey?'),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.pop(context, false),
                                        child: const Text('Cancel'),
                                      ),
                                      TextButton(
                                        onPressed: () => Navigator.pop(context, true),
                                        child: const Text('Delete'),
                                      ),
                                    ],
                                  ),
                                );
                                if (confirm == true) {
                                  final success = await Provider.of<QuatationPdfProvider>(context, listen: false)
                                      .deletequotation(item.sId ?? '');
                                  print(item.sId);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(success ? 'proforma deleted successfully' : 'proforma deleted successfully${item.sId}'),
                                    ),
                                  );
                                }
                              },
                              child: Container(
                                padding: EdgeInsets.all(5),
                                margin: EdgeInsets.only(right: 4),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 6,
                                      spreadRadius: 2,
                                      offset: Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child:
                                Row(
                                  children: [
                                    Icon(Icons.delete, color: Colors.black),
                                    SizedBox(width: 5),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Delete Quotation', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12)),
                                        Text('कोटेशन हटाएं',style: TextStyle(fontSize: 12),),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => QuotationPdfScreen(id: item.sId ?? ''),
                                  ),
                                );
                              },
                              child: Container(
                                padding: EdgeInsets.all(5),
                                margin: EdgeInsets.only(left: 4),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 6,
                                      spreadRadius: 2,
                                      offset: Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    Icon(Icons.picture_as_pdf, color: Colors.black),
                                    SizedBox(width: 5),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('View PDF', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                                        Text('पीडीएफ़ देखें', style: TextStyle(fontSize: 12)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () async {
                                if (item.sId != null) {
                                  showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (context) => LoadingDialog(),
                                  );
                                  final provider =
                                  Provider.of<QuatationPdfProvider>(context, listen: false);
                                  await provider.fetchQuotationSignature(item.sId!, "quotation");
                                  if (provider.signatureLink != null) {
                                    final link = provider.signatureLink!;
                                    await Share.share(
                                      "Here is the customer signature PDF link:\n$link",
                                      subject: "Customer Signature PDF",
                                    );
                                  } else {
                                    print(" Signature link is null");
                                  }
                                } else {
                                  print(" item.sId is null");
                                }
                              },
                              child: Container(
                                padding: EdgeInsets.all(5),
                                margin: EdgeInsets.only(left: 4),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 6,
                                      spreadRadius: 2,
                                      offset: Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    Icon(Icons.edit, color: Colors.black),
                                    SizedBox(width: 5),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Customer Sign..',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          softWrap: true,
                                        ),
                                        Text(
                                          'ग्राहक के हस्ताक्षर',
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () async {
                                if (item.sId != null) {
                                  final subscriptionProvider =
                                  Provider.of<SubscriptionPdfProvider>(context, listen: false);
                                  if (!subscriptionProvider.isSubscribed) {
                                    showDialog(
                                      context: context,
                                      builder: (ctx) => AlertDialog(
                                        title: const Text("Subscription Required"),
                                        content: const Text(
                                            "You are not subscribed. Please subscribe to share PDFs."),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.of(ctx).pop(),
                                            child: const Text("OK"),
                                          ),
                                        ],
                                      ),
                                    );
                                    return;
                                  }
                                  showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (context) => LoadingDialog(),
                                  );
                                  await PdfDownloadershare.downloadAndSharePdf(item.sId!);
                                } else {
                                  print("❌ item.sId is null");
                                }
                              },
                              child: Container(
                                padding: EdgeInsets.all(5),
                                margin: EdgeInsets.only(left: 4),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 6,
                                      spreadRadius: 2,
                                      offset: Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    Icon(Icons.edit, color: Colors.black),
                                    SizedBox(width: 5),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Share Quotation',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          softWrap: true,
                                        ),
                                        Text(
                                          'कोटेशन पीडीएफ भेजें',
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () async {
                                final String userId = item.sId ?? "";
                                print("userId");
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => QuotationEditScreen(
                                      id: userId,
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                padding: const EdgeInsets.all(5),
                                margin: const EdgeInsets.only(right: 4),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 6,
                                      spreadRadius: 2,
                                      offset: Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    const Icon(Icons.edit_calendar, color: Colors.black),
                                    const SizedBox(width: 5),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: const [
                                        Text(
                                          'Edit Quotation',
                                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                                        ),
                                        Text(
                                          'कोटेशन संशोधन करे',
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () async {
                                if (item.sId != null) {
                                  final subscriptionProvider =
                                  Provider.of<SubscriptionPdfProvider>(context, listen: false);
                                  if (!subscriptionProvider.isSubscribed) {
                                    showDialog(
                                      context: context,
                                      builder: (ctx) => AlertDialog(
                                        title: const Text("Subscription Required"),
                                        content: const Text(
                                            "You are not subscribed. Please subscribe to download PDFs."),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.of(ctx).pop(),
                                            child: const Text("OK"),
                                          ),
                                        ],
                                      ),
                                    );
                                    return;
                                  }
                                  showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (context) => LoadingDialog(),
                                  );
                                  await PdfDownloader.downloadAndOpenPdf(context, item.sId!);
                                } else {
                                  print(" item.sId is null");
                                }
                              },
                              child: Container(
                                padding: EdgeInsets.all(5),
                                margin: EdgeInsets.only(left: 4),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 6,
                                      spreadRadius: 2,
                                      offset: Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    Icon(Icons.picture_as_pdf, color: Colors.black),
                                    SizedBox(width: 5),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Download PDF',
                                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                                        ),
                                        Text(
                                          'डाउनलोड पीडीएफ',
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
  Widget buildRow(String label, dynamic value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Text(
        "$label: ${value ?? '-'}",
        style: const TextStyle(fontSize: 14),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Quotation'),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Download',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => _selectDate(context, startDateController),
                      child: AbsorbPointer(
                        child: inputTextFields(
                          label: 'Start Date',
                          textEditingController: startDateController,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => _selectDate(context, endDateController),
                      child: AbsorbPointer(
                        child: inputTextFields(
                          label: 'End Date',
                          textEditingController: endDateController,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              CustomButton(label: 'Download Reports', onPressed: _downloadReport),
              const SizedBox(height: 20),
              reportData.isNotEmpty
                  ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: reportData
                    .asMap()
                    .entries
                    .map((entry) => _buildReportCard(entry.value, entry.key))
                    .toList(),
              )
                  : const Text(
                'No data found. Please try different dates.',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
