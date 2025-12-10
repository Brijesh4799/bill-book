
import 'dart:io';

import 'package:flutter/material.dart';
import '../model/business_details_model.dart';
import '../repo/business_repo.dart';

class BusinessProvider with ChangeNotifier {
  // =================== Text Controllers ===================
  TextEditingController companyController = TextEditingController();
  TextEditingController taglineController = TextEditingController();
  TextEditingController whatsappnoController = TextEditingController();
  TextEditingController number1Controller = TextEditingController();
  TextEditingController number2Controller = TextEditingController();
  TextEditingController number3Controller = TextEditingController();
  TextEditingController number4Controller = TextEditingController();
  TextEditingController landlineController = TextEditingController();
  TextEditingController tollfreeController = TextEditingController();
  TextEditingController companyemailController = TextEditingController();
  TextEditingController websideController = TextEditingController();
  TextEditingController gstnoController = TextEditingController();
  TextEditingController pannoController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController jurisdictionController = TextEditingController();

  // Bank Details
  TextEditingController baneficiaryController = TextEditingController();
  TextEditingController banknameController = TextEditingController();
  TextEditingController accountnoController = TextEditingController();
  TextEditingController ifsccodeController = TextEditingController();
  TextEditingController branchController = TextEditingController();

  // UPI Details
  TextEditingController upiId1Controller = TextEditingController();
  TextEditingController phonePeController = TextEditingController();
  TextEditingController googlePeController = TextEditingController();
  TextEditingController upiId2Controller = TextEditingController();

  // Other Details
  TextEditingController affiliatedController = TextEditingController();
  TextEditingController isoController = TextEditingController();
  TextEditingController anynoController = TextEditingController();

  // =================== Loading ===================
  bool _loading = false;
  bool get loading => _loading;
  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  // =================== Images ===================
  File? _logoImage;
  File? _signatureImage;
  File? _stampImage;

  File? get logoImage => _logoImage;
  File? get signatureImage => _signatureImage;
  File? get stampImage => _stampImage;

  void setLogo(File? file) {
    _logoImage = file;
    notifyListeners();
  }

  void setSignature(File? file) {
    _signatureImage = file;
    notifyListeners();
  }

  void setStamp(File? file) {
    _stampImage = file;
    notifyListeners();
  }

  // =================== Repository ===================
  BusinessDetailsModel? businessDetailsModel;
  final resendupdateBusinessRepository = BusinessRepository();

  Future<void> uploadBusinessDocuments({
    required BuildContext context, File? logo, File? sign, File? stamp,
  }) async {
    var data = {
      'name': companyController.text.trim(),
      'tagline': taglineController.text.trim(),
      'gstNo': gstnoController.text.trim(),
      'pan': pannoController.text.trim(),
      'email': companyemailController.text.trim(),
      'contactNumber1': number1Controller.text.trim(),
      'address': addressController.text.trim(),
      'city': cityController.text.trim(),
      'website': websideController.text.trim(),
      'accountHolderName': baneficiaryController.text.trim(),
      'bankName': banknameController.text.trim(),
      'accountNo': accountnoController.text.trim(),
      'ifscCode': ifsccodeController.text.trim(),
      'branch': branchController.text.trim(),
      'upiId1': upiId1Controller.text.trim(),
      'googlePayNumber': googlePeController.text.trim(),
      'phonePeNumber': phonePeController.text.trim(),
      'contactNumber2': number2Controller.text.trim(),
      'contactNumber3': number3Controller.text.trim(),
      'contactNumber4': number4Controller.text.trim(),
      'affiliatedBy': affiliatedController.text.trim(),
      'govtRegNo': anynoController.text.trim(),
      'isoCertificateDetails': isoController.text.trim(),
      'landlineNumber': landlineController.text.trim(),
      'jurisdiction': jurisdictionController.text.trim(),
      'tollFreeNumber': tollfreeController.text.trim(),
      'whatsappNumber': whatsappnoController.text.trim(),
    };

    setLoading(true);
    try {
      var response = await resendupdateBusinessRepository.uploadDocuments(
        data: data,
        logoImg: _logoImage,
        signImg: _signatureImage,
        stampImg: _stampImage,
      );

      if (response != null && response.status == true) {
        businessDetailsModel = response;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Business details updated successfully")),
        );
      }
    } catch (e) {
      print("Upload failed: $e");
    }
    setLoading(false);
  }
  // =================== Get Company Data ===================
  // =================== Fetch/Get Business Data ===================
  // =================== Fetch/Get Business Data ===================
  Future<void> fetchBusinessDetails() async {
    setLoading(true); // Show loader
    try {
      // Call repository method to get data
      businessDetailsModel = await resendupdateBusinessRepository.getcomapnydata();

      if (businessDetailsModel != null && businessDetailsModel!.data != null) {
        final data = businessDetailsModel!.data!;

        // =================== Main Details ===================
        companyController.text = data.name ?? '';
        taglineController.text = data.tagline ?? '';
        whatsappnoController.text = data.whatsappNumber ?? '';
        number1Controller.text = data.contactNumber1 ?? '';
        number2Controller.text = data.contactNumber2 ?? '';
        number3Controller.text = data.contactNumber3 ?? '';
        number4Controller.text = data.contactNumber4 ?? '';
        landlineController.text = data.landlineNumber ?? '';
        tollfreeController.text = data.tollFreeNumber ?? '';
        companyemailController.text = data.email ?? '';
        websideController.text = data.website ?? '';
        gstnoController.text = data.gstNo ?? '';
        pannoController.text = data.pan ?? '';
        addressController.text = data.address ?? '';
        cityController.text = data.city ?? '';
        jurisdictionController.text = data.jurisdiction ?? '';

        // =================== Bank Details ===================
        baneficiaryController.text = data.bankDetails?.accountHolderName ?? '';
        banknameController.text = data.bankDetails?.bankName ?? '';
        accountnoController.text = data.bankDetails?.accountNo ?? '';
        ifsccodeController.text = data.bankDetails?.ifscCode ?? '';
        branchController.text = data.bankDetails?.branch ?? '';

        // =================== UPI Details ===================
        upiId1Controller.text = data.upiDetails?.upiId1 ?? '';
        phonePeController.text = data.upiDetails?.phonePeNumber ?? '';
        googlePeController.text = data.upiDetails?.googlePayNumber ?? '';
        upiId2Controller.text = data.upiDetails?.upiId2 ?? '';

        // =================== Other Details ===================
        affiliatedController.text = data.otherDetails?.affiliatedBy ?? '';
        isoController.text = data.otherDetails?.isoCertificateDetails ?? '';
        anynoController.text = data.otherDetails?.govtRegNo ?? '';

        // =================== Images ===================
        // Optionally, you can set image URLs here
        // _logoImage, _signatureImage, _stampImage can be set after downloading the file if needed
        // For example:
        // _logoImage = File.fromUri(Uri.parse(data.logo ?? ''));
      }
    } catch (e) {
      print("Error fetching business details: $e");
    }
    setLoading(false); // Hide loader
  }



}
