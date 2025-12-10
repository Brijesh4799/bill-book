import 'package:BillBook/presentaion/homescreen_documents_pdf/quotation_pdf/subscription_pdf/subscription_pdf_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import '../../../../../core/widgets/custom_app_bar/ui/customAppBar.dart';
import '../../../../../core/widgets/custom_more_horiz_scroll_page.dart';
import '../../../../core/widgets/buttton/commanDeleteButton.dart';
import '../../../../core/widgets/customRefresher.dart';
import '../../../../core/widgets/search_bar_pdf_screen.dart';
import '../../survey_pdf/servey_pdf_share/servey_pdf_share.dart' hide PdfDownloader;
import '../provider/quotation_pdf_provider.dart';
import '../quotation_edit_page/quotation_edit_screen.dart';
import '../quotation_webview_pdf/loding_page.dart';
import '../quotation_webview_pdf/quotation_webview_pdf.dart';
import '../../quotation_pdf/quotation_pdf_download/quotation_pdf_download.dart';
class QuotationListPdf extends StatefulWidget {
  const QuotationListPdf({super.key});

  @override
  State<QuotationListPdf> createState() => _QuotationListPdfState();
}

class _QuotationListPdfState extends State<QuotationListPdf> {
  bool isLoading = false;
  ScrollController _scrollController=ScrollController();
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<QuatationPdfProvider>(context, listen: false).fetchQuatationListData();
    });

    _scrollController.addListener(() {
      final provider = Provider.of<QuatationPdfProvider>(context, listen: false);

      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent &&
          !provider.loading &&
          !provider.isLoadMoreRunning &&
          provider.hasNextPage) {
        provider.fetchQuatationListData(isLoadMore: true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<QuatationPdfProvider>(
        builder: (context, provider, child){
          final totalquatation = provider.quatationList?.data?.length ?? 0;
          return Scaffold(
            appBar: const CustomAppBar(title: 'Quotation List Pdf'),
            body: CustomPageRefresher(
                onRefresh: () async{
                  await provider.fetchQuatationListData();
                },child: SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height*0.13,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        SizedBox(height: 10,),
                        SearchInputBox(),
                        SizedBox(height: 10,),
                        Center(
                          child: Text(
                            'Total Quotation List : $totalquatation',
                            style: const TextStyle(fontSize: 16),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.87,
                    width: MediaQuery.of(context).size.width,
                    child: Builder(
                        builder: (context){
                          if (provider.isLoading) {
                            return const Center(child: CircularProgressIndicator());
                          }
                          final quatationList = provider.quatationList?.data;
                          if (quatationList == null || quatationList.isEmpty) {
                            return const Center(child: Text('No Quotation data found.'));
                          }
                          return
                            ListView.builder(
                              controller: _scrollController,
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              itemCount: quatationList.length,
                              itemBuilder: (context, index) {

                                final item = quatationList[index];
                                final customer = item.formData?.quotationDetails;
                                final movedata = item.formData?.moveFrom;
                                final movetodata = item.formData?.moveTo;
                                final payment = item.formData?.paymentDetails;
                                return Container(
                                  margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
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
                                        child:
                                        Column(
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
                                                  Text('${index + 1}', style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
                                                  const Spacer(),
                                                  Text('QUOTATION:${index + 1}', style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
                                                ],
                                              ),
                                            ),
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
                                                    child: const Icon(Icons.person, size: 20, color: Colors.black),
                                                  ),
                                                  const SizedBox(width: 8),
                                                  Text('${customer?.companynameofparty ?? 'N/A'}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
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
                                                      Text('${payment?.freightCharge ?? 'N/A'}'),
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
                                                  child: Text('${movedata?.city ?? 'N/A'}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                                                ),
                                                Spacer(),
                                                Container(
                                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                                  child: Text('${movetodata?.city ?? 'N/A'}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 5,),
                                            Center(
                                              child: Text('${customer?.packingDate ?? 'N/A'}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
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
                                                  Text('${item.formData?.quotationDetails?.phone ?? 'N/A'}'),
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
                                                                  content: Text(success ? ' deleted successfully' : ' deleted successfully${item.sId}'),
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
                                                      // CommonDeleteButton(
                                                      //   title: 'Delete Quotation',
                                                      //   subTitle: 'कोटेशन हटाएं',
                                                      //   onDelete: () {
                                                      //     return Provider.of<QuatationPdfProvider>(
                                                      //       context,
                                                      //       listen: false,
                                                      //     ).deletequotation(item.sId ?? '');
                                                      //   },
                                                      // ),

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
                                                              final provider = Provider.of<QuatationPdfProvider>(context, listen: false);
                                                              await provider.fetchQuotationSignature(item.sId!, "quotation");
                                                              Navigator.of(context).pop();
                                                              if (provider.signatureLink != null) {
                                                                final link = provider.signatureLink!;
                                                                await Share.share(
                                                                  "Here is the customer signature PDF link:\n$link",
                                                                  subject: "Customer Signature PDF",
                                                                );
                                                              } else {
                                                                ScaffoldMessenger.of(context).showSnackBar(
                                                                  SnackBar(content: Text("Signature link is not available.")),
                                                                );
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
                                                              try {
                                                                await PdfDownloadershare.downloadAndSharePdf(item.sId!);
                                                              } catch (e) {
                                                                print(" Error while sharing PDF: $e");
                                                              } finally {
                                                                if (Navigator.canPop(context)) {
                                                                  Navigator.pop(context);
                                                                }
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
                                                              try {
                                                                await PdfDownloader.downloadAndOpenPdf(context, item.sId!);
                                                              } catch (e) {
                                                                print(" Error downloading PDF: $e");
                                                              } finally {
                                                                if (Navigator.canPop(context)) {
                                                                  Navigator.pop(context);
                                                                }
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
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                        }
                    )
                  ),
                ],
              ),
            ),
            )


          );
        }
    );

  }
}
