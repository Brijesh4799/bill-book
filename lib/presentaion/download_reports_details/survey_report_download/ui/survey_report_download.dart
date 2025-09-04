/*



import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/widgets/custom_Textbutton.dart';
import '../../../../core/widgets/custom_app_bar/ui/customAppBar.dart';
import '../../../../core/widgets/custom_input_text_field.dart';
import '../model/survey_report_download_model.dart';
import '../repo/survey_report_repogistory.dart';


class SurveyRepotsDownload extends StatefulWidget {
  const SurveyRepotsDownload({super.key});

  @override
  State<SurveyRepotsDownload> createState() => _SurveyRepotsDownloadState();
}

class _SurveyRepotsDownloadState extends State<SurveyRepotsDownload> {
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();

  final SurveyReportPdfRepository _repo = SurveyReportPdfRepository();

  List<Data> reportData = [];

  Future<void> _selectDate(BuildContext context, TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      controller.text = DateFormat('yyyy-MM-dd').format(picked);
    }
  }

  void _downloadReport() async {
    String startDate = startDateController.text.trim();
    String endDate = endDateController.text.trim();

    if (startDate.isEmpty || endDate.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please select both start and end date')),
      );
      return;
    }

    try {
      final report = await _repo.getsurveyreportdataApi(startDate, endDate);
      setState(() {
        reportData = report.data ?? [];
      });
      print("Downloaded report: ${report.toJson()}");
    } catch (e) {
      print('Error downloading report: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to download report')),
      );
    }
  }

  Widget _buildReportCard(Data item) {
    final customer = item.formData?.customerDetails;

    return


      */
/*Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Packing Number: ${customer?.name ?? "N/A"}',
                style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Text('Phone: ${customer?.phone ?? "N/A"}'),
            SizedBox(height: 3),
            Text('Date: ${customer?.date ?? "N/A"}'),
            SizedBox(height: 3),
            Text('Move From: ${customer?.moveFrom ?? "N/A"}'),
            SizedBox(height: 3),
            Text('Move To: ${customer?.moveTo ?? "N/A"}'),
            SizedBox(height: 3),
            Text('Vehicle No: ${customer?.assessmentSurvey ?? "N/A"}'),
            SizedBox(height: 3),
            if (item.formData?.itemParticulars != null &&
                item.formData!.itemParticulars!.isNotEmpty) ...[
              Divider(),
              Text('Items:', style: TextStyle(fontWeight: FontWeight.bold)),
              ...item.formData!.itemParticulars!.map((part) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: Text(
                    '- ${part.itemName ?? ''} | Qty: ${part.quantity ?? 0} | Box: ${part.boxNumber ?? ''}'),
              )),
            ],
          ],
        ),
      ),
    );*//*

    Container(
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
                 )
               ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Survey Reports'),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Download', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 15),
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
                  SizedBox(width: 10),
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
              SizedBox(height: 20),
              CustomButton(label: 'Download Reports', onPressed: _downloadReport),
              SizedBox(height: 20),
              reportData.isNotEmpty
                  ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: reportData.map(_buildReportCard).toList(),
              )
                  : Text('No data found. Please try different dates.',
                  style: TextStyle(color: Colors.grey)),
            ],
          ),
        ),
      ),
    );
  }
}
*/


import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../core/widgets/custom_Textbutton.dart';
import '../../../../core/widgets/custom_app_bar/ui/customAppBar.dart';
import '../../../../core/widgets/custom_input_text_field.dart';
import '../../../../core/widgets/custom_more_horiz_scroll_page.dart';
import '../../../homescreen_documents_pdf/survey_pdf/provider/survey_pdf_provider.dart';
import '../../../homescreen_documents_pdf/survey_pdf/servey_pdf_share/servey_pdf_share.dart';
import '../../../homescreen_documents_pdf/survey_pdf/survey_edit_page/survey_edit_page.dart';
import '../../../homescreen_documents_pdf/survey_pdf/survey_pdf_screen/surveypdfwebviewscreen.dart';
import '../model/survey_report_download_model.dart';
import '../repo/survey_report_repogistory.dart';

class SurveyRepotsDownload extends StatefulWidget {
  const SurveyRepotsDownload({super.key});

  @override
  State<SurveyRepotsDownload> createState() => _SurveyRepotsDownloadState();
}

class _SurveyRepotsDownloadState extends State<SurveyRepotsDownload> {
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();

  final SurveyReportPdfRepository _repo = SurveyReportPdfRepository();

  List<Data> reportData = [];

  Future<void> _selectDate(
      BuildContext context, TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      controller.text = DateFormat('yyyy-MM-dd').format(picked);
    }
  }

  void _downloadReport() async {
    String startDate = startDateController.text.trim();
    String endDate = endDateController.text.trim();

    if (startDate.isEmpty || endDate.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select both start and end date')),
      );
      return;
    }

    try {
      final report = await _repo.getsurveyreportdataApi(startDate, endDate);
      setState(() {
        reportData = report.data ?? [];
      });
      print("Downloaded report: ${report.toJson()}");
    } catch (e) {
      print('Error downloading report: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to download report')),
      );
    }
  }
  bool isLoading = false;
  Widget _buildReportCard(Data item, int index) {
    final customer = item.formData?.customerDetails;

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
                        'SURVEY: ${index + 1}',
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
                      Text('${customer?.name ?? 'N/A'}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text('${customer?.moveFrom ?? 'N/A'}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text('${customer?.moveTo ?? 'N/A'}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
                SizedBox(height: 5,),
                Center(
                  child: Text('${customer?.date ?? 'N/A'}'),
                ),

                const SizedBox(height: 10),
                const Divider(height: 2, color: Colors.grey),
                const SizedBox(height: 10),
                Padding(
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
                      const SizedBox(width: 8),
                      Text('${customer?.phone ?? 'N/A'}'),
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
                  title: 'Survey',
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
                                  final success = await Provider.of<SurveyPdfProvider>(context, listen: false)
                                      .deleteSurvey(item.sId ?? '');
                                  print(item.sId);

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(success ? 'Survey deleted successfully' : 'Survey deleted successfully${item.sId}'),
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
                                        Text('Delete Survey', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12)),
                                        //Text('भुगतान हटाएं',style: TextStyle(fontSize: 12),),
                                        Text('सर्वे हटाएं',style: TextStyle(fontSize: 12),),

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
                                    // builder: (context) => SurveyPdfWebViewScreen(id: yourIdHere), // Replace with actual ID
                                    builder: (context) => SurveyPdfWebViewScreen(id: item.sId ?? ''),

                                  ),
                                );
                              },
                              child: Container(
                                padding: EdgeInsets.all(5),
                                margin: EdgeInsets.only(left: 4), // spacing between two containers
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
                              onTap: () {
                                PdfDownloadershare.downloadAndSharePdf(
                                  "http://167.71.232.245:8970/api/user/quotation/${item.sId}/pdf",
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
                                    Icon(Icons.edit, color: Colors.black),
                                    SizedBox(width: 5),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        //Text('Customer Signature',
                                        Text('Customer Sign..',
                                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                                          overflow: TextOverflow.ellipsis,  // show ...
                                          maxLines: 2,                      // single line only
                                          softWrap: true,
                                        ),
                                        Text('ग्राहक के हस्ताक्षर', style: TextStyle(fontSize: 12)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          /*Expanded(
                            child: InkWell(
                              onTap: () {
                                PdfDownloadershare.downloadAndSharePdf(
                                  "http://167.71.232.245:8970/api/user/survey/${item.sId}/pdf",
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
                                        Text('Share Survey Pdf',
                                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                                        Text('सर्वे पीडीएफ भेजें', style: TextStyle(fontSize: 12)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),*/
                          Expanded(
                            child: InkWell(
                              onTap: isLoading
                                  ? null
                                  : () async {
                                setState(() => isLoading = true);

                                final url =
                                    "http://167.71.232.245:8970/api/user/survey/${item.sId}/pdf";

                                await PdfDownloadershare.downloadAndSharePdf(url);

                                setState(() => isLoading = false);
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
                                          'Share Survey Pdf',
                                          style:
                                          TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                                        ),
                                        Text(
                                          'सर्वे पीडीएफ भेजें',
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
                                    builder: (context) => SurveyEditScreen(
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
                                          'Edit Survey',
                                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                                        ),
                                        Text(
                                          'सर्वे में संशोधन करे',
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),



                          // Second Container

                          Expanded(
                            child: InkWell(
                              onTap: () {
                                PdfDownloader.downloadAndOpenPdf(
                                  "http://167.71.232.245:8970/api/user/survey/${item.sId}/pdf",
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
                          )
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Survey Reports'),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Download',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
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
                    .map((entry) =>
                    _buildReportCard(entry.value, entry.key))
                    .toList(),
              )
                  : const Text('No data found. Please try different dates.',
                  style: TextStyle(color: Colors.grey)),
            ],
          ),
        ),
      ),
    );
  }
}
