import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../core/widgets/custom_app_bar/ui/customAppBar.dart';
import '../../../../../core/widgets/custom_more_horiz_scroll_page.dart';
import '../../../../core/widgets/search_bar_pdf_screen.dart';
import '../../../homeScreen/paymentVoucherScreen/ui/payment_voucher_screen.dart';
import '../../quotation_pdf/quotation_pdf_download/quotation_pdf_download.dart';
import '../../survey_pdf/servey_pdf_share/servey_pdf_share.dart' hide PdfDownloader;
import '../payment_voucher_edit_screen/payment_voucher_edit_screen.dart';
import '../payment_voucher_pdf_screen/payment_voucher_pdf_screen.dart';
import '../provider/payment_pdf_provider.dart';

class PayementVoucherPdf extends StatefulWidget {
  const PayementVoucherPdf({super.key});

  @override
  State<PayementVoucherPdf> createState() => _PayementVoucherPdfState();
}

class _PayementVoucherPdfState extends State<PayementVoucherPdf> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Payement Voucher Pdf'),
      body: ListView(
        padding: const EdgeInsets.all(15.0),
        children: [
          SearchInputBox(),
          SizedBox(height: 10,),
          Consumer<PaymentPdfProvider>(
            builder: (context, provider, child) {
              final totalSurveys = provider.paymentvoucher?.data?.length ?? 0;

              return Center(
                child: Text(
                  'Total Payment: $totalSurveys',
                  style: const TextStyle(fontSize: 16),
                ),
              );
            },
          ),
          const SizedBox(height: 10),
          const PaymentCard(),
          const SizedBox(height: 100),
        ],
      ),
      bottomNavigationBar: const _BottomBar(),
    );
  }
}
class PaymentCard extends StatefulWidget {
  const PaymentCard({super.key});

  @override
  State<PaymentCard> createState() => _PaymentCardState();
}

class _PaymentCardState extends State<PaymentCard> {
  bool isLoading = false;
  @override
  void initState() {
    super.initState();

    // Fetch data after first build
    Future.microtask(() {
      Provider.of<PaymentPdfProvider>(context, listen: false).fetchpaymentData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PaymentPdfProvider>(
      builder: (context, provider, child) {
        if (provider.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        final paymentvoucher = provider.paymentvoucher?.data;

        if (paymentvoucher == null || paymentvoucher.isEmpty) {
          return const Center(child: Text('No survey data found.'));
        }

        return
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: paymentvoucher.length,
            itemBuilder: (context, index) {
              final item = paymentvoucher[index];



              return Container(
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.black, width: 1),
                ),
                child:
                Column(
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
                          Text('${index + 1}', style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 14)),
                          const Spacer(),
                          Text('PAYMENT:${index + 1}', style: const TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.bold)),
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
                          // Text('${customer?.name ?? 'N/A'}'),
                          Text('${item.formData?.receiverName ?? "N/A"}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
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

                    // "From" info
                   /* Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child:  Text('From',style: TextStyle(color: Colors.grey),)
                          //Text('From: ${item.formData?.moveFrom ?? "N/A"}'),
                        ),
                        Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child:Text('To',style: TextStyle(color: Colors.grey),)
                        //  Text('To: ${item.formData?.preInvoiceDetails?.moveto ?? "N/A"}'),
                        ),
                      ],
                    ),*/
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
                            child:  Text('${item.formData?.voucherNumber ?? "N/A"}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),)
                        ),
                        Spacer(),
                        Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child:Text('${item.formData?.voucherDate ?? "N/A"}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),)

                        ),
                      ],
                    ),
                    /*SizedBox(height: 5,),
                    Row(
                      children: [
                        Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child:  Text('${item.formData?.receiverName ?? "N/A"}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),)
                        ),
                        Spacer(),
                        Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child:Text('${item.formData?.receiverPhone ?? "N/A"}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),)

                        ),
                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child:  Text('${item.formData?.paymentType ?? "N/A"}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),)
                        ),
                        Spacer(),
                        Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child:Text('${item.formData?.voucherAmount ?? "N/A"}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),)
                        ),
                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child:  Text('${item.formData?.paymentMode ?? "N/A"}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),)
                        ),
                        Spacer(),
                        Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child:Text('${item.formData?.number ?? "N/A"}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),)
                        ),
                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child:  Text('${item.formData?.payFor ?? "N/A"}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),)
                        ),
                      ],
                    ),*/

                    const SizedBox(height: 10),
                    const Divider(height: 2, color: Colors.grey),
                    const SizedBox(height: 10),

                    // Bottom section
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
                          Text('${item.formData?.receiverPhone ?? "N/A"}'),
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
                      title: 'Payment Voucher',
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
                                      final success = await Provider.of<PaymentPdfProvider>(context, listen: false)
                                          .deletepayment(item.sId ?? '');
                                      print(item.sId);

                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text(success ? 'Payment deleted successfully' : 'Payment deleted successfully${item.sId}'),
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
                                            Text('Delete Payment', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12)),
                                            //Text('भुगतान हटाएं',style: TextStyle(fontSize: 12),),
                                            Text('भुगतान हटाएं',style: TextStyle(fontSize: 12),),

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
                                        builder: (context) => PaymentVoucherPdfWebViewScreen(id: item.sId ?? ''),

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
                              // First Container
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
                                      "http://167.71.232.245:8970/api/user/paymentVoucher/${item.sId}/pdf",
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
                                            Text('Share Payment',
                                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                                            Text('भुगतान पीडीएफ भेजें', style: TextStyle(fontSize: 12)),
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
                                        "http://167.71.232.245:8970/api/user/paymentVoucher/${item.sId}/pdf";

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
                                              'Share Payment',
                                              style:
                                              TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                                            ),
                                            Text(
                                              'भुगतान पीडीएफ भेजें',
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
                                        builder: (context) => PayementVoucherEditScreen(
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
                                              'Edit Paymet',
                                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                                            ),
                                            Text(
                                              'भुगतान संशोधन करे',
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
                                  onTap: () {
                                    PdfDownloader.downloadAndOpenPdf(
                                      "http://167.71.232.245:8970/api/user/paymentVoucher/${item.sId}/pdf",
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
                text: 'Change Payment',
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

