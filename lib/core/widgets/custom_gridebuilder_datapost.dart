
import 'package:BillBook/core/widgets/custom_image_view.dart';
import 'package:flutter/material.dart';
import '../../presentaion/homeScreen/BillScreen/ui/bill_screen.dart';
import '../../presentaion/homeScreen/LR-BilityScreen/ui/lr_blity_screen.dart';
import '../../presentaion/homeScreen/ProformaInvoice/ui/proforma_invoice_screen.dart';
import '../../presentaion/homeScreen/carConditionScreen/ui/car_condition_screen.dart';
import '../../presentaion/homeScreen/fov-scfFormScreen/ui/for_scf_form_screen.dart';
import '../../presentaion/homeScreen/moneyReceiptScreen/ui/money_receipt_screen.dart';
import '../../presentaion/homeScreen/nocLetterscreen/ui/noc_letter_screen.dart';
import '../../presentaion/homeScreen/packingList/ui/packing_list_screen.dart';
import '../../presentaion/homeScreen/paymentVoucherScreen/ui/payment_voucher_screen.dart';
import '../../presentaion/homeScreen/quotationScreens/ui/quotaion_screen.dart';
import '../../presentaion/homeScreen/surveyScreen/ui/survey_screen.dart';
import '../../presentaion/homeScreen/twsFormScreen/ui/tws_form_screen.dart';
import '../../presentaion/homescreen_documents_pdf/Packing_list_pdf/ui/packing_list_pdf.dart';
import '../../presentaion/homescreen_documents_pdf/Payment_voucher_pdf/ui/payment_voucher_pdf.dart';
import '../../presentaion/homescreen_documents_pdf/bill_pdf/ui/bill_pdf.dart';
import '../../presentaion/homescreen_documents_pdf/car_condition_pdf/ui/car_condition_pdf.dart';
import '../../presentaion/homescreen_documents_pdf/fov_scf_form_pdf/ui/fov_scf_form_pdf.dart';
import '../../presentaion/homescreen_documents_pdf/lr_bilty_pdf/ui/lr_bilty_pdf.dart';
import '../../presentaion/homescreen_documents_pdf/money_receipt_pdf/ui/money_receipt_pdf.dart';
import '../../presentaion/homescreen_documents_pdf/noc_letter_pdf/ui/noc_letter_pdf.dart';
import '../../presentaion/homescreen_documents_pdf/proforma_invoice_pdf/ui/proforma_invoice_pdf.dart';
import '../../presentaion/homescreen_documents_pdf/quotation_pdf/ui/quotation_list_pdf.dart';
import '../../presentaion/homescreen_documents_pdf/survey_pdf/ui/survey_list_pdf.dart';
import '../../presentaion/homescreen_documents_pdf/tws_form_pdf/ui/tws_form_pdf.dart';

class DocumentItem1 {
  final String title;
  final IconData? icon;
  final int? count;
  final String? imagePath;

  DocumentItem1({
    required this.title,
    this.icon,
    this.count,
    this.imagePath,
  });
}

class DocumentGridSection1 extends StatelessWidget {
  final String? title;
  final List<DocumentItem1> items;
  final void Function(DocumentItem1 item)? onPressed;
  final bool border;

  const DocumentGridSection1({
    Key? key,
    this.title,
    required this.items,
    this.onPressed,
    this.border = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textScale = MediaQuery.of(context).textScaleFactor;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null && title!.isNotEmpty)
            Padding(
              padding: EdgeInsets.only(top:screenHeight * 0.04),
              child: Text(
                title!,
                style: TextStyle(
                  fontSize: 18 * textScale,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          SizedBox(height: screenHeight * 0.01),
          LayoutBuilder(
            builder: (context, constraints) {
              final double maxWidth = constraints.maxWidth;
              final int crossAxisCount = maxWidth > 800
                  ? 6
                  : maxWidth > 600
                  ? 5
                  : 4;

              final double imageSize = maxWidth / (crossAxisCount * 2.5);
              return GridView.count(
                padding: EdgeInsets.only(bottom: screenHeight * 0.04,),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.75,
                children: items.map((item) {
                  return GestureDetector(

                    // onTap: onPressed != null ? () => onPressed!(item) : null,
                    onTap: () {
                      if (item.title == "Quotation") {
                        Navigator.push(
                          context,
                         // MaterialPageRoute(builder: (context) => const QuotationListPdf()),
                          MaterialPageRoute(builder: (context) => const QuotationScreen(mobileNumber: '')),
                        );
                      } else if (item.title == "Survey list") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const SurveyScreen(mobileNumber: '')),
                        );
                      } else if (item.title == "Packing List") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const PackingScreen(mobileNumber: '')),
                        );
                      } else if (item.title == "LR–Bilty") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const LrBlityScreen(mobileNumber: '')),
                        );
                      } else if (item.title == "Proforma invoice") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ProformaInvoiceScreen(mobileNumber: '')),
                        );
                      } else if (item.title == "Bill") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const BillScreen(mobileNumber: '')),
                        );
                      } else if (item.title == "Money Receipt") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const MoneyReceiptScreen(mobileNumber: '')),
                        );
                      } else if (item.title == "Car Condition") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const CarConditionScreen(mobileNumber: '')),
                        );
                      } else if (item.title == "Payment Voucher") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const PayementVoucherScreen(mobileNumber: '')),
                        );
                      } else if (item.title == "Tws Form") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const TwsFormScreen(mobileNumber: '')),
                        );
                      } else if (item.title == "Fov-Scf Form") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const FovScfFormScreen(mobileNumber: '')),
                        );
                      } else if (item.title == "NOC Letter") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const NOCLetterScreen(mobileNumber: '')),
                        );
                      }

                      if (onPressed != null) {
                        onPressed!(item); // Call callback if needed
                      }
                    },


                    child: Column(
                      children: [
                        Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: border
                                  ? BoxDecoration(
                                border: Border.all(color: Colors.grey.shade400),
                                borderRadius: BorderRadius.circular(8),
                              )
                                  : null,
                              child: item.imagePath != null
                                  ? Image.asset(
                                item.imagePath!,
                                width: imageSize ,
                                height: imageSize,
                                fit: BoxFit.contain,
                              )
                                  : Icon(
                                item.icon ?? Icons.insert_drive_file,
                                color: Colors.blue,
                                size: imageSize,
                              ),
                            ),
                            if (item.count != null)
                              Positioned(
                                right: 0,
                                top: 5,
                                left: 25,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    CustomImageView(imagePath: 'assets/images/marker.png',
                                      width: screenWidth * 0.06,
                                      height: screenHeight * 0.03,),
                                    Text(
                                      item.count.toString(),
                                      style: TextStyle(
                                        fontSize: 10 * textScale,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                        SizedBox(height: screenHeight * 0.01),
                        Expanded(
                          child: Center(
                            child: Text(
                              item.title,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 12 * textScale),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}
