import 'package:BillBook/core/widgets/custom_app_bar/ui/customAppBar.dart';
import 'package:flutter/material.dart';

import '../../../core/widgets/custom_Textbutton.dart';
import '../../../core/widgets/custom_input_text_field.dart';
import '../../download_reports_details/bill_report_download/ui/bill_report_ui.dart';
import '../../download_reports_details/car_condition_report_download/ui/car_condition_report_ui.dart';
import '../../download_reports_details/lr_bilty_report_download/ui/lr_bilty_report.dart';
import '../../download_reports_details/money_reports_details/ui/money_report_ui.dart';
import '../../download_reports_details/packing_download_repots/ui/packing_repots_download.dart';
import '../../download_reports_details/payment_voucher_report_download/ui/payment_voucher_report.dart';
import '../../download_reports_details/quotation_report_download/ui/quotation_report_ui.dart';
import '../../download_reports_details/survey_report_download/ui/survey_report_download.dart';
import '../BillScreen/ui/bill_screen.dart';
import '../LR-BilityScreen/ui/lr_blity_screen.dart';
import '../carConditionScreen/ui/car_condition_screen.dart';
import '../fov-scfFormScreen/ui/for_scf_form_screen.dart';
import '../moneyReceiptScreen/ui/money_receipt_screen.dart';
import '../nocLetterscreen/ui/noc_letter_screen.dart';
import '../packingList/ui/packing_list_screen.dart';
import '../paymentVoucherScreen/ui/payment_voucher_screen.dart';
import '../quotationScreens/ui/quotaion_screen.dart';
import '../surveyScreen/ui/survey_screen.dart';
import '../twsFormScreen/ui/tws_form_screen.dart';

class DownloadScreen extends StatefulWidget {
  final String reportType;

  DownloadScreen(this.reportType);

  @override
  State<DownloadScreen> createState() => _DownloadScreenState();
}

class _DownloadScreenState extends State<DownloadScreen> {
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  void handleReportTap(BuildContext context, String title, String reportType) {
    switch (title) {
      case "Quotation":
        Navigator.push(context, MaterialPageRoute(builder: (_) => const QuotationReportUi()));
        break;
      case "Survey List":
        Navigator.push(context, MaterialPageRoute(builder: (_) => const SurveyRepotsDownload()));
        break;
      case "Packing List":
        Navigator.push(context, MaterialPageRoute(builder: (_) => const PackingRepotsDownload()));
        break;
      case "Lr/Bilty":
        Navigator.push(context, MaterialPageRoute(builder: (_) => const LrBiltyRepotsDownload()));
        break;
      case "Invoice/ Bill Report":
        Navigator.push(context, MaterialPageRoute(builder: (_) => const BillReportScreen()));
        break;
      case "Money Receipt":
        Navigator.push(context, MaterialPageRoute(builder: (_) => const MoneyRepotsDownload()));
        break;
      case "Car/ Vehicle Condition list":
        Navigator.push(context, MaterialPageRoute(builder: (_) => const CarConditionRepotsDownload()));
        break;
      case "Payment Voucher":
        Navigator.push(context, MaterialPageRoute(builder: (_) => const PaymentReportScreen()));
        break;
      case "Tws Form":
        Navigator.push(context, MaterialPageRoute(builder: (_) => const TwsFormScreen(mobileNumber: '')));
        break;
      case "Fov-Scf Form":
        Navigator.push(context, MaterialPageRoute(builder: (_) => const FovScfFormScreen(mobileNumber: '')));
        break;
      case "NOC Letter":
        Navigator.push(context, MaterialPageRoute(builder: (_) => const NOCLetterScreen(mobileNumber: '')));
        break;
      default:
        Navigator.push(context, MaterialPageRoute(builder: (_) => DownloadScreen(reportType)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:CustomAppBar(title: 'Download Reports',),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Download ${widget.reportType}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                      child:inputTextFields(
                        label: 'Start Date',
                        textEditingController: startDateController,
                      ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child:inputTextFields(
                      label: 'End Date',
                      textEditingController: endDateController,
                    ),
                  ),
                ],
              ),
              CustomButton(
                  label: 'Download Reports',
                  onPressed: (){
                    print('downloading');
                  }
              ),
            ],
          ),
        ),
      ),
    );
  }
}