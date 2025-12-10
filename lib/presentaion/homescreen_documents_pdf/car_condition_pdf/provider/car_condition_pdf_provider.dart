import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';
import '../get_by_id_model/car_condition_get_by_id.dart';
import '../model/car_condition_pdf_model.dart';
import '../repo/car_condition_pdf_repository.dart';

class CarConditionPdfProvider with ChangeNotifier {
  // Vehicle Condition Details
  TextEditingController vehicleConditionNumberController = TextEditingController();
  TextEditingController lrNumberController = TextEditingController();
  TextEditingController partyNameController = TextEditingController();
  TextEditingController partyPhoneController = TextEditingController();
  TextEditingController partyEmailController = TextEditingController();
  TextEditingController vehicleDateController = TextEditingController();
  TextEditingController moveFromVehicleController = TextEditingController();
  TextEditingController moveToVehicleController = TextEditingController();

  // Vehicle Details
  TextEditingController vehicleTypeController = TextEditingController();
  TextEditingController vehicleBrandNameController = TextEditingController();
  TextEditingController vehicleValueController = TextEditingController();
  TextEditingController insurancePolicyNoController = TextEditingController();
  TextEditingController insuranceCompanyNameController = TextEditingController();
  TextEditingController vehicleRegNoController = TextEditingController();
  TextEditingController manufacturingYearController = TextEditingController();
  TextEditingController vehicleColorController = TextEditingController();
  TextEditingController vehicleKilometerController = TextEditingController();
  TextEditingController chassisNoController = TextEditingController();
  TextEditingController engineNoController = TextEditingController();

  // Accessories Details
  TextEditingController batteryNoController = TextEditingController();
  TextEditingController tyreNoController = TextEditingController();
  TextEditingController otherAccessoriesController = TextEditingController();
  TextEditingController remarkController = TextEditingController();

  // Dent Details
  TextEditingController scratchesController = TextEditingController();
  TextEditingController dentController = TextEditingController();
  TextEditingController otherVisibleObservationController = TextEditingController();

  final CarConditionPdfRepository _carConditionPdfRepository = CarConditionPdfRepository();

  CarConditionPdfModel? carConditionlist;
  // CarConditionPdfModel? get carConditionlist => _carCondition;
  CarConditionGetDataModel? carConditionGetDataModel;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  bool isSuccess = false;


  bool isLoading2 = false;

  bool loading = false;
  bool isLoadMoreRunning = false;
  bool hasNextPage = true;

  int page = 1;
  void setLoading(bool loader) {
    loading = loader;
    notifyListeners();
  }

  Future<void> carconditionData({bool isLoadMore = false}) async {
    if (!isLoadMore) {
      /// FIRST PAGE CALL
      page = 1;
      hasNextPage = true;
      carConditionlist = null;
      setLoading(true);
    } else {
      /// LOAD MORE CALL
      if (isLoadMoreRunning || !hasNextPage) return;
      isLoadMoreRunning = true;
      notifyListeners();
    }

    try {
      final response = await _carConditionPdfRepository.getcarconditiondataApi(pageCount: page);

      if (response.status == true &&
          response.data != null &&
          response.data!.isNotEmpty) {

        if (isLoadMore) {
          /// APPEND NEW DATA
          carConditionlist!.data!.addAll(response.data!);
        } else {
          /// FIRST PAGE ASSIGNMENT
          carConditionlist = response;
        }

        page++; // increase only after success
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


  // Future<void> carconditionData() async {
  //   _isLoading = true;
  //   _errorMessage = null;
  //   notifyListeners();
  //
  //   try {
  //     _carCondition = await _carConditionPdfRepository.getcarconditiondataApi();
  //   } catch (e) {
  //     _errorMessage = 'Failed to load survey list: ${e.toString()}';
  //   } finally {
  //     _isLoading = false;
  //     notifyListeners();
  //   }
  // }


  Future<bool> deletecarcondition(String id) async {
    try {
      final result = await _carConditionPdfRepository.deleteCarConditionById(id);
      if (result.status == true) {
        await carconditionData();
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

  Future<void> updateCarCondition(String id) async {
    try {
      _isLoading = true;
      notifyListeners();

      final updateData = {
        "formData": {
          "vehicleConditionDetails": {
            "vehicleConditionNumber": vehicleConditionNumberController.text.trim(),
            "vehicleLRNumber": lrNumberController.text.trim(),
            "vehiclePartyName": partyNameController.text.trim(),
            "vehiclePartyPhone": partyPhoneController.text.trim(),
            "vehiclePartyEmail": partyEmailController.text.trim(),
            "vehiclePartydate": vehicleDateController.text.trim(),
            "vehiclePartyMoveFrom": moveFromVehicleController.text.trim(),
            "vehiclePartyMoveTo": moveToVehicleController.text.trim(),
          },
          "vehicleDetails": {
            "vehicleType": vehicleTypeController.text.trim(),
            "vehicleBrandName": vehicleBrandNameController.text.trim(),
            "vehicleValue": vehicleValueController.text.trim(),
            "insurancePolicyNumber": insurancePolicyNoController.text.trim(),
            "insuranceCompanyName": insuranceCompanyNameController.text.trim(),
            "vehicleRegistrationNumber": vehicleRegNoController.text.trim(),
            "manufacturingYear": manufacturingYearController.text.trim(),
            "color": vehicleColorController.text.trim(),
            "vehicleKilometerReading": vehicleKilometerController.text.trim(),
            "chassisNumber": chassisNoController.text.trim(),
            "EngineNumber": engineNoController.text.trim(),
          },
          "accessoriesDetails": {
            "accessoriesBattaeryNumber": batteryNoController.text.trim(),
            "accessoriesType": tyreNoController.text.trim(),
            "anyotherAccessories": otherAccessoriesController.text.trim(),
            "anyRemark": remarkController.text.trim(),
          },
          "dentScratchesDetails": {
            "scratches": scratchesController.text.trim(),
            "dent": dentController.text.trim(),
            "anyOtherVisibleObservation": otherVisibleObservationController.text.trim(),
          }
        }
      };

      carConditionlist = await _carConditionPdfRepository.patchcarByIdApi(id, updateData);

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      print("Error updating Car Condition: $e");
    }
  }

  Future<void> fetchcarById({required String id}) async {
    _errorMessage = null;

    try {
      carConditionGetDataModel = await _carConditionPdfRepository.getcarconditionByIdApi(id);

      if (carConditionGetDataModel != null &&
          carConditionGetDataModel!.data != null) {
        final customer = carConditionGetDataModel!.data!.formData?.vehicleConditionDetails;

        if (customer != null) {
         // vehicleConditionNumberController.text = customer.vehicleConditionNumber ?? "";

        }
        final customer1 = carConditionGetDataModel!.data!.formData?.vehicleConditionDetails;

        if (customer1 != null) {
          vehicleConditionNumberController.text = customer1.vehicleConditionNumber ?? "";
          lrNumberController.text = customer1.vehicleLRNumber ?? "";
          partyNameController.text = customer1.vehiclePartyName ?? "";
          partyPhoneController.text = customer1.vehiclePartyPhone ?? "";
          partyEmailController.text = customer1.vehiclePartyEmail ?? "";
          vehicleDateController.text = customer1.vehiclePartydate ?? "";
          moveFromVehicleController.text = customer1.vehiclePartyMoveFrom ?? "";
          moveToVehicleController.text = customer1.vehiclePartyMoveTo ?? "";


        }
        final customer2 = carConditionGetDataModel!.data!.formData?.vehicleDetails;

        if (customer2 != null) {
          vehicleTypeController.text = customer2.vehicleType ?? "";
          vehicleBrandNameController.text = customer2.vehicleBrandName ?? "";
          vehicleValueController.text = customer2.vehicleValue ?? "";
          insurancePolicyNoController.text = customer2.insurancePolicyNumber ?? "";
          insuranceCompanyNameController.text = customer2.insuranceCompanyName ?? "";
          vehicleRegNoController.text = customer2.vehicleRegistrationNumber ?? "";
          manufacturingYearController.text = customer2.manufacturingYear ?? "";
          vehicleColorController.text = customer2.color ?? "";
          vehicleKilometerController.text = customer2.vehicleKilometerReading ?? "";
          chassisNoController.text = customer2.chassisNumber ?? "";
          engineNoController.text = customer2.engineNumber ?? "";


        }
        final customer4 = carConditionGetDataModel!.data!.formData?.accessoriesDetails;

        if (customer4 != null) {
          batteryNoController.text = customer4.accessoriesBattaeryNumber ?? "";
          tyreNoController.text = customer4.accessoriesType ?? "";
          otherAccessoriesController.text = customer4.anyotherAccessories ?? "";
          remarkController.text = customer4.anyRemark ?? "";



        }
        final customer5 = carConditionGetDataModel!.data!.formData?.dentScratchesDetails;

        if (customer5 != null) {
          scratchesController.text = customer5.scratches ?? "";
          dentController.text = customer5.dent ?? "";
          otherVisibleObservationController.text = customer5.anyOtherVisibleObservation ?? "";
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
      final responseBytes = await  _carConditionPdfRepository.carpdfApi(id);

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
