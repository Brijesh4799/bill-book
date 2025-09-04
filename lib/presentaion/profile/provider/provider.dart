/*
import 'package:BillBook/core/widgets/custom_Textbutton.dart';
import 'package:BillBook/core/widgets/custom_image_view.dart';
import 'package:BillBook/presentaion/homeScreen/packingList/ui/packing_list_screen.dart';
import 'package:BillBook/presentaion/homeScreen/paymentVoucherScreen/ui/payment_voucher_screen.dart';
import 'package:BillBook/presentaion/homeScreen/quotationScreens/ui/quotaion_screen.dart';
import 'package:BillBook/presentaion/homeScreen/reportDownloadsScreen/download_report_List.dart';
import 'package:BillBook/presentaion/homeScreen/staffScreen/staff_report_screen.dart';
import 'package:BillBook/presentaion/homeScreen/surveyScreen/ui/survey_screen.dart';
import 'package:BillBook/presentaion/homeScreen/twsFormScreen/ui/tws_form_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/widgets/banner.dart';
import '../../core/widgets/custom_app_bar/ui/customAppBar.dart';
import '../../core/widgets/custom_gridbuilder.dart';
import '../../core/widgets/home_page_custom/model/home_page_model.dart';
import '../../core/widgets/home_page_custom/provider/home_page_provider.dart';
import 'BillScreen/ui/bill_screen.dart';
import 'LR-BilityScreen/ui/lr_blity_screen.dart';
import 'ProformaInvoice/ui/proforma_invoice_screen.dart';
import 'carConditionScreen/ui/car_condition_screen.dart';
import 'fov-scfFormScreen/ui/for_scf_form_screen.dart';

import 'moneyReceiptScreen/ui/money_receipt_screen.dart';
import 'nocLetterscreen/ui/noc_letter_screen.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    // Fetch data on widget load
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<HomePageProvider>(context, listen: false).homeListData();
    });
  }
  final List<DocumentItem> serviceItems = [
    DocumentItem(title: "Quotation", imagePath: 'assets/images/QuotationIcon.png'),
    DocumentItem(title: "Survey list", imagePath: 'assets/images/surveyListIcon.png',),
    DocumentItem(title: "Packing List",imagePath: 'assets/images/PackingListIcon.png',),
    DocumentItem(title: "LR–Bilty", imagePath: 'assets/images/LR-BiltyIcon.png'),
    DocumentItem(title: "Proforma invoice", imagePath: 'assets/images/Proforma_invoiceIcon.png'),
    DocumentItem(title: "Bill", imagePath: 'assets/images/billIcon.png'),
    DocumentItem(title: "Money Receipt",imagePath: 'assets/images/moneyRecieptIcon.png'),
    DocumentItem(title: "Car Condition", imagePath: 'assets/images/CarConditionIcon.png'),
    DocumentItem(title: "Payment Voucher",imagePath: 'assets/images/paymentVoucher.png'),
    DocumentItem(title: "Tws Form", imagePath: 'assets/images/twsFormIcon.png'),
    DocumentItem(title: "Fov-Scf Form", imagePath: 'assets/images/fovFormIcon.png'),
    DocumentItem(title: "NOC Letter", imagePath: 'assets/images/NOCIcon.png'),
  ];
  */
/*final List<DocumentItem> documentItems = [
    DocumentItem(title: "Quotation", imagePath: 'assets/images/QuotationIcon.png', count: 4),
    DocumentItem(title: "Survey list", icon: Icons.list_alt, count: 6),
    DocumentItem(title: "Packing List", icon: Icons.inventory, count: 6),
    DocumentItem(title: "LR–Bilty", icon: Icons.receipt_long),
    DocumentItem(title: "Proforma invoice", icon: Icons.request_page),
    DocumentItem(title: "Bill", icon: Icons.attach_money, count: 13),
    DocumentItem(title: "Money Receipt", icon: Icons.receipt, count: 10),
    DocumentItem(title: "Car Condition", icon: Icons.directions_car, count: 10),
    DocumentItem(title: "Payment Voucher", icon: Icons.payment, count: 10),
    DocumentItem(title: "Tws Form", icon: Icons.article),
    DocumentItem(title: "Fov-Scf Form", icon: Icons.assignment),
    DocumentItem(title: "NOC Letter", icon: Icons.mark_email_read),
  ];*//*


  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final textScale = MediaQuery.of(context).textScaleFactor;

    final homeProvider = Provider.of<HomePageProvider>(context);
    final docCounts = homeProvider.homeList?.docCounts ?? DocCounts();


    final List<DocumentItem> documentItems = [
      DocumentItem(title: "Quotation", imagePath: 'assets/images/QuotationIcon.png', count: docCounts?.quotation),
      DocumentItem(title: "Survey list", imagePath: 'assets/images/surveyListIcon.png', count: docCounts?.survey),
      DocumentItem(title: "Packing List", imagePath: 'assets/images/PackingListIcon.png', count: docCounts?.packing),
      DocumentItem(title: "LR–Bilty", imagePath: 'assets/images/LR-BiltyIcon.png', count: docCounts?.lrbilty),
      DocumentItem(title: "Proforma invoice", imagePath: 'assets/images/Proforma_invoiceIcon.png', count: docCounts?.proforma),
      DocumentItem(title: "Bill", imagePath: 'assets/images/billIcon.png', count: docCounts?.bill),
      DocumentItem(title: "Money Receipt", imagePath: 'assets/images/moneyRecieptIcon.png', count: docCounts?.money),
      DocumentItem(title: "Car Condition", imagePath: 'assets/images/CarConditionIcon.png', count: docCounts?.carCondition),
      DocumentItem(title: "Payment Voucher", imagePath: 'assets/images/paymentVoucher.png', count: docCounts?.paymentVoucher),
      DocumentItem(title: "Tws Form", imagePath: 'assets/images/twsFormIcon.png', count: docCounts?.tws),
      DocumentItem(title: "Fov-Scf Form", imagePath: 'assets/images/fovFormIcon.png', count: docCounts?.fovScf),
      DocumentItem(title: "NOC Letter", imagePath: 'assets/images/NOCIcon.png', count: docCounts?.noc),
    ];

    return Scaffold(
      appBar: CustomAppBar(home: true),
      body: homeProvider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BannerWidget(
              imagePaths: [
                'assets/images/Banner.png',
                'assets/images/Banner.png',
                'assets/images/Banner.png',
              ],
            ),
            DocumentGridSection(
              items: documentItems,
              border: true,
              onPressed: (item) {
                if (item.title == "Quotation") {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const QuotationScreen(mobileNumber: '')));
                } else if (item.title == "Survey list") {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const SurveyScreen(mobileNumber: '')));
                } else if (item.title == "Packing List") {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const PackingScreen(mobileNumber: '')));
                } else if (item.title == "LR–Bilty") {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const LrBlityScreen(mobileNumber: '')));
                } else if (item.title == "Proforma invoice") {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const ProformaInvoiceScreen(mobileNumber: '')));
                } else if (item.title == "Bill") {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const BillScreen(mobileNumber: '')));
                } else if (item.title == "Money Receipt") {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const MoneyReceiptScreen(mobileNumber: '')));
                } else if (item.title == "Car Condition") {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const CarConditionScreen(mobileNumber: '')));
                } else if (item.title == "Payment Voucher") {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const PayementVoucherScreen(mobileNumber: '')));
                } else if (item.title == "Tws Form") {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const TwsFormScreen(mobileNumber: '')));
                } else if (item.title == "Fov-Scf Form") {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const FovScfFormScreen(mobileNumber: '')));
                } else if (item.title == "NOC Letter") {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const NOCLetterScreen(mobileNumber: '')));
                }
              },
            ),
            CustomImageView(imagePath: 'assets/images/ViewAllImage.png'),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Add Staff Management', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16 * textScale)),
                  SizedBox(height: screenHeight * 0.02),
                  Row(
                    children: [
                      Expanded(
                        child: CustomImageView(
                          imagePath: 'assets/images/staffList.png',
                          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const StaffReport())),
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.02),
                      Expanded(
                        child: CustomImageView(
                          imagePath: 'assets/images/staffReport.png',
                          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const StaffReport())),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  CustomButton(
                    label: 'Download Reports',
                    buttonColor: const Color(0xFFFFFFFF),
                    textColor: const Color(0xFF000000),
                    borderColor: const Color(0xFF137DC7),
                    imagePath: 'assets/images/downLoadHomeIcon.png',
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ReportsDownloadListScreen())),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.15),
          ],
        ),
      ),
    );
  }

}
*/
