/*
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../model/business_details_model.dart';
import '../repo/business_repo.dart';
class BusinessProvider with ChangeNotifier{

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

  //Bank Details

  TextEditingController baneficiaryController = TextEditingController();
  TextEditingController banknameController = TextEditingController();
  TextEditingController accountnoController = TextEditingController();
  TextEditingController ifsccodeController = TextEditingController();
  TextEditingController branchController = TextEditingController();

  //Upi Details

  TextEditingController upiId1Controller = TextEditingController();
  TextEditingController phonePeController = TextEditingController();
  TextEditingController googlePeController = TextEditingController();
  TextEditingController upiId2Controller = TextEditingController();

  //Other Details

  TextEditingController affiliatedController = TextEditingController();
  TextEditingController isoController = TextEditingController();
  TextEditingController anynoController = TextEditingController();

  bool _loading = false;
  bool get loading => _loading;

  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }
  BusinessDetailsModel?businessDetailsModel;
  final resendupdateBusinessRepository = BusinessRepository();
  Future<void> uploadBusinessDocuments({

    File? logo,
    File? sign,
    File? stamp,

    required BuildContext context,
  }) async {
    var data={
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
        logoImg: logo,
        signImg: sign,
        stampImg: stamp,

      );
      // Show success toast/snackbar
  if(response!.status==true){
    businessDetailsModel=response;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Update >>>>>>>>data success")),
    );
  }
    } catch (e) {
      print("Upload failed:>>>>>>>>>>>>>>> $e");

    }
    setLoading(false);
  }

}*/


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
}
