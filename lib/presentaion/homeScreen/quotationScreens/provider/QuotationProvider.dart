import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/navigation_method.dart';
import '../../home_controller.dart';

import '../model/quotation_model.dart';
import '../repo/quotation_repo.dart';

class QuatationProvider with ChangeNotifier {
  // --- Controllers ---
  TextEditingController quotationNumberController = TextEditingController();
  TextEditingController companyNameController = TextEditingController();
  TextEditingController companyGSTController = TextEditingController();
  TextEditingController partyNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController quotationDateController = TextEditingController();
  TextEditingController packingDateController = TextEditingController();
  TextEditingController shiftingDateController = TextEditingController();
  TextEditingController movingtypecontrooler = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  TextEditingController moveFromCountryController = TextEditingController();
  TextEditingController moveFromStateController = TextEditingController();
  TextEditingController moveFromCityController = TextEditingController();
  TextEditingController moveFromPincodeController = TextEditingController();
  TextEditingController moveFromAddressController = TextEditingController();
  TextEditingController moveformfloorcontoller = TextEditingController();
  TextEditingController moveformliftcontoller = TextEditingController();

  TextEditingController moveToCountryController = TextEditingController();
  TextEditingController moveToStateController = TextEditingController();
  TextEditingController moveToCityController = TextEditingController();
  TextEditingController moveToPincodeController = TextEditingController();
  TextEditingController moveToAddressController = TextEditingController();
  TextEditingController movetocontroller = TextEditingController();
  TextEditingController movetoliftcontoller = TextEditingController();

  TextEditingController freightChargeController = TextEditingController();
  TextEditingController advancePaidController = TextEditingController();
  TextEditingController packingChargeController = TextEditingController();
  TextEditingController unpackingChargeController = TextEditingController();
  TextEditingController loadingChargeController = TextEditingController();
  TextEditingController unloadingChargeController = TextEditingController();
  TextEditingController packingMaterialChargeController = TextEditingController();
  TextEditingController storageChargeController = TextEditingController();
  TextEditingController carBikeTptController = TextEditingController();
  TextEditingController miscChargesController = TextEditingController();
  TextEditingController otherChargesController = TextEditingController();
  TextEditingController stChargeController = TextEditingController();
  TextEditingController octrioTaxController = TextEditingController();
  TextEditingController paymentRemarkController = TextEditingController();
  TextEditingController discountController = TextEditingController();
  TextEditingController gtspershowingcontolller = TextEditingController();
  TextEditingController gsttypecontroller = TextEditingController();
  TextEditingController surchargeController = TextEditingController();
  TextEditingController surchargeController2 = TextEditingController();

  TextEditingController declarationVehicleValueController = TextEditingController();
  TextEditingController vehicleDeclarationValueController = TextEditingController();
  TextEditingController gotDownItemsController = TextEditingController();
  TextEditingController specialNeedsController = TextEditingController();
  TextEditingController insurancetypecontroller = TextEditingController();
  TextEditingController insurancepergstController = TextEditingController();
  TextEditingController InsuranceFOVcontroller = TextEditingController();
  TextEditingController vehicalinsurencecontoller = TextEditingController();
  TextEditingController insuranceChargeController = TextEditingController();
  TextEditingController GSTperController = TextEditingController();
  TextEditingController loadingunlodingcontroller = TextEditingController();
  TextEditingController loadingunloadingorgincontroller = TextEditingController();

  // --- Item Controllers for new item input ---
  TextEditingController itemNameController = TextEditingController();
  TextEditingController itemQuantityController = TextEditingController();
  TextEditingController itemValueController = TextEditingController();
  TextEditingController itemRemarkController = TextEditingController();
  TextEditingController itemCFTController = TextEditingController();
  TextEditingController itemBoxNumberController = TextEditingController();

  QuotationModel? quotationModel;

  // --- Dynamic items list ---
  List<Map<String, dynamic>> itemParticulars = [];

  // --- Add a new item ---
  void addItem({
    required String itemName,
    required String boxNumber,
    required String quantity,
    required String value,
    required String cft,
    required String remark,
  }) {
    itemParticulars.add({
      "itemName": itemName.trim(),
      "boxNumber": boxNumber.trim(),
      "quantity": int.tryParse(quantity.trim()) ?? 0,
      "value": double.tryParse(value.trim()) ?? 0,
      "cft": double.tryParse(cft.trim()) ?? 0,
      "remark": remark.trim(),
    });
    notifyListeners();
  }

  // --- Remove item by index ---
  void removeItem(int index) {
    if (index >= 0 && index < itemParticulars.length) {
      itemParticulars.removeAt(index);
      notifyListeners();
    }
  }

  // --- Clear all items and controllers ---
  void clearItemsAndControllers() {
    itemParticulars.clear();
    itemNameController.clear();
    itemQuantityController.clear();
    itemValueController.clear();
    itemRemarkController.clear();
    itemCFTController.clear();
    itemBoxNumberController.clear();
    notifyListeners();
  }

  // --- Submit quotation with dynamic items ---
  Future<void> quotationdetails({
    required String mobileNumber,
    required BuildContext context,
  }) async {
    final resendupdateQuotationRepository = QuotationRepository();

    String generateQuotationNumber() {
      final now = DateTime.now();
      return "QTN-${now.year}${now.month.toString().padLeft(2, '0')}${now.day.toString().padLeft(2, '0')}${now.hour.toString().padLeft(2, '0')}${now.minute.toString().padLeft(2, '0')}${now.second.toString().padLeft(2, '0')}";
    }

    String newQuotationNumber = generateQuotationNumber();

    try {
      var data = {
        "formData": {
          "quotationDetails": {
            "quotationNumber": quotationNumberController.text.trim(),
            "packingDate": packingDateController.text.trim(),
            "movingType": movingtypecontrooler.text.trim(),
            "companynameofparty": companyNameController.text.trim(),
            "companygstno": companyGSTController.text.trim(),
            "partyname": partyNameController.text.trim(),
            "email": emailController.text.trim(),
            "qtdate": quotationDateController.text.trim(),
            "shiptdate": shiftingDateController.text.trim(),
            "phone": phoneController.text.trim(),
          },
          "moveFrom": {
            "fromcountry": moveFromCountryController.text.trim(),
            "frompincode": moveFromPincodeController.text.trim(),
            "fromaddress": moveFromAddressController.text.trim(),
            "state": moveFromStateController.text.trim(),
            "city": moveFromCityController.text.trim(),
            "fromfloor": moveformfloorcontoller.text.trim(),
            "fromisLiftAvailable": moveformliftcontoller.text.trim(),

          },
          "moveTo": {
            "movecountry": moveToCountryController.text.trim(),
            "state": moveToStateController.text.trim(),
            "city": moveToCityController.text.trim(),
            "movepincode": moveToPincodeController.text.trim(),
            "moveaddress": moveToAddressController.text.trim(),
            "movefloore": movetocontroller.text.trim(),
            "moveisLiftAvailable": movetoliftcontoller.text.trim(),

          },
          "paymentDetails": {
            "freightCharge": freightChargeController.text.trim(),
            "advancePaid": advancePaidController.text.trim(),
            "pakingcharge": packingChargeController.text.trim(),
            "unpakingcharge": unpackingChargeController.text.trim(),
            "lodingcharge": loadingChargeController.text.trim(),
            "unloadingcharge": unloadingChargeController.text.trim(),
            "packingmaterialcharge": packingMaterialChargeController.text.trim(),
            "storgecharge": storageChargeController.text.trim(),
            "carbiketpt": carBikeTptController.text.trim(),
            "miscellaneouscharge": miscChargesController.text.trim(),
            "othercharge": otherChargesController.text.trim(),
            "stcharge": stChargeController.text.trim(),
            "octriogreentax": octrioTaxController.text.trim(),
            "surcharge": surchargeController.text.trim(),
            "surchargevalue": surchargeController2.text.trim(),
            "remark": paymentRemarkController.text.trim(),
            "discount": discountController.text.trim(),
            "gstPercent": gtspershowingcontolller.text.trim(),
            "gsttype": gsttypecontroller.text.trim(),

          },
          "insurance": {
            "type": insurancetypecontroller.text.trim(),
            "percent": insurancepergstController.text.trim(),
            "gst": InsuranceFOVcontroller.text.trim(),
            "declarationvalue": insurancetypecontroller.text.trim(),
          },
          "vehicleInsurance": {
            "type": vehicalinsurencecontoller.text.trim(),
            "percent": insuranceChargeController.text.trim(),
            "gst": GSTperController.text.trim(),
            "declarationvalue": vehicleDeclarationValueController.text.trim(),
          },
          "otherDetails": {
            "loadingunloading": loadingunlodingcontroller.text.trim(),
            "anyiteam": gotDownItemsController.text.trim(),
            "restrictions": loadingunloadingorgincontroller.text.trim(),
            "specialNeeds": specialNeedsController.text.trim()
          },
          "itemParticulars": itemParticulars,
        }
      };

      var response = await resendupdateQuotationRepository.businessapi(data);

      if (response != null && response.status == true) {
        // Clear all after success
        void clearFormData() {
          // Quotation Details
          quotationNumberController.clear();
          packingDateController.clear();
          movingtypecontrooler.clear();
          companyNameController.clear();
          companyGSTController.clear();
          partyNameController.clear();
          emailController.clear();
          quotationDateController.clear();
          phoneController.clear();
          shiftingDateController.clear();

          // Move From
          moveFromCountryController.clear();
          moveFromPincodeController.clear();
          moveFromAddressController.clear();
          moveFromStateController.clear();
          moveFromCityController.clear();
          moveformfloorcontoller.clear();
          moveformliftcontoller.clear();

          // Move To
          moveToCountryController.clear();
          moveToStateController.clear();
          moveToCityController.clear();
          moveToPincodeController.clear();
          moveToAddressController.clear();
          movetocontroller.clear();
          movetoliftcontoller.clear();

          // Payment Details
          freightChargeController.clear();
          advancePaidController.clear();
          packingChargeController.clear();
          unpackingChargeController.clear();
          loadingChargeController.clear();
          unloadingChargeController.clear();
          packingMaterialChargeController.clear();
          storageChargeController.clear();
          carBikeTptController.clear();
          miscChargesController.clear();
          otherChargesController.clear();
          stChargeController.clear();
          octrioTaxController.clear();
          paymentRemarkController.clear();
          discountController.clear();
          gtspershowingcontolller.clear();
          gsttypecontroller.clear();

          // Insurance
          insurancetypecontroller.clear();
          insurancepergstController.clear();
          InsuranceFOVcontroller.clear();
          insurancetypecontroller.clear(); // (⚠️ This is duplicated in your JSON, confirm if correct)

          // Vehicle Insurance
          vehicalinsurencecontoller.clear();
          insuranceChargeController.clear();
          GSTperController.clear();
          vehicleDeclarationValueController.clear();

          // Other Details
          loadingunlodingcontroller.clear();
          gotDownItemsController.clear();
          loadingunloadingorgincontroller.clear();
          specialNeedsController.clear();

          // Item Particulars
          itemParticulars.clear(); // if it's a List, this resets it
        }

        clearItemsAndControllers();
        clearFormData();

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Quotation added successfully!")),
        );

        notifyListeners();
      } else {
        print("Something went wrong");
      }
    } catch (e) {
      print("Exception in quotationdetails: $e");
    }
    notifyListeners();
  }

  // --- Existing dropdowns and other setters ---
  String? selectedMovingType;
  void setMovingType(String? value) {
    selectedMovingType = value;
    notifyListeners();
  }

  String? selectedFromFloor;
  String? selectedFromLiftAvailable;
  void setFromFloor(String? value) {
    selectedFromFloor = value;
    notifyListeners();
  }

  void setFromLiftAvailable(String? value) {
    selectedFromLiftAvailable = value;
    notifyListeners();
  }

  String? selectedToFloor;
  String? selectedToLiftAvailable;
  void setToFloor(String? value) {
    selectedToFloor = value;
    notifyListeners();
  }

  void setToLiftAvailable(String? value) {
    selectedToLiftAvailable = value;
    notifyListeners();
  }

  String? selectedPackingChargeOption;
  void setPackingChargeOption(String? value) {
    selectedPackingChargeOption = value;
    notifyListeners();
  }

  String? unpackingChargeOption;
  String? loadingChargeOption;
  String? unloadingChargeOption;
  String? packingMaterialChargeOption;
  void setUnpackingChargeOption(String val) {
    unpackingChargeOption = val;
    notifyListeners();
  }

  void setLoadingChargeOption(String val) {
    loadingChargeOption = val;
    notifyListeners();
  }

  void setUnloadingChargeOption(String val) {
    unloadingChargeOption = val;
    notifyListeners();
  }

  void setPackingMaterialChargeOption(String val) {
    packingMaterialChargeOption = val;
    notifyListeners();
  }
  String? selectedGstPercent;
  void setGstPercent(String? value) {
    selectedGstPercent = value;
    notifyListeners();
  }

  // --- Validation functions ---
  String? validateMovingType(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select an option (कृपया एक विकल्प चुनें)';
    }
    return null;
  }

  String? validateDropdown(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select an option (कृपया एक विकल्प चुनें)';
    }
    return null;
  }
  String? selectedGstType;
  void setGstType(String? value) {
    selectedGstType = value;
    notifyListeners();
  }
  String? selectedInsuranceChargeValue;
  void setInsuranceChargeValue(String? value) {
    selectedInsuranceChargeValue = value;
    notifyListeners();
  }
  String? selectedInsuranceFOVGst;
  void setInsuranceFOVGst(String? value) {
    selectedInsuranceFOVGst = value;
    notifyListeners();
  }
  String? selectedVehicleInsuranceType;
  void setVehicleInsuranceType(String? value) {
    selectedVehicleInsuranceType = value;
    notifyListeners();
  }
  String? selectedVehicleInsuranceCharge;
  void setVehicleInsuranceCharge(String? value) {
    selectedVehicleInsuranceCharge = value;
    notifyListeners();
  }
  // --- Dispose ---
  void disposeControllers() {
    packingChargeController.dispose();
  }

}


