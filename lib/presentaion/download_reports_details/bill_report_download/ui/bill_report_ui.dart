import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../core/widgets/custom_Textbutton.dart';
import '../../../../core/widgets/custom_app_bar/ui/customAppBar.dart';
import '../../../../core/widgets/custom_input_text_field.dart';
import '../../../../core/widgets/custom_more_horiz_scroll_page.dart';
import '../../../homescreen_documents_pdf/bill_pdf/bill_edit_screen/bill_edit_screen.dart';
import '../../../homescreen_documents_pdf/bill_pdf/bill_pdf_screen/bill_pdf_screen.dart';
import '../../../homescreen_documents_pdf/bill_pdf/bill_pdf_screen/download_bill_pdf.dart';
import '../../../homescreen_documents_pdf/bill_pdf/bill_pdf_screen/share_pdf.dart';
import '../../../homescreen_documents_pdf/bill_pdf/provider/bill_pdf_provider.dart';
import '../../../homescreen_documents_pdf/quotation_pdf/provider/quotation_pdf_provider.dart';
import '../../../homescreen_documents_pdf/quotation_pdf/quotation_webview_pdf/loding_page.dart';
import '../../../homescreen_documents_pdf/quotation_pdf/subscription_pdf/subscription_pdf_provider.dart';
import '../../../homescreen_documents_pdf/survey_pdf/servey_pdf_share/servey_pdf_share.dart';
import '../model/bill_report_model.dart';
import '../repo/bill_report_repogistory.dart';

class BillReportScreen extends StatefulWidget {
  const BillReportScreen({super.key});

  @override
  State<BillReportScreen> createState() => _BillReportScreenState();
}

class _BillReportScreenState extends State<BillReportScreen> {
  final _repo = billReportRepository();

  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();

  List<Data> reportData = [];
  bool isLoading = false;

  Future<void> _pickDate(BuildContext context, TextEditingController controller) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      controller.text = DateFormat('yyyy-MM-dd').format(picked);
    }
  }

  Future<void> _getBillReport() async {
    String startDate = startDateController.text.trim();
    String endDate = endDateController.text.trim();

    if (startDate.isEmpty || endDate.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select both start and end dates')),
      );
      return;
    }

    setState(() => isLoading = true);
    try {
      final report = await _repo.getbilldataApi(startDate, endDate);
      setState(() {
        reportData = report.data ?? [];
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to fetch report: $e')),
      );
    } finally {
      setState(() => isLoading = false);
    }
  }
  bool isLoading1 = false;

  Widget _buildReportCard(Data data, int index) {
    final invoice = data.formData?.invoiceDetails;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black, width: 1),
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
                Text('${index + 1}',
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14)),
                const Spacer(),
                Text('BILL: ${index + 1}',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          const SizedBox(height: 10),

          // Phone number row
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
                Text('${data.formData?.billingDetails?.customerName ?? "N/A"}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
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

          SizedBox(height: 5,),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child:  Text('${data.formData?.invoiceDetails?.invoiceMovingPath ?? "N/A"}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
              ),
              Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text('${data.formData?.invoiceDetails?.invoiceMoveTo ?? "N/A"}',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Divider(height: 2, color: Colors.grey),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child:
            Row(
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
                Text('${data.formData?.billingDetails?.customerPhone ?? "N/A"}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
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
                    const Text('Share Pdf',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),
          ExpansionTileWrapper(
            title: 'Bill',
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
                            final success = await Provider.of<BillPdfProvider>(context, listen: false)
                                .deletebill(data.sId ?? '');
                            print(data.sId);

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(success ? 'Bill deleted successfully' : 'Bill deleted successfully${data.sId}'),
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
                                  Text('Delete Bill', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12)),
                                  Text('बिल  रसीद हटाएं',style: TextStyle(fontSize: 12),),

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
                              builder: (context) => BillPdfWebViewScreen(id: data.sId ?? ''),

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
                          if (data.sId != null) {
                            showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (context) => LoadingDialog(),
                            );
                            final provider =
                            Provider.of<QuatationPdfProvider>(context, listen: false);
                            await provider.fetchQuotationSignature(data.sId!, "bill");
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
                          if (data.sId != null) {
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
                            await PdfDownloadersharebill.downloadAndSharePdf(data.sId!);
                          } else {
                            print("❌ item.sId is null");
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          margin: const EdgeInsets.only(left: 4),
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
                              const Icon(Icons.picture_as_pdf, color: Colors.black),
                              const SizedBox(width: 5),
                              isLoading
                                  ? const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(strokeWidth: 2),
                              )
                                  : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Share Bill Pdf',
                                    style:
                                    TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                                  ),
                                  Text(
                                    'बिल पीडीएफ भेजें',
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
                          final String userId = data.sId ?? "";
                          print("userId");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BillEditScreen(
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
                                    'Edit Bill',
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                                  ),
                                  Text(
                                    'बिल संशोधन करे',
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
                          if (data.sId != null) {
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
                            await PdfDownloaderbill.downloadAndOpenPdf(data.sId!);
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
    );
  }

  @override
  void dispose() {
    startDateController.dispose();
    endDateController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Bill Reports'),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(16.0),
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
                      onTap: () => _pickDate(context, startDateController),
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
                      onTap: () => _pickDate(context, endDateController),
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
              CustomButton(
                label: 'Download Reports',
                onPressed: _getBillReport,
              ),
              const SizedBox(height: 20),

              // Show loader
              if (isLoading)
                const Center(child: CircularProgressIndicator())
              else if (reportData.isEmpty)
                const Text(
                  'No data found. Please try different dates.',
                  style: TextStyle(color: Colors.grey),
                )
              else
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: reportData
                      .asMap()
                      .entries
                      .map((entry) =>
                      _buildReportCard(entry.value, entry.key))
                      .toList(),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
