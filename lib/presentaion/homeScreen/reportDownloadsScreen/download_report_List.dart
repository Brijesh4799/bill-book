import 'package:flutter/material.dart';

import '../../../core/widgets/custom_app_bar/ui/customAppBar.dart';
import '../../download_reports_details/bill_report_download/ui/bill_report_ui.dart';
import '../../download_reports_details/car_condition_report_download/ui/car_condition_report_ui.dart';
import '../../download_reports_details/lr_bilty_report_download/ui/lr_bilty_report.dart';
import '../../download_reports_details/money_reports_details/ui/money_report_ui.dart';
import '../../download_reports_details/packing_download_repots/ui/packing_repots_download.dart';
import '../../download_reports_details/payment_voucher_report_download/ui/payment_voucher_report.dart';
import '../../download_reports_details/quotation_report_download/ui/quotation_report_ui.dart';
import '../../download_reports_details/survey_report_download/ui/survey_report_download.dart';
import '../fov-scfFormScreen/ui/for_scf_form_screen.dart';
import '../nocLetterscreen/ui/noc_letter_screen.dart';
import '../twsFormScreen/ui/tws_form_screen.dart';
import 'download_report.dart';

class ReportsDownloadListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: CustomAppBar(title: 'Download Reports',),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.05,
          vertical: screenHeight * 0.02,
        ),
        children: [
          _buildListItem(
            context,
            title: "Quotation",
            subtitle: "Click here to go download",
            reportType: "Quotation",
          ),
          _buildListItem(
            context,
            title: "Survey List",
            subtitle: "Click here to go download",
            reportType: "Survey List",
          ),
          _buildListItem(
            context,
            title: "Packing List",
            subtitle: "Click here to go download",
            reportType: "Packing List",
          ),
          _buildListItem(
            context,
            title: "Lr/Bilty",
            subtitle: "Click here to go download",
            reportType: "Lr/Bilty",
          ),
          _buildListItem(
            context,
            title: "Car/ Vehicle Condition list",
            subtitle: "Click here to go download",
            reportType: "Car/ Vehicle Condition list",
          ),
          _buildListItem(
            context,
            title: "Invoice/ Bill Report",
            subtitle: "Click here to go download",
            reportType: "Invoice/ Bill Report",
          ),
          _buildListItem(
            context,
            title: "Money Receipt",
            subtitle: "Click here to go download",
            reportType: "Money Receipt",
          ),
          _buildListItem(
            context,
            title: "Payment Voucher",
            subtitle: "Click here to go download",
            reportType: "Payment Voucher",
          ),
        ],
      ),
    );
  }

  Widget _buildListItem(
      BuildContext context, {
        required String title,
        required String subtitle,
        required String reportType,
      }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          if (title == "Quotation") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const QuotationReportUi()),
            );
          } else if (title == "Survey List") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SurveyRepotsDownload()),
            );
          } else if (title == "Packing List") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PackingRepotsDownload()),
            );
          } else if (title == "Lr/Bilty") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LrBiltyRepotsDownload()),
            );
          } else if (title == "Invoice/ Bill Report") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const BillReportScreen()),
            );
          } else if (title == "Money Receipt") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MoneyRepotsDownload()),
            );
          } else if (title == "Car/ Vehicle Condition list") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CarConditionRepotsDownload()),
            );
          } else if (title == "Payment Voucher") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PaymentReportScreen()),
            );
          } else if (title == "Tws Form") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TwsFormScreen(mobileNumber: '')),
            );
          } else if (title == "Fov-Scf Form") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const FovScfFormScreen(mobileNumber: '')),
            );
          } else if (title == "NOC Letter") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const NOCLetterScreen(mobileNumber: '')),
            );
          } else {
            // Default download screen for others
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DownloadScreen(reportType),
              ),
            );
          }
        },
      ),
    );
  }

  void downloadScreen(BuildContext context, {required String reportType}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DownloadScreen(reportType),
      ),
    );
  }
}
