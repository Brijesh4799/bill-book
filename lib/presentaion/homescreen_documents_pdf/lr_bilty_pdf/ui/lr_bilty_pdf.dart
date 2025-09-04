import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/widgets/custom_app_bar/ui/customAppBar.dart';
import '../../../../core/widgets/custom_more_horiz_scroll_page.dart';
import '../../../../core/widgets/search_bar_pdf_screen.dart';
import '../../../homeScreen/LR-BilityScreen/ui/lr_blity_screen.dart';
import '../../quotation_pdf/quotation_pdf_download/quotation_pdf_download.dart';
import '../../survey_pdf/servey_pdf_share/servey_pdf_share.dart' hide PdfDownloader;
import '../lr_bilty_edit_screen/lr_bilty_edit_screen.dart';
import '../lr_bilty_pdf_screen/lr_bilty_pdf_screen.dart';
import '../provider/lr_bilty_pdf_provider.dart';
class LrBiltyPdf extends StatefulWidget {
  const LrBiltyPdf({super.key});

  @override
  State<LrBiltyPdf> createState() => _LrBiltyPdfState();
}

class _LrBiltyPdfState extends State<LrBiltyPdf> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'LrBilty Pdf'),
      body: ListView(
        padding: const EdgeInsets.all(15.0),
        children: [
          SearchInputBox(),
          SizedBox(height: 10,),
          Consumer<LrBiltyPdfProvider>(
            builder: (context, provider, child) {
              final totalSurveys = provider.lrbilty?.data?.length ?? 0;

              return Center(
                child: Text(
                  'Total LrBilty List : $totalSurveys',
                  style: const TextStyle(fontSize: 16),
                ),
              );
            },
          ),
          const SizedBox(height: 10),
          const LrBiltyCard(),
          const SizedBox(height: 100),
        ],
      ),
      bottomNavigationBar: const _BottomBar(),
    );
  }
}

class LrBiltyCard extends StatefulWidget {
  const LrBiltyCard({super.key});

  @override
  State<LrBiltyCard> createState() => _LrBiltyCardState();
}
class _LrBiltyCardState extends State<LrBiltyCard> {
  bool isLoading = false;
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      Provider.of<LrBiltyPdfProvider>(context, listen: false).fetchlrbiltyListData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return

      Consumer<LrBiltyPdfProvider>(
      builder: (context, provider, child) {
        if (provider.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        final lrbilty = provider.lrbilty?.data;

        if (lrbilty == null || lrbilty.isEmpty) {
          return const Center(child: Text('No packing data found.'));
        }

        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: lrbilty.length,
          itemBuilder: (context, index) {
            final item = lrbilty[index];
            final lrbiltydata = item.formData?.lrDetails;

            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                  ),
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
                          Text('${index + 1}', style: const TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.bold)),
                          const Spacer(),
                          Text('LR BILTY: ${index + 1}', style: const TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),

                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Row(
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
                              Text('${item.formData?.moveFrom?.consignorName ?? "N/A"}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                            ],
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey[300],
                                ),
                                padding: const EdgeInsets.all(6),
                                child:  Text('Gst.No:${item.formData?.moveFrom?.consignorgstNo ?? "N/A"}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                              ),

                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 10),
                    const Divider(height: 2, color: Colors.grey),
                    const SizedBox(height: 10),

                    // From and To Row
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child:

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

                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Container(
                            child: Text('${item.formData?.moveFrom?.consignorcity ?? "N/A"}',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                          ),
                          Spacer(),
                          Container(
                            child: Text('${item.formData?.moveTo?.consigneecity ?? "N/A"}',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                          ),
                        ],
                      ),
                    ),

                   /* SizedBox(height: 5,),
                    Container(
                      child: Text('Lr Details',style: TextStyle(color: Colors.grey),),
                    ),
                    SizedBox(height: 5,),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Container(
                            child: Text('${item.formData?.lrDetails?.lrNumber ?? "N/A"}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                          ),
                          Spacer(),
                          Container(
                            child: Text('${item.formData?.lrDetails?.lrDate ?? "N/A"}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5,),
                    Container(
                      child: Text('Truck Vehicle Details',style: TextStyle(color: Colors.grey),),
                    ),
                    SizedBox(height: 5,),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Container(
                            child: Text('${item.formData?.truckVehicleDetails?.truckVehicleNumber ?? "N/A"}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                          ),
                          Spacer(),
                          Container(
                            child: Text('${item.formData?.truckVehicleDetails?.truckVehicleMoveForm ?? "N/A"}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5,),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Container(
                            child: Text('${item.formData?.truckVehicleDetails?.truckVehicleMoveTo ?? "N/A"}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                          ),
                          Spacer(),
                          Container(
                            child: Text('${item.formData?.truckVehicleDetails?.truckVehicleDriverName ?? "N/A"}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5,),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Container(
                            child: Text('${item.formData?.truckVehicleDetails?.truckVehicleDriverPhoneNumber ?? "N/A"}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                          ),
                          Spacer(),
                          Container(
                            child: Text('${item.formData?.truckVehicleDetails?.truckVehicleDriverLicenceNumber ?? "N/A"}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5,),
                    Container(
                      child: Text('Move Form',style: TextStyle(color: Colors.grey),),
                    ),
                    SizedBox(height: 5,),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Container(
                            child: Text('${item.formData?.moveFrom?.consignoraddress ?? "N/A"}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                          ),
                          Spacer(),
                          Container(
                            child: Text('${item.formData?.moveFrom?.consignorcity ?? "N/A"}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5,),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Container(
                            child: Text('${item.formData?.moveFrom?.consignorstate ?? "N/A"}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                          ),
                          Spacer(),
                          Container(
                            child: Text('${item.formData?.moveFrom?.consignorpincode ?? "N/A"}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5,),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Container(
                            child: Text('${item.formData?.moveFrom?.consignorgstNo ?? "N/A"}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                          ),
                          Spacer(),
                          Container(
                            child: Text('${item.formData?.moveFrom?.consignorStateCode ?? "N/A"}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5,),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Container(
                            child: Text('${item.formData?.moveFrom?.consignorCountry ?? "N/A"}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                          ),
                          Spacer(),
                          Container(
                            child: Text('${item.formData?.moveFrom?.consignorAddress ?? "N/A"}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5,),
                    Container(
                      child: Text('Move To',style: TextStyle(color: Colors.grey),),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Container(
                            child: Text('${item.formData?.moveTo?.consigneeName ?? "N/A"}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                          ),
                          Spacer(),
                          Container(
                            child: Text('${item.formData?.moveTo?.consigneePhone ?? "N/A"}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5,),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Container(
                            child: Text('${item.formData?.moveTo?.consigneeCountry ?? "N/A"}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                          ),
                          Spacer(),
                          Container(
                            child: Text('${item.formData?.moveTo?.consigneeaddress ?? "N/A"}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5,),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Container(
                            child: Text('${item.formData?.moveTo?.consigneecity ?? "N/A"}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                          ),
                          Spacer(),
                          Container(
                            child: Text('${item.formData?.moveTo?.consigneestate ?? "N/A"}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5,),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Container(
                            child: Text('${item.formData?.moveTo?.consigneepincode ?? "N/A"}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                          ),
                          Spacer(),
                          Container(
                            child: Text('${item.formData?.moveTo?.consigneegstNo ?? "N/A"}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5,),
                    Container(
                      child: Text('Packing Details',style: TextStyle(color: Colors.grey),),
                    ),
                    SizedBox(height: 5,),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Container(
                            child: Text('${item.formData?.packageDetails?.packageType ?? "N/A"}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                          ),
                          Spacer(),
                          Container(
                            child: Text('${item.formData?.packageDetails?.packageNumber ?? "N/A"}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5,),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Container(
                            child: Text('${item.formData?.packageDetails?.packageDescription ?? "N/A"}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                          ),
                          Spacer(),
                          Container(
                            child: Text('${item.formData?.packageDetails?.packageActualWeight ?? "N/A"}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5,),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Container(
                            child: Text('${item.formData?.packageDetails?.packageChangeWeight ?? "N/A"}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                          ),
                          Spacer(),
                          Container(
                            child: Text('${item.formData?.packageDetails?.receivePackageCondition ?? "N/A"}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5,),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Container(
                            child: Text('${item.formData?.packageDetails?.packageRemark ?? "N/A"}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                          ),
                          Spacer(),
                          Container(
                            child: Text('${item.formData?.packageDetails?.allItemsInGoodCondition ?? "N/A"}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                          ),
                        ],
                      ),
                    ),
                   SizedBox(height: 5,),
                    Container(
                      child: Text('Payment Details',style: TextStyle(color: Colors.grey),),
                    ),
                    SizedBox(height: 5,),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Container(
                            child: Text('${item.formData?.paymentDetails?.frightToBeBilled ?? "N/A"}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                          ),
                          Spacer(),
                          Container(
                            child: Text('${item.formData?.paymentDetails?.frightToPaid ?? "N/A"}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5,),
                    Container(
                      child: Text('Payment Details',style: TextStyle(color: Colors.grey),),
                    ),
                    SizedBox(height: 5,),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Container(
                            child: Text('${item.formData?.paymentDetails?.freightToPay ?? "N/A"}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                          ),
                          Spacer(),
                          Container(
                            child: Text('${item.formData?.paymentDetails?.totalBaseFreight ?? "N/A"}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5,),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Container(
                            child: Text('${item.formData?.paymentDetails?.loadingCharge ?? "N/A"}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                          ),
                          Spacer(),
                          Container(
                            child: Text('${item.formData?.paymentDetails?.unloadingCharge ?? "N/A"}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5,),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Container(
                            child: Text('${item.formData?.paymentDetails?.sTCharge ?? "N/A"}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                          ),
                          Spacer(),
                          Container(
                            child: Text('${item.formData?.paymentDetails?.otherCharge ?? "N/A"}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5,),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Container(
                            child: Text('${item.formData?.paymentDetails?.lRCNCharge ?? "N/A"}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                          ),
                          Spacer(),
                          Container(
                            child: Text('${item.formData?.paymentDetails?.paymentGst ?? "N/A"}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5,),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Container(
                            child: Text('${item.formData?.paymentDetails?.paymentGstPaidBy ?? "N/A"}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                          ),

                        ],
                      ),
                    ),
                    SizedBox(height: 5,),
                    Container(
                      child: Text('Material Insurance',style: TextStyle(color: Colors.grey),),
                    ),
                    SizedBox(height: 5,),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Container(
                            child: Text('${item.formData?.materialInsurance?.materialInsurance ?? "N/A"}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                          ),
                          Spacer(),
                          Container(
                            child: Text('${item.formData?.materialInsurance?.insuranceCompany ?? "N/A"}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5,),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Container(
                            child: Text('${item.formData?.materialInsurance?.policyNumber ?? "N/A"}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                          ),
                          Spacer(),
                          Container(
                            child: Text('${item.formData?.materialInsurance?.insuranceDate ?? "N/A"}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5,),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Container(
                            child: Text('${item.formData?.materialInsurance?.insuranceAmount ?? "N/A"}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                          ),
                          Spacer(),
                          Container(
                            child: Text('${item.formData?.materialInsurance?.insuranceRisk ?? "N/A"}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5,),
                    Container(
                      child: Text('Demurrage Charge',style: TextStyle(color: Colors.grey),),
                    ),
                    SizedBox(height: 5,),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Container(
                            child: Text('${item.formData?.demurrageCharge?.demurrageChargeApplicable ?? "N/A"}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                          ),
                          Spacer(),
                          Container(
                            child: Text('${item.formData?.demurrageCharge?.chargePerDay ?? "N/A"}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5,),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Container(
                            child: Text('${item.formData?.demurrageCharge?.moreThanDays ?? "N/A"}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                          ),

                        ],
                      ),
                    ),
                    SizedBox(height: 5,),
                    Container(
                      child: Text('Invoice EWayBill',style: TextStyle(color: Colors.grey),),
                    ),
                    SizedBox(height: 5,),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Container(
                            child: Text('${item.formData?.invoiceEWayBill?.goodValue ?? "N/A"}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                          ),
                          Spacer(),
                          Container(
                            child: Text(item.formData?.invoiceEWayBill?.invoicebill ?? "N/A",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5,),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Container(
                            child: Text('${item.formData?.invoiceEWayBill?.invoiceDate ?? "N/A"}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                          ),
                          Spacer(),
                          Container(
                            child: Text('${item.formData?.invoiceEWayBill?.eWayBillNumber ?? "N/A"}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5,),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Container(
                            child: Text('${item.formData?.invoiceEWayBill?.eWayBillGenerateDate ?? "N/A"}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                          ),
                          Spacer(),
                          Container(
                            child: Text('${item.formData?.invoiceEWayBill?.eWayBillExpireDate ?? "N/A"}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5,),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Container(
                            child: Text('${item.formData?.invoiceEWayBill?.eWayBillExtendedPeriod ?? "N/A"}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                          ),

                        ],
                      ),
                    ),*/

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
                         // Text(' ${item.formData?.TruckVehicleDetails?.truckVehicleDriverPhoneNumber ?? "N/A"}'),
                          Text('${item.formData?.truckVehicleDetails?.truckVehicleDriverPhoneNumber ?? "N/A"}'),

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

                    /*const ExpansionTileWrapper(
                      title: 'Lr Bilty',
                      child: _SurveyDetails(),
                    ),*/
                    ExpansionTileWrapper(
                      title: 'Lr Bilty',
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
                                      final success = await Provider.of<LrBiltyPdfProvider>(context, listen: false)
                                          .deletepacking(item.sId ?? '');
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
                                            Text('Delete LrBilty', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12)),
                                            //Text('भुगतान हटाएं',style: TextStyle(fontSize: 12),),
                                            Text('लारी रसीद हटाएं',style: TextStyle(fontSize: 12),),

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
                                        builder: (context) => LrBiltyPdfWebViewScreen(id: item.sId ?? ''),

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
                                      "http://167.71.232.245:8970/api/user/lrbilty/${item.sId}/pdf",
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
                                            Text('Share LrBilty Pdf',
                                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                                            Text('लारी रसीद पीडीएफ भेजें', style: TextStyle(fontSize: 12)),
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
                                        "http://167.71.232.245:8970/api/user/lrbilty/${item.sId}/pdf";

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
                                              'Share LrBilty Pdf',
                                              style:
                                              TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                                            ),
                                            Text(
                                              'लारी रसीद पीडीएफ भेजें',
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
                                        builder: (context) => LrBlityEditScreen(
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
                                              'Edit LrBilty',
                                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                                            ),
                                            Text(
                                              'लारी रसीद में संशोधन',
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
                                      "http://167.71.232.245:8970/api/user/lrbilty/${item.sId}/pdf",
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
                text: 'Change LrBilty ',
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

