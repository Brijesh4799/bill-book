import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/widgets/custom_app_bar/ui/customAppBar.dart';
import '../../../../core/widgets/custom_more_horiz_scroll_page.dart';
import '../../../../core/widgets/search_bar_pdf_screen.dart';
import '../../../homeScreen/surveyScreen/ui/survey_screen.dart';
import '../../quotation_pdf/quotation_pdf_download/quotation_pdf_download.dart';
import '../provider/survey_pdf_provider.dart';
import '../servey_pdf_share/servey_pdf_share.dart' hide PdfDownloader;
import '../survey_edit_page/survey_edit_page.dart';
import '../survey_pdf_screen/surveypdfwebviewscreen.dart';

class SurveyListPdf extends StatefulWidget {
  const SurveyListPdf({super.key});

  @override
  State<SurveyListPdf> createState() => _SurveyListPdfState();
}

class _SurveyListPdfState extends State<SurveyListPdf> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Survey List Pdf'),
      body: ListView(
        padding: const EdgeInsets.all(15.0),
        children: [
          SearchInputBox(),
          SizedBox(height: 10,),
          Consumer<SurveyPdfProvider>(
            builder: (context, provider, child) {
              final totalSurveys = provider.surveyList?.data?.length ?? 0;

              return Center(
                child: Text(
                  'Total Survey List : $totalSurveys',
                  style: const TextStyle(fontSize: 16),
                ),
              );
            },
          ),

          const SizedBox(height: 10),
          const SurveyCard(),

          const SizedBox(height: 100),
        ],
      ),
      bottomNavigationBar: const _BottomBar(),
    );
  }
}


class SurveyCard extends StatefulWidget {
  const SurveyCard({super.key});

  @override
  State<SurveyCard> createState() => _SurveyCardState();
}

class _SurveyCardState extends State<SurveyCard> {
  bool isLoading = false;
  @override
  void initState() {
    super.initState();

    // Fetch data after first build
    Future.microtask(() {
      Provider.of<SurveyPdfProvider>(context, listen: false).fetchSurveyListData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SurveyPdfProvider>(
      builder: (context, provider, child) {
        if (provider.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        final surveyList = provider.surveyList?.data;

        if (surveyList == null || surveyList.isEmpty) {
          return const Center(child: Text('No survey data found.'));
        }

        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: surveyList.length,
          itemBuilder: (context, index) {
            final item = surveyList[index];
            final customer = item.formData?.customerDetails;

            return Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.black, width: 1),
              ),
              child: Column(
                children: [
                  // Top Header
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
                        Text('${index + 1}', style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)),
                        const Spacer(),
                        Text('SURVEY:${index + 1}', style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),

                  const SizedBox(height: 10),

                  // Phone number row
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
                          child: const Icon(Icons.person, size: 20, color: Colors.black),
                        ),
                        const SizedBox(width: 8),
                        Text('${customer?.name ?? 'N/A'}', style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                        const Spacer(),
                        const Text('No.Of Items: 0.0', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),

                  const SizedBox(height: 10),
                  const Divider(height: 2, color: Colors.grey),
                  const SizedBox(height: 10),

                  // "From" info
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

                  // Bottom section
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

                  // Expansion with Delete Button
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

                           /* Expanded(
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
            );
          },
        );
      },
    );
  }

}

class _BottomBar extends StatelessWidget {
  const _BottomBar();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 6,
              spreadRadius: 0,
              offset: Offset(0, -2),
              color: Colors.black12,
            )
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: _BottomButton(
                text: 'Update Terms & Conditions',
                onTap: () {
                  // TODO: implement
                },
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: _BottomButton(
                text: 'Change Survey ',
                onTap: () {
                  // TODO: implement
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BottomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const _BottomButton({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF137DC7),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: onTap,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white, fontSize: 14),
        ),
      ),
    );
  }
}

