import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';

import '../get_byid_model/bill_get_byId_model.dart';
import '../model/bill_pdf_model.dart';
import '../repo/bill_pdf_repository.dart';

class BillPdfProvider with ChangeNotifier {

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


  final BillPdfRepository _billPdfRepository = BillPdfRepository();

  BillPdfModel? _billList;
  BillPdfModel? get billList => _billList;

  BillPdfModel? _billPdf;
  BillPdfModel? get billPdf => _billPdf;

  BillGetDataByIdModel? billGetDataByIdModel;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  // Future<void> billListData() async {
  //   _isLoading = true;
  //   _errorMessage = null;
  //   notifyListeners();
  //   try {
  //     _billList = await _billPdfRepository.getbilldatadataApi();
  //   } catch (e) {
  //     _errorMessage = 'Failed to load survey list: ${e.toString()}';
  //   } finally {
  //     _isLoading = false;
  //     notifyListeners();
  //   }
  // }


  bool isLoading2 = false;
  bool loading = false;
  bool isLoadMoreRunning = false;
  bool hasNextPage = true;
  int page = 1;
  void setLoading(bool loader) {
    loading = loader;
    notifyListeners();
  }
  Future<void> billListData({bool isLoadMore = false}) async {
    if (!isLoadMore) {
      page = 1;
      hasNextPage = true;
      _billList = null;
      setLoading(true);
    } else {
      if (isLoadMoreRunning || !hasNextPage) return;
      isLoadMoreRunning = true;
      notifyListeners();
    }
    try {
      final response = await _billPdfRepository.getbilldatadataApi(pageCount: page);
      if (response.status == true &&
          response.data != null &&
          response.data!.isNotEmpty) {
        if (isLoadMore) {
          _billList!.data!.addAll(response.data!);
        } else {
          _billList = response;
        }
        page++;
      } else {
        hasNextPage = false;
      }
    } catch (e) {
      print("Pagination Error: $e");
      hasNextPage = false;
    } finally {
      if (!isLoadMore) {
        setLoading(false);
      } else {
        isLoadMoreRunning = false;
        notifyListeners();
      }
    }
  }

  final _repo = BillPdfRepository();

  Future<bool> deletebill(String id) async {
    try {
      final result = await _repo.deleteBillById(id);
      if (result.status == true) {
        await billListData();
        return true;
      } else {
        print('Delete failed: ${result.message}');
        return false;
      }
    } catch (e) {
      print('Error deleting bill: $e');
      return false;
    }
  }

  Future<BillPdfModel?> updateBillById(String billId) async {
    _isLoading = true;
    notifyListeners();

    try {
      // Build request body
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
            "packagetotalWeight": totalWeightController.text.trim(),
            "packageHSN": receiveConditionController.text.trim(),
            "packageRemark": remarkController.text.trim(),
          },
          "paymentDetails": {
            "freightCharges": freightChargeController.text.trim(),
            "advancePaid": advancePaidController.text.trim(),
            "packingCharge": packingChargeController.text.trim(),
            "unPackingCharge": unpackingChargeController.text.trim(),
            "paymentMode": "Bank Transfer",
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
            "packingGstShow": "hide",
            "packingGstNo": "789",
            "packingGstType": "main",
            "packingReverseCharge": "89",
            "packingGstPaidBy": "anidjd",
            "packingPaymentRemark": paymentRemarkController.text.trim(),
            "packingDiscountAmount": discountController.text.trim(),
            "totalAmount": "720"
          },
          "insuranceDetails": {
            "insuranceType": "Full Cover",
            "insuranceCharges": "200",
            "declarationValueOfGoods": "5000"
          },
          "vehicleInsuranceDetails": {
            "vehicleNumber": "VHC123",
            "insuranceType": "Comprehensive",
            "insuranceCharges": "300"
          }
        }
      };

      // Call API
      _billPdf = await _billPdfRepository.patchbillByIdApi(billId, requestBody);

      // Optionally update controllers
      if (_billPdf?.data != null && _billPdf!.data!.isNotEmpty) {
        final formData = _billPdf!.data!.first.formData;
        preInvoiceNumberController.text = formData?.invoiceDetails?.invoiceNumber ?? "";
      }

      return _billPdf;
    } catch (e) {
      print("Error updating bill: $e");
      return null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }


  Future<void> fetchbillById({required String id}) async {
    _errorMessage = null;

    try {
      // Use correct repository instance
      billGetDataByIdModel = await _billPdfRepository.getbillByIdApi(id);

      if (billGetDataByIdModel != null &&
          billGetDataByIdModel!.data != null) {
        final customer = billGetDataByIdModel!.data!.formData?.billingDetails;

        if (customer != null) {
          billToNameController.text = customer.customerName ?? "";
          billToPhoneController.text = customer.customerPhone ?? "";
          billToAddressController.text = customer.billaddress ?? "";
          billToCityController.text = customer.billcity ?? "";
          billToStateController.text = customer.billstate ?? "";
          billToPincodeController.text = customer.billpincode ?? "";
          billToGstinController.text = customer.billgstNo ?? "";
          billToCountryController.text = customer.billCountry ?? "";

        }
        final customer1 = billGetDataByIdModel!.data!.formData?.consignorDetails;

        if (customer1 != null) {
          consignorNameController.text = customer1.consignorName ?? "";
          consignorPhoneController.text = customer1.consignorPhone ?? "";
          consignorAddressController.text = customer1.consignoraddress ?? "";
          consignorCityController.text = customer1.consignorcity ?? "";
          consignorStateController.text = customer1.consignorstate ?? "";
          consignorPincodeController.text = customer1.consignorpincode?? "";
          consignorGstinController.text = customer1.consignorgstNo ?? "";
          consignorCountryController.text = customer1.consignorCountry ?? "";
        }
        final customer2 = billGetDataByIdModel!.data!.formData?.consigneeDetails;

        if (customer2 != null) {
          consigneeNameController.text = customer2.consigneeName ?? "";
          consigneePhoneController.text = customer2.consigneePhone ?? "";
          consigneeAddressController.text = customer2.consigneeaddress ?? "";
          consigneeCityController.text = customer2.consigneecity?? "";
          consigneeStateController.text = customer2.consigneestate?? "";
          consigneePincodeController.text = customer2.consigneepincode ?? "";
          consigneeGstinController.text = customer2.consigneegstNo ?? "";
          consigneeCountryController.text = customer2.consigneeCountry ?? "";

        }

        final customer4 = billGetDataByIdModel!.data!.formData?.packageDetails;

        if (customer4 != null) {
          packageController.text = customer4.packageType ?? "";
          totalWeightController.text = customer4.packagetotalWeight ?? "";
          descriptionController.text = customer4.packagedescription ?? "";
          receiveConditionController.text = customer4.packageHSN ?? "";
          remarkController.text = customer4.packageRemark ?? "";


        }

        final customer3 = billGetDataByIdModel!.data!.formData?.paymentDetails;

        if (customer3 != null) {
          freightChargeController.text = customer3.freightCharges ?? "";
          advancePaidController.text = customer3.advancePaid ?? "";
          packingChargeController.text = customer3.packingCharge ?? "";
          unpackingChargeController.text = customer3.unPackingCharge ?? "";
          unloadingChargeController.text = customer3.unloadingCharges ?? "";
          loadingChargeController.text = customer3.loadingCharges ?? "";
          packingMaterialChargeController.text = customer3.packingMaterialCharge ?? "";
          storageChargeController.text = customer3.packingStorgeCharge ?? "";
          carBikeTptController.text = customer3.packingCarBikeTPT ?? "";
          miscChargesController.text = customer3.packingMiscellaneous ?? "";
          otherChargesController.text = customer3.otherCharges ?? "";
          stChargeController.text = customer3.packingSTCharge ?? "";
          octrioTaxController.text = customer3.packingGreenTax ?? "";
          surchargeController.text = customer3.packingSurcharge ?? "";
          paymentRemarkController.text = customer3.packingPaymentRemark ?? "";
          discountController.text = customer3.packingDiscountAmount ?? "";
        }

        final invoice = billGetDataByIdModel!.data!.formData?.invoiceDetails;

        if (invoice != null) {
          preInvoiceNumberController.text = invoice.invoiceNumber ?? "";
          companyNameController.text = invoice.invoiCecompanyName ?? "";
          lrNumberController.text = invoice.invoiceLRNumber ?? "";
          invoiceDateController.text = invoice.invoiceDate ?? "";
          deliveryDateController.text = invoice.invoiceDeliveryDate ?? "";
          movingPathController.text = invoice.invoiceMovingPath ?? "";
          shipmentTypeController.text = invoice.invoiceShipmentType ?? "";
          movingPathRemarkController.text = invoice.invoiceMovicePathRemark ?? "";
          moveFromController.text = invoice.invoiceMovePath ?? "";
          moveToController.text = invoice.invoiceMoveTo ?? "";
          vehicleNumberController.text = invoice.invoiceVehicleNumber ?? "";
        }
      }
    } catch (e) {
      _errorMessage = 'Failed to load packing data: ${e.toString()}';
      print(_errorMessage);
    }
  }


  String? pdfLocalPath;
  bool pdfLoading = false;
  String? _errorMessage2;

  String? get errorMessage2 => _errorMessage2;

  Future<void> fetchbillPdf(String id) async {
    pdfLoading = true;
    _errorMessage2 = null;
    notifyListeners();

    try {
      final responseBytes = await  _billPdfRepository.billpdfApi(id);

      if (responseBytes != null) {
        // Save PDF in temporary directory
        final dir = await getTemporaryDirectory();
        final file = File('${dir.path}/bill_$id.pdf');
        await file.writeAsBytes(responseBytes);

        pdfLocalPath = file.path;
        print("✅ PDF saved at: $pdfLocalPath");
      } else {
        _errorMessage2 = "Empty PDF response";
      }
    } catch (e) {
      _errorMessage2 = "Failed to fetch PDF: $e";
      print(_errorMessage2);
    } finally {
      pdfLoading = false;
      notifyListeners();
    }
  }


}
