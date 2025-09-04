/*import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/widgets/custom_app_bar/ui/customAppBar.dart';
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

  Future<void> _pickDate(TextEditingController controller) async {
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

  Widget _buildReportCard(Data data) {
    final invoice = data.formData?.invoiceDetails;
    final billing = data.formData?.billingDetails;
    final payment = data.formData?.paymentDetails;

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Invoice No: ${invoice?.invoiceNumber ?? 'N/A'}", style: TextStyle(fontWeight: FontWeight.bold)),
            Text("Company: ${invoice?.invoiCecompanyName ?? 'N/A'}"),
            Text("Date: ${invoice?.invoiceDate ?? 'N/A'}"),
            Text("Customer: ${billing?.customerName ?? 'N/A'}"),
            Text("Phone: ${billing?.customerPhone ?? 'N/A'}"),
            Text("Total Amount: ₹${payment?.totalAmount ?? '0'}"),
          ],
        ),
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
      appBar: CustomAppBar(title: 'Bill Reports'),
      body:
      Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: startDateController,
                      readOnly: true,
                      decoration: const InputDecoration(
                        labelText: 'Start Date',
                        prefixIcon: Icon(Icons.calendar_today),
                        border: OutlineInputBorder(),
                      ),
                      onTap: () => _pickDate(startDateController),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextFormField(
                      controller: endDateController,
                      readOnly: true,
                      decoration: const InputDecoration(
                        labelText: 'End Date',
                        prefixIcon: Icon(Icons.calendar_today),
                        border: OutlineInputBorder(),
                      ),
                      onTap: () => _pickDate(endDateController),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              ElevatedButton.icon(
                onPressed: _getBillReport,
                icon: const Icon(Icons.search),
                label: const Text('Filter Report'),
              ),
            ],
          ),
        ),
        if (isLoading)
          const Expanded(child: Center(child: CircularProgressIndicator()))
        else if (reportData.isEmpty)
          const Expanded(child: Center(child: Text('No data found')))
        else
          Expanded(
            child: ListView.builder(
              itemCount: reportData.length,
              itemBuilder: (context, index) => _buildReportCard(reportData[index]),
            ),
          ),
      ],
    ),
    );
  }
}*//*




import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/widgets/custom_Textbutton.dart';
import '../../../../core/widgets/custom_app_bar/ui/customAppBar.dart';
import '../../../../core/widgets/custom_input_text_field.dart';
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

  Widget _buildReportCard(Data data) {
    final invoice = data.formData?.invoiceDetails;
    final billing = data.formData?.billingDetails;
    final consignor = data.formData?.consignorDetails;
    final consignee = data.formData?.consigneeDetails;
    final package = data.formData?.packageDetails;
    final payment = data.formData?.paymentDetails;
    final insurance = data.formData?.insuranceDetails;
    final vehicle = data.formData?.vehicleInsuranceDetails;

    return
      */
/*Container(
      width: MediaQuery.of(context).size.width,
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8),
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Text('InvoiceDetails',style: TextStyle(fontWeight: FontWeight.bold),)),
              Text("invoiceNumber: ${invoice?.invoiceNumber ?? 'N/A'}"),
              Text("invoiCecompanyName: ${invoice?.invoiCecompanyName ?? 'N/A'}"),
              Text("invoiceLRNumber: ${invoice?.invoiceLRNumber ?? 'N/A'}"),
              Text("invoiceDate: ${invoice?.invoiceDate ?? 'N/A'}"),
              Text("invoiceDeliveryDate: ${invoice?.invoiceDeliveryDate ?? 'N/A'}"),
              Text("invoiceMovingPath: ${invoice?.invoiceMovingPath ?? 'N/A'}"),
              Text("invoiceShipmentType: ${invoice?.invoiceShipmentType ?? 'N/A'}"),
              Text("invoiceMovicePathRemark: ${invoice?.invoiceMovicePathRemark ?? 'N/A'}"),
              Text("invoiceMovePath: ${invoice?.invoiceMovePath ?? 'N/A'}"),
              Text("invoiceMoveTo: ${invoice?.invoiceMoveTo ?? 'N/A'}"),
              Text("invoiceVehicleNumber: ${invoice?.invoiceVehicleNumber ?? 'N/A'}"),
              Center(child: Text('BillingDetails',style: TextStyle(fontWeight: FontWeight.bold),)),
              Text("customerName: ${billing?.customerName ?? 'N/A'}"),
              Text("customerPhone: ${billing?.customerPhone ?? 'N/A'}"),
              Text("billgstNo: ${billing?.billgstNo ?? 'N/A'}"),
              Text("billCountry: ${billing?.billCountry ?? 'N/A'}"),
              Text("billstate: ${billing?.billstate ?? 'N/A'}"),
              Text("billcity: ${billing?.billcity ?? 'N/A'}"),
              Text("billpincode: ${billing?.billpincode ?? 'N/A'}"),
              Text("billaddress: ${billing?.billaddress ?? 'N/A'}"),
              Center(child: Text('ConsignorDetails',style: TextStyle(fontWeight: FontWeight.bold),)),
              Text("consignorName: ${consignor?.consignorName ?? 'N/A'}"),
              Text("consignorPhone: ${consignor?.consignorPhone ?? 'N/A'}"),
              Text("consignorgstNo: ${consignor?.consignorgstNo ?? 'N/A'}"),
              Text("consignorCountry: ${consignor?.consignorCountry ?? 'N/A'}"),
              Text("consignorstate: ${consignor?.consignorstate ?? 'N/A'}"),
              Text("consignorcity: ${consignor?.consignorcity ?? 'N/A'}"),
              Text("consignorpincode: ${consignor?.consignorpincode ?? 'N/A'}"),
              Text("consignoraddress: ${consignor?.consignoraddress ?? 'N/A'}"),
              Center(child: Text('ConsigneeDetails',style: TextStyle(fontWeight: FontWeight.bold),)),
              Text("consigneeName: ${consignee?.consigneeName ?? 'N/A'}"),
              Text("consigneePhone: ${consignee?.consigneePhone ?? 'N/A'}"),
              Text("consigneegstNo: ${consignee?.consigneegstNo ?? 'N/A'}"),
              Text("consigneeCountry: ${consignee?.consigneeCountry ?? 'N/A'}"),
              Text("consigneestate: ${consignee?.consigneestate ?? 'N/A'}"),
              Text("consigneecity: ${consignee?.consigneecity ?? 'N/A'}"),
              Text("consigneepincode: ${consignee?.consigneepincode ?? 'N/A'}"),
              Text("consigneeaddress: ${consignee?.consigneeaddress ?? 'N/A'}"),
              Center(child: Text('PackageDetails',style: TextStyle(fontWeight: FontWeight.bold),)),
              Text("packageType: ${package?.packageType ?? 'N/A'}"),
              Text("packagedescription: ${package?.packagedescription ?? 'N/A'}"),
              Text("packagetotalWeight: ${package?.packagetotalWeight ?? 'N/A'}"),
              Text("packageHSN: ${package?.packageHSN ?? 'N/A'}"),
              Text("packageRemark: ${package?.packageRemark ?? 'N/A'}"),
              Text("totalWeight: ${package?.totalWeight ?? 'N/A'}"),
              Text("description: ${package?.description ?? 'N/A'}"),
              Center(child: Text('PaymentDetails',style: TextStyle(fontWeight: FontWeight.bold),)),
              Text("freightCharges: ${payment?.freightCharges ?? '0'}"),
              Text("advancePaid: ${payment?.advancePaid ?? '0'}"),
              Text("packingCharge: ${payment?.packingCharge ?? '0'}"),
              Text("unPackingCharge: ${payment?.unPackingCharge ?? '0'}"),
              Text("paymentModhe: ${payment?.paymentMode ?? '0'}"),
              Text("unloadingCarges: ${payment?.unloadingCharges ?? '0'}"),
              Text("loadingCharges: ${payment?.loadingCharges ?? '0'}"),
              Text("packingMaterialCharge: ${payment?.packingMaterialCharge ?? '0'}"),
              Text("packingStorgeCharge: ${payment?.packingStorgeCharge ?? '0'}"),
              Text("packingCarBikeTPT: ${payment?.packingCarBikeTPT ?? '0'}"),
              Text("packingMiscellaneous: ${payment?.packingMiscellaneous ?? '0'}"),
              Text("otherCharges: ${payment?.otherCharges?? '0'}"),
              Text("packingSTCharge: ${payment?.packingSTCharge?? '0'}"),
              Text("packingGreenTax: ${payment?.packingGreenTax?? '0'}"),
              Text("packingSurcharge: ${payment?.packingSurcharge?? '0'}"),
              Text("packingGstShow: ${payment?.packingGstShow?? '0'}"),
              Text("packingGstNo: ${payment?.packingGstNo?? '0'}"),
              Text("packingGstType: ${payment?.packingGstType?? '0'}"),
              Text("packingReverseCharge: ${payment?.packingReverseCharge?? '0'}"),
              Text("packingGstPaidBy: ${payment?.packingGstPaidBy?? '0'}"),
              Text("packingPaymentRemark: ${payment?.packingPaymentRemark?? '0'}"),
              Text("packingDiscountAmount: ${payment?.packingDiscountAmount?? '0'}"),
              Text("totalAmount: ${payment?.totalAmount?? '0'}"),
              Center(child: Text('InsuranceDetails',style: TextStyle(fontWeight: FontWeight.bold),)),
              Text("insuranceType: ${insurance?.insuranceType?? '0'}"),
              Text("insuranceCharges: ${insurance?.insuranceCharges?? '0'}"),
              Text("declarationValueOfGoods: ${insurance?.declarationValueOfGoods?? '0'}"),
              Center(child: Text('VehicleInsuranceDetails',style: TextStyle(fontWeight: FontWeight.bold),)),
              Text("vehicleNumber: ${vehicle?.vehicleNumber?? '0'}"),
              Text("insuranceType: ${vehicle?.insuranceType?? '0'}"),
              Text("insuranceCharges: ${vehicle?.insuranceCharges?? '0'}"),
            ],
          ),
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
                Text('BILL:${index + 1}', style: const TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.bold)),
              ],
            ),
          )
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
      appBar: CustomAppBar(title: 'Bill Reports'),
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
                  children: reportData.map(_buildReportCard).toList(),
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
import '../../../homescreen_documents_pdf/bill_pdf/bill_edit_screen/bill_edit_screen.dart';
import '../../../homescreen_documents_pdf/bill_pdf/bill_pdf_screen/bill_pdf_screen.dart';
import '../../../homescreen_documents_pdf/bill_pdf/provider/bill_pdf_provider.dart';
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
                // Text('${customer?.name ?? 'N/A'}'),
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
                                  //Text('भुगतान हटाएं',style: TextStyle(fontSize: 12),),
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
                              // builder: (context) => SurveyPdfWebViewScreen(id: yourIdHere), // Replace with actual ID
                              builder: (context) => BillPdfWebViewScreen(id: data.sId ?? ''),

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
                            "http://167.71.232.245:8970/api/user/quotation/${data.sId}/pdf",
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
                            "http://167.71.232.245:8970/api/user/bill/${data.sId}/pdf",
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
                                  Text('Share Bill Pdf',
                                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                                  Text('बिल पीडीएफ भेजें', style: TextStyle(fontSize: 12)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),*/
                    Expanded(
                      child: InkWell(
                        onTap: isLoading1
                            ? null
                            : () async {
                          setState(() => isLoading1 = true);

                          final url =
                              "http://167.71.232.245:8970/api/user/bill/${data.sId}/pdf";

                          await PdfDownloadershare.downloadAndSharePdf(url);

                          setState(() => isLoading1 = false);
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
                              isLoading1
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
                    // Second Container

                    Expanded(
                      child: InkWell(
                        onTap: () {
                          PdfDownloader.downloadAndOpenPdf(
                           // "http://167.71.232.245:8970/api/user/bill/${item.sId}/pdf",
                            "http://167.71.232.245:8970/api/user/bill/${data.sId}/pdf",
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
