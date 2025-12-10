import 'package:BillBook/core/widgets/custom_Textbutton.dart';
import 'package:BillBook/core/widgets/custom_image_view.dart';
import 'package:BillBook/presentaion/homeScreen/reportDownloadsScreen/download_report_List.dart';
import 'package:BillBook/presentaion/homeScreen/staffScreen/staff_list_screen.dart';
import 'package:BillBook/presentaion/homeScreen/staffScreen/staff_report_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/widgets/banner.dart';
import '../../core/widgets/custom_app_bar/ui/customAppBar.dart';
import '../../core/widgets/custom_gridbuilder.dart';
import '../../core/widgets/custom_gridebuilder_datapost.dart';
import '../../core/widgets/home_page_custom/provider/home_page_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<HomePageProvider>(context, listen: false).homeListData();
    });
  }

  final List<DocumentItem1> serviceItems = [
    DocumentItem1(title: "Quotation", imagePath: 'assets/images/QuotationIcon.png'),
    DocumentItem1(title: "Survey list", imagePath: 'assets/images/surveyListIcon.png'),
    DocumentItem1(title: "Packing List", imagePath: 'assets/images/PackingListIcon.png'),
    DocumentItem1(title: "LR–Bilty", imagePath: 'assets/images/LR-BiltyIcon.png'),
    DocumentItem1(title: "Proforma invoice", imagePath: 'assets/images/Proforma_invoiceIcon.png'),
    DocumentItem1(title: "Bill", imagePath: 'assets/images/billIcon.png'),
    DocumentItem1(title: "Money Receipt", imagePath: 'assets/images/moneyRecieptIcon.png'),
    DocumentItem1(title: "Car Condition", imagePath: 'assets/images/CarConditionIcon.png'),
    DocumentItem1(title: "Payment Voucher", imagePath: 'assets/images/paymentVoucher.png'),
    DocumentItem1(title: "Tws Form", imagePath: 'assets/images/twsFormIcon.png'),
    DocumentItem1(title: "Fov-Scf Form", imagePath: 'assets/images/fovFormIcon.png'),
    DocumentItem1(title: "NOC Letter", imagePath: 'assets/images/NOCIcon.png'),
  ];

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomePageProvider>(context);
    final docCounts = homeProvider.homeList?.docCounts;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final textScale = MediaQuery.of(context).textScaleFactor;

    final List<DocumentItem> documentItems = [
      DocumentItem(title: "Quotation", icon: Icons.list_alt, count: docCounts?.quotation ?? 0),
      DocumentItem(title: "Survey list", icon: Icons.list_alt, count: docCounts?.survey ?? 0),
      DocumentItem(title: "Packing List", icon: Icons.inventory, count: docCounts?.packing ?? 0),
      DocumentItem(title: "LR–Bilty", icon: Icons.receipt_long, count: docCounts?.lrbilty ?? 0),
      DocumentItem(title: "Proforma invoice", icon: Icons.request_page, count: docCounts?.proforma ?? 0),
      DocumentItem(title: "Bill", icon: Icons.attach_money, count: docCounts?.bill ?? 0),
      DocumentItem(title: "Money Receipt", icon: Icons.receipt, count: docCounts?.money ?? 0),
      DocumentItem(title: "Car Condition", icon: Icons.directions_car, count: docCounts?.carCondition ?? 0),
      DocumentItem(title: "Payment Voucher", icon: Icons.payment, count: docCounts?.paymentVoucher ?? 0),
      DocumentItem(title: "Tws Form", icon: Icons.article, count: docCounts?.tws ?? 0),
      DocumentItem(title: "Fov-Scf Form", icon: Icons.assignment, count: docCounts?.fovScf ?? 0),
      DocumentItem(title: "NOC Letter", icon: Icons.mark_email_read, count: docCounts?.noc ?? 0),
    ];

    // Show loader when loading
    if (homeProvider.isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Scaffold(
      appBar: const CustomAppBar(home: true),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
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
            DocumentGridSection1(
              items: serviceItems,
              border: true,
              onPressed: (item) {
                print("Tapped on ${item.title}");
              },
            ),
            CustomImageView(imagePath: 'assets/images/ViewAllImage.png'),
            DocumentGridSection(
              title: 'Documents List',
              items: documentItems,
              onPressed: (item) {
                print("Tapped on ${item.title}");
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Add Staff Management',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16 * textScale,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Row(
                    children: [
                      Expanded(
                        child: CustomImageView(
                          imagePath: 'assets/images/staffList.png',
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const StaffList()));
                          },
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.02),
                      Expanded(
                        child: CustomImageView(
                          imagePath: 'assets/images/staffReport.png',
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const StaffReport()));
                          },
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
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ReportsDownloadListScreen()));
                    },
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
