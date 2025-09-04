
import 'package:BillBook/presentaion/homeScreen/BillScreen/provider/bill_provider.dart';
import 'package:BillBook/presentaion/homeScreen/LR-BilityScreen/provider/lr_bill_provider.dart';
import 'package:BillBook/presentaion/homeScreen/ProformaInvoice/provider/proformaProvider.dart';
import 'package:BillBook/presentaion/homeScreen/carConditionScreen/provider/car_condition_provider.dart';
import 'package:BillBook/presentaion/homeScreen/fov-scfFormScreen/provider/fov_scf_form_provider.dart';

import 'package:BillBook/presentaion/homeScreen/moneyReceiptScreen/provider/money_receipt_provider.dart';
import 'package:BillBook/presentaion/homeScreen/nocLetterscreen/provider/nocletter_provider.dart';
import 'package:BillBook/presentaion/homeScreen/packingList/provider/packingProvider.dart';
import 'package:BillBook/presentaion/homeScreen/paymentVoucherScreen/provider/payment_voucher_provider.dart';
import 'package:BillBook/presentaion/homeScreen/quotationScreens/provider/QuotationProvider.dart';
import 'package:BillBook/presentaion/homeScreen/staffScreen/staff_list/staff_provider/staff_provider.dart';
import 'package:BillBook/presentaion/homeScreen/subscriptionScreen/provider/subscription_provider.dart';
import 'package:BillBook/presentaion/homeScreen/surveyScreen/provider/survey_provider.dart';
import 'package:BillBook/presentaion/homeScreen/twsFormScreen/provider/tws_form_provider.dart';
import 'package:BillBook/presentaion/homescreen_documents_pdf/Packing_list_pdf/provider/pcking_list_pdf_provider.dart';
import 'package:BillBook/presentaion/homescreen_documents_pdf/Payment_voucher_pdf/provider/payment_pdf_provider.dart';
import 'package:BillBook/presentaion/homescreen_documents_pdf/bill_pdf/provider/bill_pdf_provider.dart';
import 'package:BillBook/presentaion/homescreen_documents_pdf/car_condition_pdf/provider/car_condition_pdf_provider.dart';
import 'package:BillBook/presentaion/homescreen_documents_pdf/fov_scf_form_pdf/provider/foc_scf_pdf_provider.dart';
import 'package:BillBook/presentaion/homescreen_documents_pdf/lr_bilty_pdf/provider/lr_bilty_pdf_provider.dart';
import 'package:BillBook/presentaion/homescreen_documents_pdf/money_receipt_pdf/provider/money_receipt_pdf_provider.dart';
import 'package:BillBook/presentaion/homescreen_documents_pdf/noc_letter_pdf/provider/noc_letter_provider.dart';
import 'package:BillBook/presentaion/homescreen_documents_pdf/proforma_invoice_pdf/provider/proforma_pdf_provider.dart';
import 'package:BillBook/presentaion/homescreen_documents_pdf/quotation_pdf/provider/quotation_pdf_provider.dart';
import 'package:BillBook/presentaion/homescreen_documents_pdf/survey_pdf/provider/survey_pdf_provider.dart';
import 'package:BillBook/presentaion/homescreen_documents_pdf/tws_form_pdf/provider/tws_pdf_provider.dart';
import 'package:BillBook/presentaion/onboardingScreen/otp_screen/provider_screen/otp_provider.dart';
import 'package:BillBook/presentaion/onboardingScreen/splash_screen.dart';
import 'package:BillBook/presentaion/onboardingScreen/update_profile/update_profile_provider/update_profile_provider.dart';
import 'package:BillBook/presentaion/profile/business_details_screen/provider/business_provider.dart';
import 'package:BillBook/presentaion/profile/provider/provider.dart';
import 'package:BillBook/presentaion/profile/user_profile_input/provider/user_update_input_provider.dart';
import 'package:BillBook/presentaion/tearms%20and%20condition/quotation_tearms_condition/provider/quotation_tearms_condition_provider.dart';
import 'package:BillBook/test/PersonalityTestScreen.dart';
import 'package:BillBook/test/delete_account_screen.dart';
import 'package:BillBook/test/personalityAnalysisScreen.dart';
import 'package:BillBook/test/personality_sections_screen.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/widgets/custom_app_bar/provider/profile_provider.dart';
import 'core/widgets/custom_app_bar/ui/customAppBar.dart';
import 'core/widgets/home_page_custom/provider/home_page_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AwesomeNotifications().initialize(
    null,
    [
      NotificationChannel(
        channelKey: 'basic_channel',
        channelName: 'Basic Notifications',
        channelDescription: 'Notification channel for basic tests',
        defaultColor: Colors.blue,
        ledColor: Colors.white,
        importance: NotificationImportance.High,
      )
    ],
  );


  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return

      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => OtpProvider()),
          ChangeNotifierProvider(create: (_) => UserUpdateInputProvider()),

          ChangeNotifierProvider(create: (_) => UpdateProfileProvider()),
          ChangeNotifierProvider(create: (_) => BusinessProvider()),
          ChangeNotifierProvider(create: (_) => QuatationProvider()),
          ChangeNotifierProvider(create: (_) => SurveyProvider()),
          ChangeNotifierProvider(create: (_) => PackingProvider()),
          ChangeNotifierProvider(create: (_) => ProformaInvoiceProvider()),
          ChangeNotifierProvider(create: (_) => BillProvider()),
          ChangeNotifierProvider(create: (_) => MoneyReceiptProvider()),
          ChangeNotifierProvider(create: (_) => CarConditionProvider()),
          ChangeNotifierProvider(create: (_) => PaymentVoucherProvider()),
          ChangeNotifierProvider(create: (_) => TwsFormProvider()),
          ChangeNotifierProvider(create: (_) => FovScfFormProvider()),
          ChangeNotifierProvider(create: (_) => NocLetterProvider()),
          ChangeNotifierProvider(create: (_) => LRBillProvider()),
          ChangeNotifierProvider(create: (_) => QuatationPdfProvider()),
          ChangeNotifierProvider(create: (_) => SurveyPdfProvider()),
          ChangeNotifierProvider(create: (_) => PackingListPdfProvider()),
          ChangeNotifierProvider(create: (_) => LrBiltyPdfProvider()),
          ChangeNotifierProvider(create: (_) => ProformaPdfProvider()),
          ChangeNotifierProvider(create: (_) => BillPdfProvider()),
          ChangeNotifierProvider(create: (_) => MoneyReceiptPdfProvider()),
          ChangeNotifierProvider(create: (_) => CarConditionPdfProvider()),
          ChangeNotifierProvider(create: (_) => PaymentPdfProvider()),
          ChangeNotifierProvider(create: (_) => TwsPdfProvider()),
          ChangeNotifierProvider(create: (_) => FocScfPdfProvider()),
          ChangeNotifierProvider(create: (_) => NocLetterPdfProvider()),
          ChangeNotifierProvider(create: (_) => GetProfileProvider()),
          ChangeNotifierProvider(create: (_) => HomePageProvider()),
          ChangeNotifierProvider(create: (_) => QuotationTearmsandCondition()),
          ChangeNotifierProvider(create: (_) => SubscriptionProvider()),
          ChangeNotifierProvider(create: (_) => StaffListProvider()),
         // ChangeNotifierProvider(create: (_) => LrBiltyReportProvider()),
        ],
        child:  MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Bill Book',
          theme: ThemeData(
            primaryColor: const Color(0xFF137DC7), // Reference blue
            // scaffoldBackgroundColor: Colors.white,
            scaffoldBackgroundColor:Color(0xFFEEEEEE),
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color(0xFF137DC7),
              brightness: Brightness.light,
              primary: const Color(0xFF137DC7),
              onPrimary: Colors.white,
              secondary: Colors.black,
            ),
            appBarTheme: const AppBarTheme(
              backgroundColor: Color(0xFF137DC7),
              foregroundColor: Colors.white,
              iconTheme: IconThemeData(color: Colors.white),
            ),
            textTheme: const TextTheme(
              bodyMedium: TextStyle(color: Colors.black),
            ),
            iconTheme: const IconThemeData(color: Colors.black),
            useMaterial3: true,
          ),
          home:const SplashScreen(),
          //home:const CustomAppBar(),
          //home:  PersonalitySectionsScreen(),
          // home: PersonalityQuestionScreen(),
          // home: DeleteAccountScreen(),
        ),
      );
     /* MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bill Book',
      theme: ThemeData(
        primaryColor: const Color(0xFF137DC7), // Reference blue
        // scaffoldBackgroundColor: Colors.white,
        scaffoldBackgroundColor:Color(0xFFEEEEEE),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF137DC7),
          brightness: Brightness.light,
          primary: const Color(0xFF137DC7),
          onPrimary: Colors.white,
          secondary: Colors.black,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF137DC7),
          foregroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        useMaterial3: true,
      ),
      home:const SplashScreen(),
      //home:  PersonalitySectionsScreen(),
     // home: PersonalityQuestionScreen(),
     // home: DeleteAccountScreen(),
    );*/
  }
}