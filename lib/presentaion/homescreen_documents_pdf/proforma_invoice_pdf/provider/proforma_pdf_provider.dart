



import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';

import '../get_byid_model/proforma_getbyid_model.dart';
import '../model/proforma_pdf_model.dart';
import '../repo/proforma_pdf_repository.dart';

class ProformaPdfProvider with ChangeNotifier{
  TextEditingController preInvoiceNumberController =
  TextEditingController(text: '0001');
  TextEditingController companyNameController = TextEditingController();
  TextEditingController invoiceDateController = TextEditingController();
  TextEditingController deliveryDateController = TextEditingController();
  TextEditingController shipmentTypeController = TextEditingController();
  TextEditingController movingPathRemarkController = TextEditingController();
  TextEditingController moveFromController = TextEditingController();
  TextEditingController moveToControllerr = TextEditingController();
  TextEditingController vehicleNumberController = TextEditingController();

  //bill Details

  TextEditingController billToNameController = TextEditingController();
  TextEditingController billToPhoneController = TextEditingController();
  TextEditingController billToGstinController = TextEditingController();
  TextEditingController billToCountryController = TextEditingController();
  TextEditingController billToStateController = TextEditingController();
  TextEditingController billToCityController = TextEditingController();
  TextEditingController billToPincodeController = TextEditingController();
  TextEditingController billToAddressController = TextEditingController();

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

  //Package Details

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
  TextEditingController declarationGoodsValueController = TextEditingController();


  //InsuranceDetailsTile

  TextEditingController declarationVehicleValueController = TextEditingController();

  final ProformaPdfRepository _proformaPdfRepository = ProformaPdfRepository();

  PeoformaPdfModel? _proformalist;
  PeoformaPdfModel? get proformaList => _proformalist;
  ProformaGetDataByIdModel? proformaGetDataByIdModel;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;


  // Future<void> fetchProformaData() async {
  //   _isLoading = true;
  //   _errorMessage = null;
  //   notifyListeners();
  //   try {
  //     _proformalist = await _proformaPdfRepository.getProformaData();
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
  Future<void> fetchProformaData({bool isLoadMore = false}) async {
    if (!isLoadMore) {
      page = 1;
      hasNextPage = true;
      _proformalist = null;
      setLoading(true);
    } else {
      if (isLoadMoreRunning || !hasNextPage) return;
      isLoadMoreRunning = true;
      notifyListeners();
    }
    try {
      final response = await _proformaPdfRepository.getProformaData(pageCount: page);
      if (response.status == true &&
          response.data != null &&
          response.data!.isNotEmpty) {
        if (isLoadMore) {
          _proformalist!.data!.addAll(response.data!);
        } else {
          _proformalist = response;
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







  final _repo = ProformaPdfRepository();
  Future<bool> deleteproforma(String id) async {
    try {
      final result = await _repo.deleteproformaById(id);
      if (result.status == true) {
        await fetchProformaData(); // Refresh the list after deletion
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
  Future<PeoformaPdfModel?> fetchProformaById(
      String userId,
      Map<String, dynamic> updateData,
      ) async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await _proformaPdfRepository.patchproformaByIdApi(userId, updateData);
      _proformalist = response;

      if (_proformalist?.data?.isNotEmpty == true) {
        final formData = _proformalist!.data!.first.formData;

        // ================== preInvoiceDetails ==================
        final pre = formData?.preInvoiceDetails;
        preInvoiceNumberController.text = pre?.preInvoiceNumber ?? "";
        companyNameController.text = pre?.preCompanyName ?? "";
        invoiceDateController.text = pre?.preInvoiceDate ?? "";
        deliveryDateController.text = pre?.preDeliveryDate ?? "";
        shipmentTypeController.text = pre?.shipment ?? "";
        movingPathRemarkController.text = pre?.movingPathRemark ?? "";
        moveFromController.text = pre?.moveFrom ?? "";
        moveToControllerr.text = pre?.moveto ?? "";
        vehicleNumberController.text = pre?.vehicleNumber ?? "";

        // ================== billingDetails ==================
        final bill = formData?.billingDetails;
        billToNameController.text = bill?.customerName ?? "";
        billToPhoneController.text = bill?.customerPhone ?? "";
        billToGstinController.text = bill?.customerGstNumber ?? "";
        billToCountryController.text = bill?.customerCountry ?? "";
        billToStateController.text = bill?.customerstate ?? "";
        billToCityController.text = bill?.customercity ?? "";
        billToPincodeController.text = bill?.customerpincode ?? "";
        billToAddressController.text = bill?.customeraddress ?? "";

        // ================== consignorDetails ==================
        final consignor = formData?.consignorDetails;
        consignorNameController.text = consignor?.consignorName ?? "";
        consignorPhoneController.text = consignor?.consignorPhone ?? "";
        consignorGstinController.text = consignor?.consignorgstNo ?? "";
        consignorCountryController.text = consignor?.consignorcountry ?? "";
        consignorStateController.text = consignor?.consignorstate ?? "";
        consignorCityController.text = consignor?.consignorcity ?? "";
        consignorPincodeController.text = consignor?.consignorpincode ?? "";
        consignorAddressController.text = consignor?.consignoraddress ?? "";

        // ================== consigneeDetails ==================
        final consignee = formData?.consigneeDetails;
        consigneeNameController.text = consignee?.consigneeName ?? "";
        consigneePhoneController.text = consignee?.consigneePhone ?? "";
        consigneeGstinController.text = consignee?.consigneegstNo ?? "";
        consigneeCountryController.text = consignee?.consigneeCountry ?? "";
        consigneeStateController.text = consignee?.consigneestate ?? "";
        consigneeCityController.text = consignee?.consigneecity ?? "";
        consigneePincodeController.text = consignee?.consigneepincode ?? "";
        consigneeAddressController.text = consignee?.consigneeaddress ?? "";

        // ================== packageDetails ==================
        final package = formData?.packageDetails;
        packageController.text = package?.packageType ?? "";
        descriptionController.text = package?.description ?? "";

        receiveConditionController.text = package?.hsnCode ?? "";
        remarkController.text = package?.detailsremark ?? "";

        // ================== paymentDetails ==================
        final payment = formData?.paymentDetails;
        freightChargeController.text = payment?.freightCharge ?? "";
        advancePaidController.text = payment?.advancePaid ?? "";
        packingChargeController.text = payment?.packingCharge ?? "";
        unpackingChargeController.text = payment?.unPackedCharge ?? "";
        loadingChargeController.text = payment?.loadingCharges ?? "";
        unloadingChargeController.text = payment?.unloadingCharges ?? "";
        packingMaterialChargeController.text = payment?.packingMaterialCharge ?? "";
        storageChargeController.text = payment?.storgeCharge ?? "";
        carBikeTptController.text = payment?.carBikeTPT ?? "";
        miscChargesController.text = payment?.miscellaneousCharge ?? "";
        otherChargesController.text = payment?.otherCharges ?? "";
        stChargeController.text = payment?.stCharge ?? "";
        octrioTaxController.text = payment?.greenTax ?? "";
        surchargeController.text = payment?.surcharge ?? "";
        paymentRemarkController.text = payment?.paymentRemark ?? "";
        discountController.text = payment?.paymentDiscount ?? "";

        // ================== insuranceDetails ==================
        final insurance = formData?.insuranceDetails;
        declarationVehicleValueController.text = insurance?.insuranceCharges ?? "";
        declarationGoodsValueController.text = insurance?.declarationValueOfGoods ?? "";

        // ================== vehicleInsuranceDetails ==================
        final vehicleIns = formData?.vehicleInsuranceDetails;
        vehicleNumberController.text = vehicleIns?.vehicleNumber ?? "";
      }

      return _proformalist;
    } catch (e) {
      print("Error fetching proforma by ID: $e");
      return null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }


  Future<void> fetchproformaById({required String id}) async {
    _errorMessage = null;

    try {
      // Fetch API data
      proformaGetDataByIdModel = await _proformaPdfRepository.getproformaByIdApi(id);

      if (proformaGetDataByIdModel?.data?.formData != null) {
        final formData = proformaGetDataByIdModel!.data!.formData!;

        // ================= Pre Invoice Details =================
        final pre = formData.preInvoiceDetails;
        if (pre != null) {
          preInvoiceNumberController.text = pre.preInvoiceNumber ?? '';
          companyNameController.text = pre.preCompanyName ?? '';
          invoiceDateController.text = pre.preInvoiceDate ?? '';
          deliveryDateController.text = pre.preDeliveryDate ?? '';
          shipmentTypeController.text = pre.shipment ?? '';
          movingPathRemarkController.text = pre.movingPathRemark ?? '';
          moveFromController.text = pre.moveFrom ?? '';
          moveToControllerr.text = pre.moveto ?? '';
          vehicleNumberController.text = pre.vehicleNumber ?? '';
        }

        // ================= Billing Details =================
        final bill = formData.billingDetails;
        if (bill != null) {
          billToNameController.text = bill.customerName ?? '';
          billToPhoneController.text = bill.customerPhone ?? '';
          billToGstinController.text = bill.customerGstNumber ?? '';
          billToCountryController.text = bill.customerCountry ?? '';
          billToAddressController.text = bill.customeraddress ?? '';
          billToCityController.text = bill.customercity ?? '';
          billToStateController.text = bill.customerstate ?? '';
          billToPincodeController.text = bill.customerpincode ?? '';
        }

        // ================= Consignor Details =================
        final consignor = formData.consignorDetails;
        if (consignor != null) {
          consignorNameController.text = consignor.consignorName ?? '';
          consignorPhoneController.text = consignor.consignorPhone ?? '';
          consignorCountryController.text = consignor.consignorcountry ?? '';
          consignorAddressController.text = consignor.consignoraddress ?? '';
          consignorCityController.text = consignor.consignorcity ?? '';
          consignorStateController.text = consignor.consignorstate ?? '';
          consignorPincodeController.text = consignor.consignorpincode ?? '';
          consignorGstinController.text = consignor.consignorgstNo ?? '';
        }

        // ================= Consignee Details =================
        final consignee = formData.consigneeDetails;
        if (consignee != null) {
          consigneeNameController.text = consignee.consigneeName ?? '';
          consigneePhoneController.text = consignee.consigneePhone ?? '';
          consigneeCountryController.text = consignee.consigneeCountry ?? '';
          consigneeAddressController.text = consignee.consigneeaddress ?? '';
          consigneeCityController.text = consignee.consigneecity ?? '';
          consigneeStateController.text = consignee.consigneestate ?? '';
          consigneePincodeController.text = consignee.consigneepincode ?? '';
          consigneeGstinController.text = consignee.consigneegstNo ?? '';
        }

        // ================= Package Details =================
        final package = formData.packageDetails;
        if (package != null) {
          packageController.text = package.packageType ?? '';
          totalWeightController.text = package.totalWeight ?? '';
          receiveConditionController.text = package.hsnCode ?? '';
          remarkController.text = package.detailsremark ?? '';
          descriptionController.text = package.description ?? '';
        }

        // ================= Payment Details =================
        final pay = formData.paymentDetails;
        if (pay != null) {
          freightChargeController.text = pay.freightCharge?.toString() ?? '';
          advancePaidController.text = pay.advancePaid?.toString() ?? '';
          packingChargeController.text = pay.packingCharge?.toString() ?? '';
          unpackingChargeController.text = pay.unPackedCharge?.toString() ?? '';
          loadingChargeController.text = pay.loadingCharges?.toString() ?? '';
          packingMaterialChargeController.text = pay.packingMaterialCharge?.toString() ?? '';
          storageChargeController.text = pay.storgeCharge?.toString() ?? '';
          carBikeTptController.text = pay.carBikeTPT?.toString() ?? '';
          miscChargesController.text = pay.miscellaneousCharge?.toString() ?? '';
          otherChargesController.text = pay.otherCharges?.toString() ?? '';
          stChargeController.text = pay.stCharge?.toString() ?? '';
          octrioTaxController.text = pay.greenTax?.toString() ?? '';
          surchargeController.text = pay.surcharge?.toString() ?? '';
          paymentRemarkController.text = pay.paymentRemark ?? '';
          discountController.text = pay.paymentDiscount?.toString() ?? '';
        }

        // ================= Insurance Details =================
        final ins = formData.insuranceDetails;
        if (ins != null) {
          declarationGoodsValueController.text = ins.declarationValueOfGoods?.toString() ?? '';
        }

        // ================= Vehicle Insurance Details =================
        final vehIns = formData.vehicleInsuranceDetails;
        if (vehIns != null) {
        //  vehicleInsuranceTypeController.text = vehIns.insuranceType ?? '';
         // vehicleInsuranceChargesController.text = vehIns.insuranceCharges?.toString() ?? '';
        //  vehicleInsuranceGstController.text = vehIns.vehicleGst?.toString() ?? '';
         // vehicleInsuranceNumberController.text = vehIns.vehicleNumber ?? '';
        }
      }
    } catch (e) {
      _errorMessage = 'Failed to load proforma data: $e';
      print(_errorMessage);
    }
    notifyListeners();
  }


  Future<void> getProformaById({required String id}) async {
    _errorMessage = null;
    print('provider response1>>>>>>>>>>>>>>>>>>');

    try {
      proformaGetDataByIdModel =
      await _proformaPdfRepository.getproformaByIdApi(id);
      print('provider response2>>>>>>>>>>>>>>>>>>>>>>>');
      if (proformaGetDataByIdModel != null &&
          proformaGetDataByIdModel!.data != null) {
        final preInvoice = proformaGetDataByIdModel!.data!.formData?.preInvoiceDetails;
        if (preInvoice != null) {
          preInvoiceNumberController.text = preInvoice.preInvoiceNumber ?? "NO Found";
          companyNameController.text = preInvoice.preCompanyName ?? "";
          invoiceDateController.text = preInvoice.preInvoiceDate ?? "";
          deliveryDateController.text = preInvoice.preDeliveryDate ?? "";
          shipmentTypeController.text = preInvoice.shipment ?? "";
          movingPathRemarkController.text = preInvoice.movingPathRemark ?? "";
          moveFromController.text = preInvoice.moveFrom ?? "";
          moveToControllerr.text = preInvoice.moveto ?? "";
          vehicleNumberController.text = preInvoice.vehicleNumber ?? "";
        }


        final billdetails = proformaGetDataByIdModel!.data!.formData?.billingDetails;
        if (billdetails != null) {
          billToNameController.text = billdetails.customerName ?? "NO Found";
          billToPhoneController.text = billdetails.customerPhone ?? "NO Found";
          billToGstinController.text = billdetails.customerGstNumber ?? "NO Found";
          billToCountryController.text = billdetails.customerCountry ?? "NO Found";
          billToAddressController.text = billdetails.customeraddress ?? "NO Found";
          billToCityController.text = billdetails.customercity ?? "NO Found";
          billToStateController.text = billdetails.customerstate ?? "NO Found";
          billToPincodeController.text = billdetails.customerpincode ?? "NO Found";

        }

        final consordetails = proformaGetDataByIdModel!.data!.formData?.consignorDetails;
        if (consordetails != null) {
          consignorNameController.text = consordetails.consignorName ?? "NO Found";
          consignorPhoneController.text = consordetails.consignorPhone ?? "NO Found";
          consignorCountryController.text = consordetails.consignorcountry ?? "NO Found";
          consignorAddressController.text = consordetails.consignoraddress ?? "NO Found";
          consignorCityController.text = consordetails.consignorcity ?? "NO Found";
          consignorStateController.text = consordetails.consignorstate ?? "NO Found";
          consignorPincodeController.text = consordetails.consignorpincode ?? "NO Found";
          consignorGstinController.text = consordetails.consignorgstNo ?? "NO Found";

        }

        final consgeedetails = proformaGetDataByIdModel!.data!.formData?.consigneeDetails;
        if (consgeedetails != null) {
          consigneeNameController.text = consgeedetails.consigneeName ?? "NO Found";
          consigneePhoneController.text = consgeedetails.consigneePhone ?? "NO Found";
          consigneeCountryController.text = consgeedetails.consigneeCountry ?? "NO Found";
          consigneeAddressController.text = consgeedetails.consigneeaddress ?? "NO Found";
          consigneeCityController.text = consgeedetails.consigneecity ?? "NO Found";
          consigneeStateController.text = consgeedetails.consigneestate ?? "NO Found";
          consigneePincodeController.text = consgeedetails.consigneepincode ?? "NO Found";
          consigneeGstinController.text = consgeedetails.consigneegstNo ?? "NO Found";

        }

        final packagedetail = proformaGetDataByIdModel!.data!.formData?.packageDetails;
        if (packagedetail != null) {
          packageController.text = packagedetail.packageType ?? "NO Found";
          descriptionController.text = packagedetail.description ?? "NO Found";
          totalWeightController.text = packagedetail.totalWeight ?? "NO Found";
          receiveConditionController.text = packagedetail.hsnCode ?? "NO Found";
          remarkController.text = packagedetail.detailsremark ?? "NO Found";

        }

        final paymentdetail = proformaGetDataByIdModel!.data!.formData?.paymentDetails;
        if (paymentdetail != null) {
          freightChargeController.text = paymentdetail.freightCharge ?? "NO Found";
          advancePaidController.text = paymentdetail.advancePaid ?? "NO Found";
          packingChargeController.text = paymentdetail.packingCharge ?? "NO Found";
          unpackingChargeController.text = paymentdetail.unPackedCharge ?? "NO Found";
          loadingChargeController.text = paymentdetail.loadingCharges ?? "NO Found";
          unloadingChargeController.text = paymentdetail.unloadingCharges ?? "NO Found";
          packingMaterialChargeController.text = paymentdetail.packingMaterialCharge ?? "NO Found";
          storageChargeController.text = paymentdetail.storgeCharge ?? "NO Found";
          carBikeTptController.text = paymentdetail.carBikeTPT ?? "NO Found";
          miscChargesController.text = paymentdetail.miscellaneousCharge ?? "NO Found";
          otherChargesController.text = paymentdetail.otherCharges ?? "NO Found";
          stChargeController.text = paymentdetail.stCharge ?? "NO Found";
          octrioTaxController.text = paymentdetail.greenTax ?? "NO Found";
          surchargeController.text = paymentdetail.surcharge ?? "NO Found";
          paymentRemarkController.text = paymentdetail.paymentRemark ?? "NO Found";
          discountController.text = paymentdetail.paymentDiscount ?? "NO Found";

        }
        final insurencedetail = proformaGetDataByIdModel!.data!.formData?.insuranceDetails;
        if (insurencedetail != null) {
          declarationGoodsValueController.text = insurencedetail.declarationValueOfGoods ?? "NO Found";

        }
        final vehicaldetail = proformaGetDataByIdModel!.data!.formData?.vehicleInsuranceDetails;
        if (vehicaldetail != null) {
          declarationVehicleValueController.text = vehicaldetail.vehicleNumber ?? "NO Found";

        }

        notifyListeners();
      }
    } catch (e) {
      _errorMessage = 'Failed to load proforma data: ${e.toString()}';
      print(_errorMessage);
      notifyListeners();
    }
  }


  String? pdfLocalPath;
  bool pdfLoading = false;
  String? _errorMessage2;

  String? get errorMessage2 => _errorMessage2;

  Future<void> fetchproformaPdf(String id) async {
    pdfLoading = true;
    _errorMessage2 = null;
    notifyListeners();

    try {
      final responseBytes = await  _proformaPdfRepository.proformapdfApi(id);

      if (responseBytes != null) {
        // Save PDF in temporary directory
        final dir = await getTemporaryDirectory();
        final file = File('${dir.path}/quotation_$id.pdf');
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

