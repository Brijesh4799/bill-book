import 'package:flutter/cupertino.dart';

import '../get_by_id_model/lr_bilty_getbyid_model.dart';
import '../model/lr_bilty_pdf_model.dart';
import '../repo/lr_bilty_pdf_repository.dart';

class LrBiltyPdfProvider with ChangeNotifier{
  //LR /Bility Details

  TextEditingController lrNumberController = TextEditingController();
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

  //Material Insurance

  TextEditingController insuranceCompanyController = TextEditingController();
  TextEditingController policyNumberController = TextEditingController();
  TextEditingController insuranceDateController = TextEditingController();
  TextEditingController insuredAmountController = TextEditingController();
  TextEditingController insuranceRiskController = TextEditingController();

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

  final LrBiltyRepository _lrBiltyPdfRepository = LrBiltyRepository();

  LrBiltyPdfModel? _lrbitlty;
  LrBiltyPdfModel? get lrbilty => _lrbitlty;
  LrBiltyGetDataByIdModel? _lrBiltyGetDataByIdModel;
  LrBiltyGetDataByIdModel?  lrBiltyGetDataByIdModel;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;


  Future<void> fetchlrbiltyListData() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _lrbitlty = await _lrBiltyPdfRepository. getlrbiltydatadataApi();


    } catch (e) {
      _errorMessage = 'Failed to load lrbilty list: ${e.toString()}';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
  final _repo = LrBiltyRepository();
  Future<bool> deletepacking(String id) async {
    try {
      final result = await _repo.deletelrbiltyById(id);
      if (result.status == true) {
        await fetchlrbiltyListData(); // Refresh the list after deletion
        return true;
      } else {
        print('Delete failed: ${result.message}');
        return false;
      }
    } catch (e) {
      print('Error deleting survey: $e');
      return false;
    }
  }

  Future<LrBiltyPdfModel?> fetchPackingById(String userId, Map<String, dynamic> updateData) async {
    _isLoading = true;
    notifyListeners();

    try {
      Map<String, dynamic> updateData = {
        "formData": {
          "lrDetails": {
            "lrNumber": lrNumberController.text.trim(),
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
            "consignorAddress": addressController.text.trim(),
          },
          "moveTo": {
            "consigneeName": consigneeNameController.text.trim(),
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
            "packageActualWeight": totalWeightController.text.trim(),
            "receivePackageCondition": receiveConditionController.text.trim(),
            "packageRemark": remarkController.text.trim(),

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
            "paymentGst": "",
            "paymentGstPaidBy": "",
          },
          "materialInsurance": {
            "insuranceCompany": insuranceCompanyController.text.trim(),
            "policyNumber": policyNumberController.text.trim(),
            "insuranceDate": insuranceDateController.text.trim(),
            "insuranceAmount": insuredAmountController.text.trim(),
            "insuranceRisk": insuranceRiskController.text.trim(),
            "materialInsurance": "",
          },
          "demurrageCharge": {
            "demurrageChargeApplicable": demurrageChargeController.text.trim().toLowerCase() == 'true',

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

      final response = await _lrBiltyPdfRepository.patchLrBiltyByIdApi(
        userId,
        updateData,
      );

      _lrbitlty = response;
      _isLoading = false;
      notifyListeners();
      return _lrbitlty;
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      print("Error in fetchPackingById: $e");
      return null;
    }
  }
  Future<void> fetchlrbiltyById({required String id}) async {
    _errorMessage = null;

    try {
      // Call API from repository
      lrBiltyGetDataByIdModel = await _lrBiltyPdfRepository.getlrbiltyByIdApi(id);
     // lrBiltyGetDataByIdModel = await _lrBiltyPdfRepository.getlrbiltyByIdApi(id);

      if (lrBiltyGetDataByIdModel != null &&
          lrBiltyGetDataByIdModel!.data != null &&
          lrBiltyGetDataByIdModel!.data!.formData != null) {

        final formData = lrBiltyGetDataByIdModel!.data!.formData!;

        /// LR Details
        if (formData.lrDetails != null) {
          lrNumberController.text = formData.lrDetails!.lrNumber ?? "";
          lrDateController.text = formData.lrDetails!.lrDate ?? "";
        }

        /// Truck Vehicle Details
        if (formData.truckVehicleDetails != null) {
          trukNumberController.text = formData.truckVehicleDetails!.truckVehicleNumber ?? "";
          driverNameController.text = formData.truckVehicleDetails!.truckVehicleDriverName ?? "";
          driversPhoneController.text = formData.truckVehicleDetails!.truckVehicleDriverPhoneNumber ?? "";
          driversLicenceController.text = formData.truckVehicleDetails!.truckVehicleDriverLicenceNumber ?? "";
          truckMoveFromController.text = formData.truckVehicleDetails!.truckVehicleMoveForm ?? "";
          truckMoveToController.text = formData.truckVehicleDetails!.truckVehicleMoveTo ?? "";
        }

        /// Move From
        if (formData.moveFrom != null) {
          consignorNameController.text = formData.moveFrom!.consignorName ?? "";
          consignorPhoneController.text = formData.moveFrom!.consignorPhone ?? "";
          addressController.text = formData.moveFrom!.consignorAddress ?? "";
          cityController.text = formData.moveFrom!.consignorcity ?? "";
          stateController.text = formData.moveFrom!.consignorstate ?? "";
          pincodeController.text = formData.moveFrom!.consignorpincode ?? "";
          gstinController.text = formData.moveFrom!.consignorgstNo ?? "";
          stateCodeController.text = formData.moveFrom!.consignorStateCode ?? "";
          countryController.text = formData.moveFrom!.consignorCountry ?? "";
        }

        /// Move To
        if (formData.moveTo != null) {
          consigneeNameController.text = formData.moveTo!.consigneeName ?? "";
          consigneePhoneController.text = formData.moveTo!.consigneePhone ?? "";
          toCountryController.text = formData.moveTo!.consigneeCountry ?? "";
          toAddressController.text = formData.moveTo!.consigneeaddress ?? "";
          toCityController.text = formData.moveTo!.consigneecity ?? "";
          toStateController.text = formData.moveTo!.consigneestate ?? "";
          toPincodeController.text = formData.moveTo!.consigneepincode ?? "";
          toGstinController.text = formData.moveTo!.consigneegstNo ?? "";

        }

        /// Package Details
        if (formData.packageDetails != null) {
          //packageTypeController.text = formData.packageDetails!.packageType ?? "";
          packageController.text = formData.packageDetails!.packageNumber ?? "";
          descriptionController.text = formData.packageDetails!.packageDescription ?? "";
          totalWeightController.text = formData.packageDetails!.packageActualWeight ?? "";
          remarkController .text = formData.packageDetails!.packageRemark ?? "";
          receiveConditionController .text = formData.packageDetails!.receivePackageCondition ?? "";
        }

        /// Payment Details
        if (formData.paymentDetails != null) {
          freightToBeBilledController.text = formData.paymentDetails!.frightToBeBilled ?? "";
          freightPaidController.text = formData.paymentDetails!.frightToPaid ?? "";
          freightToPayController.text = formData.paymentDetails!.freightToPay ?? "";
          totalBasicController.text = formData.paymentDetails!.totalBaseFreight ?? "";
          totalLoadingChargeController.text = formData.paymentDetails!.loadingCharge ?? "";
          unLoadingChargeController.text = formData.paymentDetails!.unloadingCharge ?? "";
          stChargeController.text = formData.paymentDetails!.sTCharge ?? "";
          otherChargeController.text = formData.paymentDetails!.otherCharge ?? "";
          lrCnChargeController.text = formData.paymentDetails!.lRCNCharge ?? "";
        }
        if (formData.materialInsurance != null) {
          insuranceCompanyController.text = formData.materialInsurance!.insuranceCompany ?? "";
          policyNumberController.text = formData.materialInsurance!.policyNumber ?? "";
          insuranceDateController.text = formData.materialInsurance!.insuranceDate ?? "";
          insuredAmountController.text = formData.materialInsurance!.insuranceAmount ?? "";
          insuranceRiskController.text = formData.materialInsurance!.insuranceRisk ?? "";

        }
        if (formData.demurrageCharge != null) {
          insuranceCompanyController.text = formData.demurrageCharge!.chargePerDay ?? "";
        }
        if (formData.invoiceEWayBill != null) {
          goodsValueController.text = formData.invoiceEWayBill!.goodValue ?? "";
          invoiceNumberController.text = formData.invoiceEWayBill!.invoicebill ?? "";
          invoiceDateController.text = formData.invoiceEWayBill!.invoiceDate ?? "";
          ewayBillNumberController.text = formData.invoiceEWayBill!.eWayBillNumber ?? "";
          ewayBillGenerateDateController.text = formData.invoiceEWayBill!.eWayBillGenerateDate ?? "";
          ewayBillExpireDateController.text = formData.invoiceEWayBill!.eWayBillExpireDate ?? "";
          ewayBillExtendedPeriodController.text = formData.invoiceEWayBill!.eWayBillExtendedPeriod ?? "";
        }
      }
    } catch (e) {
      _errorMessage = 'Failed to load LR Bilty data: ${e.toString()}';
      print(_errorMessage);
    }
  }



}