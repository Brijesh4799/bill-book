
import 'package:BillBook/presentaion/homescreen_documents_pdf/quotation_pdf/get_byid_model/QuotationGetByIdModel.dart' hide ItemParticulars;
import 'package:flutter/cupertino.dart';
import '../../Packing_list_pdf/get_by_id_model/packing_get_byid_model.dart';
import '../get_byid_model/QuotationGetByIdModel.dart' hide ItemParticulars;
import '../model/quotation_pdf_model.dart';
import '../repo/quotation_pdf_repositroy.dart';
class QuatationPdfProvider with ChangeNotifier {
  TextEditingController quotationNumberController = TextEditingController();
  TextEditingController companyNameController = TextEditingController();
  TextEditingController companyGSTController = TextEditingController();
  TextEditingController partyNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController quotationDateController = TextEditingController();
  TextEditingController packingDateController = TextEditingController();
  TextEditingController shiftingDateController = TextEditingController();

  //Move From Country Controller

  TextEditingController moveFromCountryController = TextEditingController();
  TextEditingController moveFromStateController = TextEditingController();
  TextEditingController moveFromCityController = TextEditingController();
  TextEditingController moveFromPincodeController = TextEditingController();
  TextEditingController moveFromAddressController = TextEditingController();

  //Move to Country

  TextEditingController moveToCountryController = TextEditingController();
  TextEditingController moveToStateController = TextEditingController();
  TextEditingController moveToCityController = TextEditingController();
  TextEditingController moveToPincodeController = TextEditingController();
  TextEditingController moveToAddressController = TextEditingController();

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
  TextEditingController paymentRemarkController = TextEditingController();
  TextEditingController discountController = TextEditingController();
  TextEditingController movingtypecontrooler = TextEditingController();
  TextEditingController insurancetypecontroller = TextEditingController();
  TextEditingController InsuranceFOVcontroller = TextEditingController();
  TextEditingController insurancepergstController = TextEditingController();
  TextEditingController moveformfloorcontoller = TextEditingController();
  TextEditingController moveformliftcontoller = TextEditingController();

  //declarative vehical controller

  TextEditingController declarationVehicleValueController = TextEditingController();
  TextEditingController vehicleDeclarationValueController = TextEditingController();
  TextEditingController gotDownItemsController = TextEditingController();
  TextEditingController specialNeedsController = TextEditingController();

  TextEditingController itemNameController = TextEditingController();
  TextEditingController itemQuantityController = TextEditingController();
  TextEditingController itemValueController = TextEditingController();
  TextEditingController itemRemarkController = TextEditingController();
  TextEditingController itemCFTController = TextEditingController();
  TextEditingController itemBoxNumberController = TextEditingController();
  final QuotationPdfRepository _quotationPdfRepository = QuotationPdfRepository();
  QuotationGetDataByIdModel? quotationGetDataByIdModel;
  QuotationPdfModel? _quotationlist;
  QuotationPdfModel? get quatationList => _quotationlist;

  QuotationPdfModel? _quotationById;
  QuotationPdfModel? get quotationById => _quotationById;



  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  //QuotationGetDataByIdModel? quotationGetDataByIdModel;
  /// Fetch all quotations
  Future<void> fetchQuatationListData() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _quotationlist = await _quotationPdfRepository.getQuotationData();
    } catch (e) {
      _errorMessage = 'Failed to load quotation list: ${e.toString()}';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Fetch quotation by ID
  Future<void> fetchQuotationById(String id) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _quotationById = await _quotationPdfRepository.getQuotationIdData(id);
    } catch (e) {
      _errorMessage = 'Failed to load quotation details: ${e.toString()}';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Delete quotation
  final _repo = QuotationPdfRepository();
  Future<bool> deletequotation(String id) async {
    try {
      final result = await _repo.deletequotationById(id);
      if (result.status == true) {
        await fetchQuatationListData(); // Refresh after deletion
        return true;
      } else {
        print('Delete failed: ${result.message}');
        return false;
      }
    } catch (e) {
      print('Error deleting quotation: $e');
      return false;
    }
  }

  List<Map<String, dynamic>> itemParticulars = [];
  Future<QuotationPdfModel?> updatequotationById(String paymentId) async {
    _isLoading = true;
    notifyListeners();

    try {

      final requestBody = {
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
          //  "movefloore": movetocontroller.text.trim(),
           // "moveisLiftAvailable": movetoliftcontoller.text.trim(),

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
            "remark": paymentRemarkController.text.trim(),
            "discount": discountController.text.trim(),

          },
          "insurance": {
            "type": insurancetypecontroller.text.trim(),
            "percent": insurancepergstController.text.trim(),
            "gst": InsuranceFOVcontroller.text.trim(),
            "declarationvalue": insurancetypecontroller.text.trim(),
          },
          "vehicleInsurance": {
            //"type": vehicalinsurencecontoller.text.trim(),
          //  "percent": insuranceChargeController.text.trim(),
         //   "gst": GSTperController.text.trim(),
            "declarationvalue": vehicleDeclarationValueController.text.trim(),
          },
          "otherDetails": {
          //  "loadingunloading": loadingunlodingcontroller.text.trim(),
            "anyiteam": gotDownItemsController.text.trim(),
           // "restrictions": loadingunloadingorgincontroller.text.trim(),
            "specialNeeds": specialNeedsController.text.trim()
          },
          "itemParticulars": itemParticulars,
        }
      };


      _quotationById = await _quotationPdfRepository.patchquotationByIdApi(paymentId, requestBody);


      if (_quotationById?.data != null && _quotationById!.data!.isNotEmpty) {
        final formData = _quotationById!.data!.first.formData;
        print("Updated form data: $formData");
      }

      return _quotationById;
    } catch (e) {
      print("Error updating quotation: $e");
      return null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
  String? selectedMovingType;

  void setMovingType(String? value) {
    selectedMovingType = value;
    notifyListeners();
  }
  String? validateMovingType(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select an option (कृपया एक विकल्प चुनें)';
    }
    return null;
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

  String? validateDropdown(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select an option (कृपया एक विकल्प चुनें)';
    }
    return null;
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
  void disposeControllers() {
    packingChargeController.dispose();
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
  Future<void> fetchQuotationByIdNew({required String id}) async {
    _errorMessage = null;

    try {
      // Use correct repository instance
      quotationGetDataByIdModel = await _quotationPdfRepository.getquotationByIdApi(id) ;

      if (quotationGetDataByIdModel != null &&
          quotationGetDataByIdModel!.data != null) {
        final customer = quotationGetDataByIdModel!.data!.formData?.quotationDetails;

        if (customer != null) {
          quotationNumberController.text = customer.quotationNumber ?? "";
          packingDateController.text = customer.packingDate ?? "";
          movingtypecontrooler.text = customer.movingType ?? "";
          companyNameController.text = customer.companynameofparty ?? "";
          companyGSTController.text = customer.companygstno ?? "";
          partyNameController.text = customer.partyname ?? "";
          emailController.text = customer.email ?? "";
          quotationDateController.text = customer.qtdate ?? "";
          shiftingDateController.text = customer.shiptdate ?? "";

        }
        final customer1 = quotationGetDataByIdModel!.data!.formData?.moveFrom;

        if (customer1 != null) {
          moveFromCountryController.text = customer1.fromcountry ?? "";
          moveFromPincodeController.text = customer1.frompincode ?? "";
          moveFromAddressController.text = customer1.fromaddress ?? "";
          moveFromStateController.text = customer1.state ?? "";
          moveFromCityController.text = customer1.city ?? "";
          moveformfloorcontoller.text = customer1.fromfloor ?? "";
          moveformliftcontoller.text = customer1.fromisLiftAvailable ?? "";


        }
        final customer2 = quotationGetDataByIdModel!.data!.formData?.paymentDetails;

        if (customer2 != null) {
          freightChargeController.text = customer2.freightCharge ?? "";
          advancePaidController.text = customer2.advancePaid ?? "";
          packingChargeController.text = customer2.pakingcharge ?? "";
          unpackingChargeController.text = customer2.unpakingcharge ?? "";
          loadingChargeController.text = customer2.lodingcharge ?? "";
          unloadingChargeController.text = customer2.unloadingcharge ?? "";
          packingMaterialChargeController.text = customer2.packingmaterialcharge ?? "";
          storageChargeController.text = customer2.storgecharge ?? "";
          carBikeTptController.text = customer2.carbiketpt ?? "";
          miscChargesController.text = customer2.miscellaneouscharge ?? "";
          otherChargesController.text = customer2.othercharge ?? "";
          stChargeController.text = customer2.stcharge ?? "";
          octrioTaxController.text = customer2.octriogreentax ?? "";
          paymentRemarkController.text = customer2.remark ?? "";
          discountController.text = customer2.discount ?? "";


        }
        final customer3 = quotationGetDataByIdModel!.data!.formData?.insurance;

        if (customer3 != null) {
          insurancetypecontroller.text = customer3.type ?? "";
          insurancepergstController.text = customer3.percent ?? "";
          InsuranceFOVcontroller.text = customer3.gst ?? "";
          insurancetypecontroller.text = customer3.declarationvalue ?? "";

        }

        final customer4 = quotationGetDataByIdModel!.data!.formData?.moveTo;

        if (customer4 != null) {
          moveToCountryController.text = customer4.movecountry ?? "";
          moveToStateController.text = customer4.state ?? "";
          moveToCityController.text = customer4.city ?? "";
          moveToPincodeController.text = customer4.movepincode ?? "";
          moveToAddressController.text = customer4.moveaddress ?? "";


        }

        final customer5 = quotationGetDataByIdModel!.data!.formData?.insurance;
        if (customer5 != null) {
          declarationVehicleValueController.text = customer5.declarationvalue ?? "";
        }

        /*final customer7 = quotationGetDataByIdModel!.data!.formData?.insurance;
        if (customer7 != null) {
          vehicleDeclarationValueController.text = customer7.declarationvalue ?? "";
        }*/

        final customer6 = quotationGetDataByIdModel!.data!.formData?.insurance;
        if (customer6 != null) {
          vehicleDeclarationValueController.text = customer6.declarationvalue ?? "";
        }
        final customer8 = quotationGetDataByIdModel!.data!.formData?.otherDetails;
        if (customer8 != null) {
          gotDownItemsController.text = customer8.anyiteam ?? "";
          specialNeedsController.text = customer8.specialNeeds ?? "";
        }

        if (quotationGetDataByIdModel!.data!.formData?.itemParticulars != null &&
            quotationGetDataByIdModel!.data!.formData!.itemParticulars!.isNotEmpty) {
          final item = quotationGetDataByIdModel!.data!.formData!.itemParticulars!.first;

          itemNameController.text = item.itemName ?? "";
          itemBoxNumberController.text = item.boxNumber?.toString() ?? "";
          itemQuantityController.text = item.quantity?.toString() ?? "";
          itemValueController.text = item.value?.toString() ?? "";
          itemCFTController.text = item.cft?.toString() ?? "";
          itemRemarkController.text = item.remark ?? "";
        }


      }
    } catch (e) {
      _errorMessage = 'Failed to load packing data: ${e.toString()}';
      print(_errorMessage);
    }
  }



 /* List<ItemParticulars>? get items =>

  quotationGetDataByIdModel?.data?.formData?.itemParticulars  ;
  void loadItemIntoControllers(ItemParticulars item) {
    itemNameController.text = item.itemName ?? "";
    itemBoxNumberController.text = item.boxNumber?.toString() ?? "";
    itemQuantityController.text = item.quantity?.toString() ?? "";
    itemValueController.text = item.value?.toString() ?? "";
    itemCFTController.text = item.cft?.toString() ?? "";
    itemRemarkController.text = item.remark ?? "";
    notifyListeners();
  }*/

}



