/*
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/widgets/custom_Textbutton.dart';
import '../../../../core/widgets/custom_app_bar/ui/customAppBar.dart';
import '../../../../core/widgets/custom_input_text_field.dart';

import '../model/lr_bilty_report_model.dart' as BiltyModel;
import '../repo/lr_bilty_report_repogitory.dart';

class LrBiltyRepotsDownload extends StatefulWidget {
  const LrBiltyRepotsDownload({super.key});

  @override
  State<LrBiltyRepotsDownload> createState() => _LrBiltyRepotsDownloadState();
}

class _LrBiltyRepotsDownloadState extends State<LrBiltyRepotsDownload> {
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();

  final LrBiltyReportPdfRepository _repo = LrBiltyReportPdfRepository();

  List<BiltyModel.Data> reportData = [];

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
        const SnackBar(content: Text('Please select both start and end date')),
      );
      return;
    }

    try {
      final report = await _repo.getlrbiltyreportdataApi(startDate, endDate);
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

  Widget _buildReportCard(BiltyModel.Data item) {
    final lrDetails = item.formData?.lrDetails;
    final truckVehicleDetails = item.formData?.truckVehicleDetails;
    final moveFrom = item.formData?.moveFrom;
    final moveTo = item.formData?.moveTo;
    final packageDetails = item.formData?.packageDetails;
    final paymentDetails = item.formData?.paymentDetails;
    final materialInsurance = item.formData?.materialInsurance;
    final demurrageCharge = item.formData?.demurrageCharge;
    final invoiceEWayBill = item.formData?.invoiceEWayBill;

    return
     */
/* Card(

      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('LR Number: ${lrDetails?.lrNumber ?? 'N/A'}'),
            Text('LR Date: ${lrDetails?.lrDate ?? 'N/A'}'),
            const SizedBox(height: 8),
            Center(child: Text('TruckVehicleDetails',style: TextStyle(fontWeight: FontWeight.bold),)),
            Text('truckVehicleNumber: ${truckVehicleDetails?.truckVehicleNumber ?? 'N/A'}'),
            Text('truckVehicleMoveForm: ${truckVehicleDetails?.truckVehicleMoveForm ?? 'N/A'}'),
            Text('truckVehicleMoveTo: ${truckVehicleDetails?.truckVehicleMoveTo ?? 'N/A'}'),
            Text('truckVehicleDriverName: ${truckVehicleDetails?.truckVehicleDriverName ?? 'N/A'}'),
            Text('truckVehicleDriverPhoneNumber: ${truckVehicleDetails?.truckVehicleDriverPhoneNumber ?? 'N/A'}'),
            Text('truckVehicleDriverLicenceNumber: ${truckVehicleDetails?.truckVehicleDriverLicenceNumber ?? 'N/A'}'),
            const SizedBox(height: 8,),
            Center(child: Text('MoveFrom',style: TextStyle(fontWeight: FontWeight.bold),)),
            Text('consignorName: ${moveFrom?.consignorName ?? 'N/A'}'),
            Text('consignorPhone: ${moveFrom?.consignorPhone ?? 'N/A'}'),
            Text('consignoraddress: ${moveFrom?.consignoraddress ?? 'N/A'}'),
            Text('consignorcity: ${moveFrom?.consignorcity ?? 'N/A'}'),
            Text('consignorstate: ${moveFrom?.consignorstate ?? 'N/A'}'),
            Text('consignorpincode: ${moveFrom?.consignorpincode ?? 'N/A'}'),
            Text('consignorgstNo: ${moveFrom?.consignorgstNo ?? 'N/A'}'),
            Text('consignorStateCode: ${moveFrom?.consignorStateCode ?? 'N/A'}'),
            Text('consignorCountry: ${moveFrom?.consignorCountry ?? 'N/A'}'),
            Text('consignorAddress: ${moveFrom?.consignorAddress ?? 'N/A'}'),
            const SizedBox(height: 8,),
            Center(child: Text('MoveTo',style: TextStyle(fontWeight: FontWeight.bold),)),
            Text('consigneeName: ${moveTo?.consigneeName ?? 'N/A'}'),
            Text('consigneePhone: ${moveTo?.consigneePhone ?? 'N/A'}'),
            Text('consigneeCountry: ${moveTo?.consigneeCountry ?? 'N/A'}'),
            Text('consigneeaddress: ${moveTo?.consigneeaddress ?? 'N/A'}'),
            Text('consigneecity: ${moveTo?.consigneecity ?? 'N/A'}'),
            Text('consigneestate: ${moveTo?.consigneestate ?? 'N/A'}'),
            Text('consigneepincode: ${moveTo?.consigneepincode ?? 'N/A'}'),
            Text('consigneegstNo: ${moveTo?.consigneegstNo ?? 'N/A'}'),
            const SizedBox(height: 8,),
            Center(child: Text('PackageDetails',style: TextStyle(fontWeight: FontWeight.bold),)),
            Text('packageType: ${packageDetails?.packageType ?? 'N/A'}'),
            Text('packageNumber: ${packageDetails?.packageNumber ?? 'N/A'}'),
            Text('packageDescription: ${packageDetails?.packageDescription ?? 'N/A'}'),
            Text('packageActualWeight: ${packageDetails?.packageActualWeight ?? 'N/A'}'),
            Text('packageChangeWeight: ${packageDetails?.packageChangeWeight ?? 'N/A'}'),
            Text('receivePackageCondition: ${packageDetails?.receivePackageCondition ?? 'N/A'}'),
            Text('packageRemark: ${packageDetails?.packageRemark ?? 'N/A'}'),
            Text('allItemsInGoodCondition: ${packageDetails?.allItemsInGoodCondition ?? 'N/A'}'),
            Text('totalWeight: ${packageDetails?.totalWeight ?? 'N/A'}'),
            const SizedBox(height: 8,),
            Center(child: Text('PaymentDetails',style: TextStyle(fontWeight: FontWeight.bold),)),
            Text('frightToBeBilled: ${paymentDetails?.frightToBeBilled ?? 'N/A'}'),
            Text('frightToPaid: ${paymentDetails?.frightToPaid ?? 'N/A'}'),
            Text('freightToPay: ${paymentDetails?.freightToPay ?? 'N/A'}'),
            Text('totalBaseFreight: ${paymentDetails?.totalBaseFreight ?? 'N/A'}'),
            Text('loadingCharge: ${paymentDetails?.loadingCharge ?? 'N/A'}'),
            Text('unloadingCharge: ${paymentDetails?.unloadingCharge ?? 'N/A'}'),
            Text('sTCharge: ${paymentDetails?.sTCharge ?? 'N/A'}'),
            Text('otherCharge: ${paymentDetails?.otherCharge ?? 'N/A'}'),
            Text('lRCNCharge: ${paymentDetails?.lRCNCharge ?? 'N/A'}'),
            Text('paymentGst: ${paymentDetails?.paymentGst ?? 'N/A'}'),
            Text('paymentGstPaidBy: ${paymentDetails?.paymentGstPaidBy ?? 'N/A'}'),
            Text('presentToBeBilled: ${paymentDetails?.presentToBeBilled ?? 'N/A'}'),
            Text('insurance: ${paymentDetails?.insurance ?? 'N/A'}'),
            Text('insuranceAmount: ${paymentDetails?.insuranceAmount ?? 'N/A'}'),
            const SizedBox(height: 8,),
            Center(child: Text('MaterialInsurance',style: TextStyle(fontWeight: FontWeight.bold),)),
            Text('materialInsurance: ${materialInsurance?.materialInsurance ?? 'N/A'}'),
            Text('insuranceCompany: ${materialInsurance?.insuranceCompany ?? 'N/A'}'),
            Text('policyNumber: ${materialInsurance?.policyNumber ?? 'N/A'}'),
            Text('insuranceDate: ${materialInsurance?.insuranceDate ?? 'N/A'}'),
            Text('insuranceAmount: ${materialInsurance?.insuranceAmount ?? 'N/A'}'),
            Text('insuranceRisk: ${materialInsurance?.insuranceRisk ?? 'N/A'}'),
            const SizedBox(height: 8,),
            Center(child: Text('DemurrageCharge',style: TextStyle(fontWeight: FontWeight.bold),)),
            Text('demurrageChargeApplicable: ${demurrageCharge?.demurrageChargeApplicable ?? 'N/A'}'),
            Text('chargePerDay: ${demurrageCharge?.chargePerDay ?? 'N/A'}'),
            Text('moreThanDays: ${demurrageCharge?.moreThanDays ?? 'N/A'}'),
            const SizedBox(height: 8,),
            Center(child: Text('InvoiceEWayBill',style: TextStyle(fontWeight: FontWeight.bold),)),
            Text('goodValue: ${invoiceEWayBill?.goodValue ?? 'N/A'}'),
            Text('invoicebill: ${invoiceEWayBill?.invoicebill ?? 'N/A'}'),
            Text('invoiceDate: ${invoiceEWayBill?.invoiceDate ?? 'N/A'}'),
            Text('eWayBillNumber: ${invoiceEWayBill?.eWayBillNumber ?? 'N/A'}'),
            Text('eWayBillGenerateDate: ${invoiceEWayBill?.eWayBillGenerateDate ?? 'N/A'}'),
            Text('eWayBillExpireDate: ${invoiceEWayBill?.eWayBillExpireDate ?? 'N/A'}'),
            Text('eWayBillExtendedPeriod: ${invoiceEWayBill?.eWayBillExtendedPeriod ?? 'N/A'}'),

          ],
        ),
      ),
    );*//*

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
                Text('${index + 1}', style: const TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.bold)),
                const Spacer(),
                Text('LR BILTY: ${index + 1}', style: const TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.bold)),
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
      appBar: const CustomAppBar(title: 'Lr Bilty Reports'),
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
                children: reportData.map(_buildReportCard).toList(),
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

*/


import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../core/widgets/custom_Textbutton.dart';
import '../../../../core/widgets/custom_app_bar/ui/customAppBar.dart';
import '../../../../core/widgets/custom_input_text_field.dart';

import '../../../../core/widgets/custom_more_horiz_scroll_page.dart';
import '../../../homescreen_documents_pdf/lr_bilty_pdf/lr_bilty_edit_screen/lr_bilty_edit_screen.dart';
import '../../../homescreen_documents_pdf/lr_bilty_pdf/lr_bilty_pdf_screen/lr_bilty_pdf_screen.dart';
import '../../../homescreen_documents_pdf/lr_bilty_pdf/provider/lr_bilty_pdf_provider.dart';
import '../../../homescreen_documents_pdf/survey_pdf/servey_pdf_share/servey_pdf_share.dart';
import '../model/lr_bilty_report_model.dart' as BiltyModel;
import '../repo/lr_bilty_report_repogitory.dart';

class LrBiltyRepotsDownload extends StatefulWidget {
  const LrBiltyRepotsDownload({super.key});

  @override
  State<LrBiltyRepotsDownload> createState() => _LrBiltyRepotsDownloadState();
}

class _LrBiltyRepotsDownloadState extends State<LrBiltyRepotsDownload> {
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();

  final LrBiltyReportPdfRepository _repo = LrBiltyReportPdfRepository();

  List<BiltyModel.Data> reportData = [];

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
        const SnackBar(content: Text('Please select both start and end date')),
      );
      return;
    }

    try {
      final report = await _repo.getlrbiltyreportdataApi(startDate, endDate);
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
  // Updated to include index
  Widget _buildReportCard(BiltyModel.Data item, int index) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
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
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Text(
                  'LR BILTY: ${index + 1}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'LR Bilty Reports'),
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
