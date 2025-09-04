import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../core/widgets/custom_app_bar/ui/customAppBar.dart';
import '../../../../../core/widgets/custom_more_horiz_scroll_page.dart';
import '../../../../core/widgets/search_bar_pdf_screen.dart';
import '../../survey_pdf/servey_pdf_share/servey_pdf_share.dart' hide PdfDownloader;
import '../provider/quotation_pdf_provider.dart';
import '../quotation_edit_page/quotation_edit_screen.dart';
import '../quotation_webview_pdf/quotation_webview_pdf.dart';
import '../../quotation_pdf/quotation_pdf_download/quotation_pdf_download.dart';
class QuotationListPdf extends StatefulWidget {
  const QuotationListPdf({super.key});
  @override
  State<QuotationListPdf> createState() => _QuotationListPdfState();
}
class _QuotationListPdfState extends State<QuotationListPdf> {





  @override
  void initState() {

    super.initState();
    Provider.of<QuatationPdfProvider>(context,listen: false).fetchQuatationListData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Quotation List Pdf'),
      body: ListView(
        padding: const EdgeInsets.all(15.0),
        children: [
          SearchInputBox(),
          SizedBox(height: 10,),
          Consumer<QuatationPdfProvider>(
            builder: (context, provider, child) {
              final totalquatation = provider.quatationList?.data?.length ?? 0;

              return Center(
                child: Text(
                  'Total Quotation List : $totalquatation',
                  style: const TextStyle(fontSize: 16),
                ),
              );
            },
          ),
          const SizedBox(height: 10),
          const QuotationCard(),
          const SizedBox(height: 100),
        ],
      ),
      bottomNavigationBar: const _BottomBar(),
    );
  }
}
class QuotationCard extends StatefulWidget {
  const QuotationCard({super.key});

  @override
  State<QuotationCard> createState() => _QuotationCardState();
}

class _QuotationCardState extends State<QuotationCard> {
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      Provider.of<QuatationPdfProvider>(context, listen: false).fetchQuatationListData();
    });
  }



  @override
  Widget build(BuildContext context) {
    return Consumer<QuatationPdfProvider>(
      builder: (context, provider, child) {
        if (provider.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        final quatationList = provider.quatationList?.data;

        if (quatationList == null || quatationList.isEmpty) {
          return const Center(child: Text('No Quotation data found.'));
        }
        return

          Column(
          children: [
            const SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: quatationList.length,
              itemBuilder: (context, index) {
                final item = quatationList[index];
                final customer = item.formData?.quotationDetails;
                final movedata = item.formData?.moveFrom;
                final movetodata = item.formData?.moveTo;
                final payment = item.formData?.paymentDetails;
                final insurance = item.formData?.insurance;
                final vehicle = item.formData?.vehicleInsurance;


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
                          Text('${customer?.companyName ?? 'N/A'}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
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
                   /* SizedBox(height: 5,),
                    Text('quotationDetails',style: TextStyle(color: Colors.grey),),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text('${customer?.quotationNumber ?? 'N/A'}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                        ),
                        Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text('${customer?.movingType ?? 'N/A'}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                        ),
                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text('${customer?.companyName ?? 'N/A'}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                        ),
                        Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text('${customer?.packingDate ?? 'N/A'}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                        ),
                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text('${customer?.companynameofparty ?? 'N/A'}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                        ),
                        Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text('${customer?.companygstno ?? 'N/A'}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                        ),
                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text('${customer?.partyname ?? 'N/A'}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                        ),
                        Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text('${customer?.email ?? 'N/A'}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                        ),
                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text('${customer?.qtdate ?? 'N/A'}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                        ),
                        Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text('${customer?.shiptdate ?? 'N/A'}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                        ),

                      ],
                    ),
                    SizedBox(height: 5,),
                    Text('MoveFrom',style: TextStyle(color: Colors.grey),),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text('${movedata?.state ?? 'N/A'}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                        ),
                        Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text('${movedata?.city ?? 'N/A'}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                        ),

                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text('${movedata?.isLiftAvailable ?? 'N/A'}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                        ),
                        Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text('${movedata?.fromcountry ?? 'N/A'}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                        ),
                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text('${movedata?.fromstate ?? 'N/A'}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                        ),
                        Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text('${movedata?.fromcity ?? 'N/A'}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                        ),
                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text('${movedata?.frompincode ?? 'N/A'}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                        ),
                        Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text('${movedata?.fromaddress ?? 'N/A'}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                        ),
                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text('${movedata?.fromfloor ?? 'N/A'}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                        ),
                        Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text('${movedata?.fromisLiftAvailable ?? 'N/A'}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                        ),
                      ],
                    ),
                    SizedBox(height: 5,),
                    Text('MoveTo',style: TextStyle(color: Colors.grey),),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text('${movetodata?.state ?? 'N/A'}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                        ),
                        Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text('${movetodata?.city ?? 'N/A'}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                        ),
                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text('${movetodata?.isLiftAvailable ?? 'N/A'}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                        ),
                        Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text('${movetodata?.movecountry ?? 'N/A'}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                        ),
                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text('${movetodata?.movestate ?? 'N/A'}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                        ),
                        Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text('${movetodata?.movecity ?? 'N/A'}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                        ),
                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text('${movetodata?.movepincode ?? 'N/A'}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                        ),
                        Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text('${movetodata?.moveaddress ?? 'N/A'}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                        ),
                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text('${movetodata?.movefloore ?? 'N/A'}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                        ),
                        Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text('${movetodata?.moveisLiftAvailable ?? 'N/A'}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                        ),
                      ],
                    ),
                    SizedBox(height: 5,),
                    Text('PaymentDetails',style: TextStyle(color: Colors.grey),),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text('${payment?.freightCharge ?? 'N/A'}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                        ),
                        Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text('${payment?.advancePaid ?? 'N/A'}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                        ),
                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text('${payment?.gstPercent ?? 'N/A'}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                        ),
                        Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text('${payment?.pakingcharge ?? 'N/A'}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                        ),
                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text('${payment?.unpakingcharge ?? 'N/A'}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                        ),
                        Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text('${payment?.lodingcharge ?? 'N/A'}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                        ),
                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text('${payment?.unloadingcharge ?? 'N/A'}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                        ),
                        Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text('${payment?.packingmaterialcharge ?? 'N/A'}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                        ),
                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text('${payment?.storgecharge ?? 'N/A'}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                        ),
                        Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text('${payment?.carbiketpt ?? 'N/A'}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                        ),
                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text('${payment?.miscellaneouscharge ?? 'N/A'}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                        ),
                        Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text('${payment?.othercharge ?? 'N/A'}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                        ),
                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text('${payment?.stcharge ?? 'N/A'}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                        ),
                        Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text('${payment?.octriogreentax ?? 'N/A'}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                        ),
                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text('${payment?.surcharge ?? 'N/A'}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                        ),
                        Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text('${payment?.gstshowhide ?? 'N/A'}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                        ),
                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text('${payment?.gsttype ?? 'N/A'}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                        ),
                        Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text('${payment?.remark ?? 'N/A'}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                        ),
                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text('${payment?.discount ?? 'N/A'}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                        ),
                        Spacer(),

                      ],
                    ),
                    SizedBox(height: 5,),
                    Text('Insurance',style: TextStyle(color: Colors.grey),),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text('${insurance?.type ?? 'N/A'}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                        ),
                        Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text('${insurance?.percent ?? 'N/A'}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                        ),
                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text('${insurance?.gst ?? 'N/A'}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                        ),
                        Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text('${insurance?.declarationvalue  ?? 'N/A'}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                        ),
                      ],
                    ),
                    SizedBox(height: 5,),
                    Text('VehicleInsurance',style: TextStyle(color: Colors.grey),),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text('${vehicle?.type ?? 'N/A'}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                        ),
                        Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text('${vehicle?.insurancecharge ?? 'N/A'}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                        ),
                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text('${vehicle?.gst ?? 'N/A'}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                        ),
                        Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text('${vehicle?.declarationvalue ?? 'N/A'}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                        ),
                      ],
                    ),
*/

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
                          Text('${customer?.partyname ?? 'N/A'}'),
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
                                        // builder: (context) => SurveyPdfWebViewScreen(id: yourIdHere), // Replace with actual ID
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
                                  onTap: () {
                                    PdfDownloadershare.downloadAndSharePdf(
                                      "http://167.71.232.245:8970/api/user/quotation/${item.sId}/pdf",
                                      //"http://192.168.1.34:5050/api/user/quotation/${item.sId}/pdf",
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


                Expanded(
                child: InkWell(
                onTap: isLoading
                ? null
                    : () async {
                setState(() => isLoading = true);

                final url =
                "http://167.71.232.245:8970/api/user/quotation/${item.sId}/pdf";
                //"http://192.168.1.34:5050/api/user/quotation/${item.sId}/pdf";

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
                'Share Quotation',
                style:
                TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
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
                                  onTap: () {
                                    PdfDownloader.downloadAndOpenPdf(
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
                ),
                    ],
                  ),
                );
              },
            ),
          ],
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
                },
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: _BottomButton(
                text: 'Change Quotation Layout/Design',
                onTap: () {
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