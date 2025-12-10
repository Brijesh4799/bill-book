import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../repo/proforma_invoice_repository.dart';

class ProformaInvoiceProvider with ChangeNotifier{

 // final TextEditingController packingChargeController = TextEditingController();

  // Dropdown selected value
  String? _packingChargeOption;

  String? get packingChargeOption => _packingChargeOption;

  void setPackingChargeOption(String? value) {
    _packingChargeOption = value;
    notifyListeners();
  }

  String? validatePackingCharge(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select a charge type';
    }
    return null;
  }

  void disposeControllers() {
    packingChargeController.dispose();
    // dispose other controllers if needed
  }

  String? _unpackingChargeOption;

  String? get unpackingChargeOption => _unpackingChargeOption;

  void setUnpackingChargeOption(String? value) {
    _unpackingChargeOption = value;
    notifyListeners();
  }

  String? validateUnpackingCharge(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select a charge type';
    }
    return null;
  }


  String? _loadingChargeOption;

  String? get loadingChargeOption => _loadingChargeOption;

  void setLoadingChargeOption(String? value) {
    _loadingChargeOption = value;
    notifyListeners();
  }

  String? validateLoadingCharge(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select a charge type';
    }
    return null;
  }

  String? _unloadingChargeOption;

  String? get unloadingChargeOption => _unloadingChargeOption;

  void setUnloadingChargeOption(String? value) {
    _unloadingChargeOption = value;
    notifyListeners();
  }

  String? validateUnloadingCharge(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select a charge type';
    }
    return null;
  }

  String? _packingMaterialChargeOption;

  String? get packingMaterialChargeOption => _packingMaterialChargeOption;

  void setPackingMaterialChargeOption(String? value) {
    _packingMaterialChargeOption = value;
    notifyListeners();
  }

  String? validatePackingMaterialCharge(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select a charge type';
    }
    return null;
  }

  String? _surchargeOption;

  String? get surchargeOption => _surchargeOption;

  void setSurchargeOption(String? value) {
    _surchargeOption = value;
    notifyListeners();
  }

  String? _gstOption;

  String? get gstOption => _gstOption;
  void setGstOption(String? value) {
    _gstOption = value;
    notifyListeners();
  }




  final TextEditingController totalWeightController = TextEditingController();

  // Dropdown value for weight unit
  String? _totalWeightUnit;

  String? get totalWeightUnit => _totalWeightUnit;

  void setTotalWeightUnit(String? value) {
    _totalWeightUnit = value;
    notifyListeners();
  }

  String? validateTotalWeightUnit(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select a weight unit';
    }
    return null;
  }


  //pre Invoice Details

  TextEditingController preInvoiceNumberController =
  TextEditingController();
  TextEditingController companyNameController = TextEditingController();
  TextEditingController invoiceDateController = TextEditingController();
  TextEditingController deliveryDateController = TextEditingController();
  TextEditingController shipmentTypeController = TextEditingController();
  TextEditingController movingPathRemarkController = TextEditingController();
  TextEditingController moveFromController = TextEditingController();
  TextEditingController moveToControllerr = TextEditingController();
  TextEditingController vehicleNumberController = TextEditingController();
  TextEditingController gstShowHideController = TextEditingController();

  //bill Details

  TextEditingController billToNameController = TextEditingController();
  TextEditingController billToPhoneController = TextEditingController();
  TextEditingController billToGstinController = TextEditingController();
  TextEditingController billToCountryController = TextEditingController();
  TextEditingController billToStateController = TextEditingController();
  TextEditingController billToCityController = TextEditingController();
  TextEditingController billToPincodeController = TextEditingController();
  TextEditingController billToAddressController = TextEditingController();
  TextEditingController gstTypeController = TextEditingController();

  //Consignor Name

  TextEditingController consignorNameController = TextEditingController();
  TextEditingController consignorPhoneController = TextEditingController();
  TextEditingController consignorGstinController = TextEditingController();
  TextEditingController consignorCountryController = TextEditingController();
  TextEditingController consignorStateController = TextEditingController();
  TextEditingController consignorCityController = TextEditingController();
  TextEditingController consignorPincodeController = TextEditingController();
  TextEditingController consignorAddressController = TextEditingController();

  //Consignee Details

  TextEditingController consigneeNameController = TextEditingController();
  TextEditingController consigneePhoneController = TextEditingController();
  TextEditingController consigneeGstinController = TextEditingController();
  TextEditingController consigneeCountryController = TextEditingController();
  TextEditingController consigneeStateController = TextEditingController();
  TextEditingController consigneeCityController = TextEditingController();
  TextEditingController consigneePincodeController = TextEditingController();
  TextEditingController consigneeAddressController = TextEditingController();
  TextEditingController gstPercentageController = TextEditingController();

  //Package Details

  TextEditingController packageController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  //TextEditingController totalWeightController = TextEditingController();
  TextEditingController receiveConditionController = TextEditingController();
  TextEditingController remarkController = TextEditingController();

  //Payment Details

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
  TextEditingController surchargeController = TextEditingController();
  TextEditingController paymentRemarkController = TextEditingController();
  TextEditingController discountController = TextEditingController();
  TextEditingController declarationGoodsValueController = TextEditingController();
  TextEditingController reverseChargeController = TextEditingController();
  TextEditingController gstPaidByController = TextEditingController();


  //InsuranceDetailsTile

  TextEditingController declarationVehicleValueController = TextEditingController();

  Future<void> proformainvoice({required String mobileNumber, required BuildContext context}) async {
    final updateProformainvoiceRepository = ProformaInvoiceRepository();

    try {
      final requestBody = {
        "formData": {
          "preInvoiceDetails": {
            "preInvoiceNumber": preInvoiceNumberController.text.trim(),
            "preCompanyName": companyNameController.text.trim(),
            "preInvoiceDate": invoiceDateController.text.trim(),
            "preDeliveryDate": deliveryDateController.text.trim(),
            "preGst": "", // Add GST if available
            "Shipment": shipmentTypeController.text.trim(),
            "gstShow": gstShowHideController.text.trim(), // Hardcoded or bind to a switch
            "typeShipment": shipmentTypeController.text.trim(), // Add if different from Shipment
            "movingPathRemark": movingPathRemarkController.text.trim(),
            "moveFrom": moveFromController.text.trim(),
            "moveto": moveToControllerr.text.trim(),
            "vehicleNumber": vehicleNumberController.text.trim(),
          },
          "billingDetails": {
            "customerName": billToNameController.text.trim(),
            "customerPhone": billToPhoneController.text.trim(),
            "customerGstNumber": billToGstinController.text.trim(),
            "customerCountry": billToCountryController.text.trim(),
            "customerstate": billToStateController.text.trim(),
            "customercity": billToCityController.text.trim(),
            "customerpincode": billToPincodeController.text.trim(),
            "customeraddress": billToAddressController.text.trim(),
            "customergstNo": billToGstinController.text.trim(),
          },
          "consignorDetails": {
            "consignorName": consignorNameController.text.trim(),
            "consignorPhone": consignorPhoneController.text.trim(),
            "consignorgstNo": consignorGstinController.text.trim(),
            "consignorcountry": consignorCountryController.text.trim(),
            "consignorstate": consignorStateController.text.trim(),
            "consignorcity": consignorCityController.text.trim(),
            "consignorpincode": consignorPincodeController.text.trim(),
            "consignoraddress": consignorAddressController.text.trim(),
          },
          "consigneeDetails": {
            "consigneeName": consigneeNameController.text.trim(),
            "consigneePhone": consigneePhoneController.text.trim(),
            "consigneegstNo": consigneeGstinController.text.trim(),
            "consigneeCountry": consigneeCountryController.text.trim(),
            "consigneestate": consigneeStateController.text.trim(),
            "consigneecity": consigneeCityController.text.trim(),
            "consigneepincode": consigneePincodeController.text.trim(),
            "consigneeaddress": consigneeAddressController.text.trim(),
          },
          "packageDetails": {
            "packageType": packageController.text.trim(),
            "description": descriptionController.text.trim(),
            "totalWeightUnit": totalWeightController.text.trim(),
            "totalWeight": totalWeightController.text.trim(), // If needed separately from unit
            "hsnCode": receiveConditionController.text.trim(),
            "detailsremark": remarkController.text.trim(),
          },
          "paymentDetails": {
            "freightCharge": freightChargeController.text.trim(),
            "advancePaid": advancePaidController.text.trim(),
            "packingCharge": packingChargeController.text.trim(),
            "unPackedCharge": unpackingChargeController.text.trim(),
            "loadingCharges": loadingChargeController.text.trim(),
            "unloadingCharges": unloadingChargeController.text.trim(),
            "packingMaterialCharge": packingMaterialChargeController.text.trim(),
            "storgeCharge": storageChargeController.text.trim(),
            "carBikeTPT": carBikeTptController.text.trim(),
            "miscellaneousCharge": miscChargesController.text.trim(),
            "otherCharges": otherChargesController.text.trim(),
            "stCharge": stChargeController.text.trim(),
            "greenTax": octrioTaxController.text.trim(),
            "surcharge": surchargeController.text.trim(),
            "paymentRemark": paymentRemarkController.text.trim(),
            "paymentDiscount": discountController.text.trim(),
            "gstShow": gstShowHideController.text.trim(),
            "paymentGstNo": gstPercentageController.text.trim(), // If available
            "paymentGstType": gstTypeController.text.trim(), // e.g., "cgst"
            "reverseCharge": reverseChargeController.text.trim(),
            "gstPaidBy": gstPaidByController.text.trim(),
            "paymentMode": "Bank Transfer", // if available in your UI
          },
          "insuranceDetails": {
            "insuranceType": "Full Cover", // or bind to dropdown
            "insuranceCharges": declarationVehicleValueController.text.trim(),
            "insuranceGst": "", // if applicable
            "declarationValueOfGoods": declarationGoodsValueController.text.trim(),
          },
          "vehicleInsuranceDetails": {
            "vehicleNumber": vehicleNumberController.text.trim(),
            "vehicleGst": "", // if applicable
            "insuranceType": "Comprehensive",
            "insuranceCharges": "300", // Example or bind from input
          }
        }
      };

      var response = await updateProformainvoiceRepository.businessapi(requestBody);
      print("Proforma Invoice submitted: $response");
      if (response != null && response.status == true) {
        // Clear form after success
        preInvoiceNumberController.clear();
        companyNameController.clear();
        invoiceDateController.clear();
        deliveryDateController.clear();
        shipmentTypeController.clear();
        movingPathRemarkController.clear();
        moveFromController.clear();
        moveToControllerr.clear();
        vehicleNumberController.clear();
        billToNameController.clear();
        billToPhoneController.clear();
        billToGstinController.clear();
        billToCountryController.clear();
        billToStateController.clear();
        billToCityController.clear();
        billToPincodeController.clear();
        billToAddressController.clear();
        consignorNameController.clear();
        consignorPhoneController.clear();
        consignorGstinController.clear();
        consignorCountryController.clear();
        consignorStateController.clear();
        consignorCityController.clear();
        consignorPincodeController.clear();
        consignorAddressController.clear();
        consigneeNameController.clear();
        consigneePhoneController.clear();
        consigneeGstinController.clear();
        consigneeCountryController.clear();
        consigneeStateController.clear();
        consigneeCityController.clear();
        consigneePincodeController.clear();
        consigneeAddressController.clear();
        packageController.clear();
        descriptionController.clear();
        totalWeightController.clear();
        receiveConditionController.clear();
        remarkController.clear();
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
        surchargeController.clear();
        paymentRemarkController.clear();
        discountController.clear();
        declarationGoodsValueController.clear();
        declarationVehicleValueController.clear();





        // Optional: Show success message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Proforma added successfully!")),
        );

        notifyListeners();
      } else {
        print("Something went wrong");
      }
    } catch (e) {
      print('update the proformainvoice $e');
    }

    notifyListeners();
  }


}
