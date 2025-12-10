import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../repo/lr_repository.dart';

class LRBillProvider with ChangeNotifier{

  //LR /Bility Details

   TextEditingController lrNumberController = TextEditingController();
   TextEditingController risktypecontroller = TextEditingController();
   TextEditingController lrDateController = TextEditingController();

   //Truck Vehicle Details

   TextEditingController trukNumberController = TextEditingController();
   TextEditingController truckMoveFromController = TextEditingController();
   TextEditingController truckMoveToController = TextEditingController();
   TextEditingController driverNameController = TextEditingController();
   TextEditingController driversPhoneController = TextEditingController();
   TextEditingController driversLicenceController = TextEditingController();

   //Consignor /More From

   TextEditingController consignorNameController = TextEditingController();
   TextEditingController consignorPhoneController = TextEditingController();
   TextEditingController gstinController = TextEditingController();
   TextEditingController stateCodeController = TextEditingController();
   TextEditingController countryController = TextEditingController();
   TextEditingController stateController = TextEditingController();
   TextEditingController cityController = TextEditingController();
   TextEditingController pincodeController = TextEditingController();
   TextEditingController addressController = TextEditingController();

   //Consignee /Move To

   TextEditingController consigneeNameController = TextEditingController();
   TextEditingController consigneePhoneController = TextEditingController();
   TextEditingController toGstinController = TextEditingController();
   TextEditingController toCountryController = TextEditingController();
   TextEditingController toStateController = TextEditingController();
   TextEditingController toCityController = TextEditingController();
   TextEditingController toPincodeController = TextEditingController();
   TextEditingController toAddressController = TextEditingController();

   //Package Details

   TextEditingController packageController = TextEditingController();
   TextEditingController descriptionController = TextEditingController();
   TextEditingController totalWeightController = TextEditingController();
   TextEditingController receiveConditionController = TextEditingController();
   TextEditingController remarkController = TextEditingController();
   TextEditingController weightController = TextEditingController();

   //Payment Details

   TextEditingController freightToBeBilledController = TextEditingController();
   TextEditingController freightPaidController = TextEditingController();
   TextEditingController freightToPayController = TextEditingController();
   TextEditingController totalBasicController = TextEditingController();
   TextEditingController totalLoadingChargeController = TextEditingController();
   TextEditingController unLoadingChargeController = TextEditingController();
   TextEditingController stChargeController = TextEditingController();
   TextEditingController otherChargeController = TextEditingController();
   TextEditingController lrCnChargeController = TextEditingController();
   TextEditingController gstcontroller = TextEditingController();
   TextEditingController gstpaidcontroller = TextEditingController();

   //Material Insurance

   TextEditingController insuranceCompanyController = TextEditingController();
   TextEditingController policyNumberController = TextEditingController();
   TextEditingController insuranceDateController = TextEditingController();
   TextEditingController insuredAmountController = TextEditingController();
   TextEditingController insuranceRiskController = TextEditingController();
   TextEditingController materialInsurancecontroller = TextEditingController();

   //Demurrage Charge

   TextEditingController demurrageChargeController = TextEditingController();

   //E-Way Bill

   TextEditingController goodsValueController = TextEditingController();
   TextEditingController invoiceNumberController = TextEditingController();
   TextEditingController invoiceDateController = TextEditingController();
   TextEditingController ewayBillNumberController = TextEditingController();
   TextEditingController ewayBillGenerateDateController = TextEditingController();
   TextEditingController ewayBillExpireDateController = TextEditingController();
   TextEditingController ewayBillExtendedPeriodController = TextEditingController();
   TextEditingController demurrageChargeapplicableController = TextEditingController();

   String? _riskTypeSelected;

   String? get riskTypeSelected => _riskTypeSelected;

   void setRiskType(String? value) {
     _riskTypeSelected = value;
     notifyListeners();
   }

   String? validateRiskType(String? value) {
     if (value == null || value.isEmpty) {
       return 'Please select a risk type (कृपया एक जोखिम प्रकार चुनें)';
     }
     return null;
   }

   String? _weightUnitOption;

   String? get weightUnitOption => _weightUnitOption;

   void setWeightUnitOption(String? value) {
     _weightUnitOption = value;
     notifyListeners();
   }

   String? validateWeightUnit(String? value) {
     if (value == null || value.isEmpty) {
       return 'Please select a unit (कृपया एक इकाई चुनें)';
     }
     return null;
   }

   void disposeControllers() {
     totalWeightController.dispose();
   }

   String? _gstPaidBy;

   String? get gstPaidBy => _gstPaidBy;

   void setGstPaidBy(String? value) {
     _gstPaidBy = value;
     notifyListeners();
   }

   String? validateGstPaidBy(String? value) {
     if (value == null || value.isEmpty) {
       return 'Please select an option';
     }
     return null;
   }


   String? _materialInsurance;

   String? get materialInsurance => _materialInsurance;

   void setMaterialInsurance(String? value) {
     _materialInsurance = value;
     notifyListeners();
   }

   String? validateMaterialInsurance(String? value) {
     if (value == null || value.isEmpty) {
       return 'Please select an option';
     }
     return null;
   }

   //final TextEditingController demurrageChargeController = TextEditingController();

   // Dropdown value for demurrage charge option
   String? _demurrageChargeOption;

   String? get demurrageChargeOption => _demurrageChargeOption;

   void setDemurrageChargeOption(String? value) {
     _demurrageChargeOption = value;
     notifyListeners();
   }

   String? validateDemurrageOption(String? value) {
     if (value == null || value.isEmpty) {
       return 'Please select a demurrage type';
     }
     return null;
   }

   String? _demurrageApplicableAfter;

   String? get demurrageApplicableAfter => _demurrageApplicableAfter;

   void setDemurrageApplicableAfter(String? value) {
     _demurrageApplicableAfter = value;
     notifyListeners();
   }

   String? validateDemurrageApplicableAfter(String? value) {
     if (value == null || value.isEmpty) {
       return 'Please select an option';
     }
     return null;
   }

   Future<void> lrbill({required String mobileNumber, required BuildContext context}) async {
     final lrbillRepository = LRBillRepository();

     try {
       final requestBody = {
         "formData": {
           "lrDetails": {
             "lrNumber": lrNumberController.text.trim(),
             "risktype": risktypecontroller.text.trim(),
             "lrDate": lrDateController.text.trim(),
           },
           "truckVehicleDetails": {
             "truckVehicleNumber": trukNumberController.text.trim(),
             "truckVehicleMoveForm": truckMoveFromController.text.trim(),
             "truckVehicleMoveTo": truckMoveToController.text.trim(),
             "truckVehicleDriverName": driverNameController.text.trim(),
             "truckVehicleDriverPhoneNumber": driversPhoneController.text.trim(),
             "truckVehicleDriverLicenceNumber": driversLicenceController.text.trim(),
           },
           "moveFrom": {
             "consignorName": consignorNameController.text.trim(),
             "consignorPhone": consignorPhoneController.text.trim(),
             "consignorgstNo": gstinController.text.trim(),
             "consignorStateCode": stateCodeController.text.trim(),
             "consignorCountry": countryController.text.trim(),
             "consignorstate": stateController.text.trim(),
             "consignorcity": cityController.text.trim(),
             "consignorpincode": pincodeController.text.trim(),
             "consignoraddress": addressController.text.trim(),
             "consignorAddress": addressController.text.trim(), // if needed
           },
           "moveTo": {
             "consigneeName": consigneeNameController.text.trim(), // add if you have consignee fields
             "consigneePhone": consigneePhoneController.text.trim(),
             "consigneeCountry": toCountryController.text.trim(),
             "consigneeaddress": toAddressController.text.trim(),
             "consigneecity": toCityController.text.trim(),
             "consigneestate": toStateController.text.trim(),
             "consigneepincode": toPincodeController.text.trim(),
             "consigneegstNo": toGstinController.text.trim(),
           },
           "packageDetails": {
             "packageNumber": packageController.text.trim(),
             "packageDescription": descriptionController.text.trim(),
             "packageActualWeight": weightController.text.trim(),
             "receivePackageCondition": receiveConditionController.text.trim(),
             "packageRemark": remarkController.text.trim(),
             "packageType": "", // Add if available
             "packageChangeWeight": totalWeightController.text.trim(), // Add if available
             "allItemsInGoodCondition": true, // or a boolean value from checkbox
           },
           "paymentDetails": {
             "frightToBeBilled": freightToBeBilledController.text.trim(),
             "frightToPaid": freightPaidController.text.trim(),
             "freightToPay": freightToPayController.text.trim(),
             "totalBaseFreight": totalBasicController.text.trim(),
             "loadingCharge": totalLoadingChargeController.text.trim(),
             "unloadingCharge": unLoadingChargeController.text.trim(),
             "STCharge": stChargeController.text.trim(),
             "otherCharge": otherChargeController.text.trim(),
             "LRCNCharge": lrCnChargeController.text.trim(),
             "paymentGst": gstcontroller.text.trim(), // Add if needed
             "paymentGstPaidBy": gstpaidcontroller.text.trim(), // Add if needed
           },
           "materialInsurance": {
             "insuranceCompany": insuranceCompanyController.text.trim(),
             "policyNumber": policyNumberController.text.trim(),
             "insuranceDate": insuranceDateController.text.trim(),
             "insuranceAmount": insuredAmountController.text.trim(),
             "insuranceRisk": insuranceRiskController.text.trim(),
             "materialInsurance": materialInsurancecontroller.text.trim(), // Add if needed
           },
           "demurrageCharge": {
             "demurrageChargeApplicable": demurrageChargeController.text.trim().toLowerCase() == 'true',
             "chargePerDay": "", // Add if needed
             "moreThanDays": demurrageChargeapplicableController.text.trim(), // Add if needed
           },
           "invoiceEWayBill": {
             "goodValue": goodsValueController.text.trim(),
             "invoicebill": invoiceNumberController.text.trim(),
             "invoiceDate": invoiceDateController.text.trim(),
             "eWayBillNumber": ewayBillNumberController.text.trim(),
             "eWayBillGenerateDate": ewayBillGenerateDateController.text.trim(),
             "eWayBillExpireDate": ewayBillExpireDateController.text.trim(),
             "eWayBillExtendedPeriod": ewayBillExtendedPeriodController.text.trim(),
           }
         }
       };

       final response = await lrbillRepository.businessapi(requestBody);
       print("LrBill submitted successfully: $response");
       if (response != null && response.status == true) {
         // Clear form after success
         lrNumberController.clear();
         lrDateController.clear();
         trukNumberController.clear();
         truckMoveFromController.clear();
         truckMoveToController.clear();
         driverNameController.clear();
         driversPhoneController.clear();
         driversLicenceController.clear();
         consignorNameController.clear();
         consignorPhoneController.clear();
         gstinController.clear();
         stateCodeController.clear();
         countryController.clear();
         stateController.clear();
         cityController.clear();
         pincodeController.clear();
         addressController.clear();
         consigneeNameController.clear();
         consigneePhoneController.clear();
         toGstinController.clear();
         toCountryController.clear();
         toStateController.clear();
         toCityController.clear();
         toPincodeController.clear();
         toAddressController.clear();
         packageController.clear();
         descriptionController.clear();
         totalWeightController.clear();
         receiveConditionController.clear();
         remarkController.clear();
         freightToBeBilledController.clear();
         freightPaidController.clear();
         freightToPayController.clear();
         totalBasicController.clear();
         totalLoadingChargeController.clear();
         unLoadingChargeController.clear();
         stChargeController.clear();
         otherChargeController.clear();
         lrCnChargeController.clear();
         insuranceCompanyController.clear();
         policyNumberController.clear();
         insuranceDateController.clear();
         insuredAmountController.clear();
         insuranceRiskController.clear();
         demurrageChargeController.clear();
         goodsValueController.clear();
         invoiceNumberController.clear();
         invoiceDateController.clear();
         ewayBillNumberController .clear();
         ewayBillGenerateDateController .clear();
         ewayBillExpireDateController.clear();
         ewayBillExtendedPeriodController.clear();




         // Optional: Show success message
         ScaffoldMessenger.of(context).showSnackBar(
           SnackBar(content: Text("Lr-Bilty added successfully!")),
         );

         notifyListeners();
       } else {
         print("Something went wrong");
       }

     } catch (e) {
       print('Error in LrBill: $e');
     }

     notifyListeners();
   }

}

