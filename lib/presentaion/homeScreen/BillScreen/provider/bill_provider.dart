import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../repo/bill_repository.dart';

class BillProvider with ChangeNotifier{

  //Invoice Details

  TextEditingController preInvoiceNumberController = TextEditingController();
  TextEditingController companyNameController = TextEditingController();
  TextEditingController lrNumberController = TextEditingController();
  TextEditingController invoiceDateController = TextEditingController();
  TextEditingController deliveryDateController = TextEditingController();
  TextEditingController movingPathController = TextEditingController();
  TextEditingController shipmentTypeController = TextEditingController();
  TextEditingController movingPathRemarkController = TextEditingController();
  TextEditingController moveFromController = TextEditingController();
  TextEditingController moveToController = TextEditingController();
  TextEditingController vehicleNumberController = TextEditingController();

  //Billing Details

  TextEditingController billToNameController = TextEditingController();
  TextEditingController billToPhoneController = TextEditingController();
  TextEditingController billToGstinController = TextEditingController();
  TextEditingController billToCountryController = TextEditingController();
  TextEditingController billToStateController = TextEditingController();
  TextEditingController billToCityController = TextEditingController();
  TextEditingController billToPincodeController = TextEditingController();
  TextEditingController billToAddressController = TextEditingController();

  //Consignor Details

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

  //Package Controller

  TextEditingController packageController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController totalWeightController = TextEditingController();
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
  TextEditingController weightUnitController = TextEditingController();
  TextEditingController gstController = TextEditingController();
  TextEditingController gstPercentageController = TextEditingController();
  TextEditingController gstTypeController = TextEditingController();
  TextEditingController reverseChargeController = TextEditingController();
  TextEditingController gstPaidByController = TextEditingController();
  TextEditingController insuranceTypeController = TextEditingController();
  TextEditingController insuranceChargePercentController = TextEditingController();
  TextEditingController gstValueController = TextEditingController();

  //Insurens Details

  TextEditingController declarationGoodsValueController = TextEditingController();

  //Vahical Insurens Details

  TextEditingController declarationVehicleValueController = TextEditingController();
  TextEditingController vehicleInsuranceTypeController = TextEditingController();
  TextEditingController vehicleInsuranceChargePercentController = TextEditingController();
  TextEditingController vehicleGstValueController = TextEditingController();

  Future<void> billprovider({required String mobileNumber, required BuildContext context}) async {
    final billRepository = BillRepository();
    try {
      final requestBody = {
        "formData": {
          "invoiceDetails": {
            "invoiceNumber": preInvoiceNumberController.text.trim(),
            "invoiCecompanyName": companyNameController.text.trim(),
            "invoiceLRNumber": lrNumberController.text.trim(),
            "invoiceDate": invoiceDateController.text.trim(),
            "invoiceDeliveryDate": deliveryDateController.text.trim(),
            "invoiceMovingPath": movingPathController.text.trim(),
            "invoiceShipmentType": shipmentTypeController.text.trim(),
            "invoiceMovicePathRemark": movingPathRemarkController.text.trim(),
            "invoiceMovePath": moveFromController.text.trim(),
            "invoiceMoveTo": moveToController.text.trim(),
            "invoiceVehicleNumber": vehicleNumberController.text.trim(),
          },
          "billingDetails": {
            "customerName": billToNameController.text.trim(),
            "customerPhone": billToPhoneController.text.trim(),
            "billgstNo": billToGstinController.text.trim(),
            "billCountry": billToCountryController.text.trim(),
            "billstate": billToStateController.text.trim(),
            "billcity": billToCityController.text.trim(),
            "billpincode": billToPincodeController.text.trim(),
            "billaddress": billToAddressController.text.trim(),
          },
          "consignorDetails": {
            "consignorName": consignorNameController.text.trim(),
            "consignorPhone": consignorPhoneController.text.trim(),
            "consignorgstNo": consignorGstinController.text.trim(),
            "consignorCountry": consignorCountryController.text.trim(),
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
            "packagedescription": descriptionController.text.trim(),
            "packagetotalWeight": weightUnitController.text.trim(),
            "packagetotalWeight": totalWeightController.text.trim(),
            "packageHSN": receiveConditionController.text.trim(),
            "packageRemark": remarkController.text.trim(),
          },
          "paymentDetails": {
            "freightCharges": freightChargeController.text.trim(),
            "advancePaid": advancePaidController.text.trim(),
            "packingCharge": packingChargeController.text.trim(),
            "unPackingCharge": unpackingChargeController.text.trim(),
            "paymentMode": "Bank Transfer", // or dynamic if available
            "unloadingCharges": unloadingChargeController.text.trim(),
            "loadingCharges": loadingChargeController.text.trim(),
            "packingMaterialCharge": packingMaterialChargeController.text.trim(),
            "packingStorgeCharge": storageChargeController.text.trim(),
            "packingCarBikeTPT": carBikeTptController.text.trim(),
            "packingMiscellaneous": miscChargesController.text.trim(),
            "otherCharges": otherChargesController.text.trim(),
            "packingSTCharge": stChargeController.text.trim(),
            "packingGreenTax": octrioTaxController.text.trim(),
            "packingSurcharge": surchargeController.text.trim(),
             // or from a controller if dynamic
            "packingGstShow": gstController.text.trim(),     // or from a controller if needed
            "packingGstNo": gstPercentageController,     // or from a controller if needed
            "packingGstType": gstTypeController.text.trim(),  // or from a controller
            "packingReverseCharge": reverseChargeController.text.trim(),
            "packingGstPaidBy": gstPaidByController.text.trim(),
            "packingPaymentRemark": paymentRemarkController.text.trim(),
            "packingDiscountAmount": discountController.text.trim(),
            "totalAmount": "720" // add dynamic calculation if needed
          },
          "insuranceDetails": {
            "insuranceType": insuranceTypeController.text.trim(), // or dynamic
            "insuranceCharges": insuranceChargePercentController.text.trim(),     // or from controller
            "insuranceCharges1": gstValueController.text.trim(),     // or from controller
            "declarationValueOfGoods": declarationGoodsValueController.text.trim(),
          },
          "vehicleInsuranceDetails": {
            "vehicleNumber": vehicleInsuranceTypeController.text.trim(),
            "insuranceType": vehicleInsuranceChargePercentController.text.trim(),
            "insuranceType": vehicleGstValueController.text.trim(),
            "insuranceCharges": declarationVehicleValueController.text.trim(),
          }
        }
      };

      var response = await billRepository.businessapi(requestBody);
      print("Bill sent successfully: $response");
      if (response != null && response.status == true) {
        // Clear form after success
        preInvoiceNumberController.clear();
        companyNameController.clear();
        lrNumberController.clear();
        invoiceDateController.clear();
        deliveryDateController.clear();
        movingPathController.clear();
        shipmentTypeController.clear();
        movingPathRemarkController.clear();
        moveFromController.clear();
        moveToController.clear();
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

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Bill added successfully!")),
        );

        notifyListeners();
      } else {
        print("Something went wrong");
      }

    } catch (e) {
      print('Error sending bill: $e');
    }
    notifyListeners();
  }


}

