import 'package:flutter/cupertino.dart';

import '../repo/car_condition_repository.dart';

class CarConditionProvider with ChangeNotifier{

  TextEditingController vehicleConditionNumberController = TextEditingController();
  TextEditingController lrNumberController = TextEditingController();
  TextEditingController partyNameController = TextEditingController();
  TextEditingController partyPhoneController = TextEditingController();
  TextEditingController partyEmailController = TextEditingController();
  TextEditingController vehicleDateController = TextEditingController();
  TextEditingController moveFromVehicleController = TextEditingController();
  TextEditingController moveToVehicleController = TextEditingController();

  //Vehical Details

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

  //Accessories Details

  TextEditingController batteryNoController = TextEditingController();
  TextEditingController tyreNoController = TextEditingController();
  TextEditingController otherAccessoriesController = TextEditingController();
  TextEditingController remarkController = TextEditingController();

  //Dent Details

  TextEditingController scratchesController = TextEditingController();
  TextEditingController dentController = TextEditingController();
  TextEditingController otherVisibleObservationController = TextEditingController();

  Future<void> carconditionprovider({
    required String mobileNumber,
    required BuildContext context,
  }) async {
    final carConditionRepository = CarConditionRepository();

    try {
      var response = await carConditionRepository.businessapi({
        "formData": {
          "vehicleConditionDetails": {
            "vehicleConditionNumber": vehicleConditionNumberController.text.trim(),
            "vehicleLRNumber": lrNumberController.text.trim(), // Make sure the key matches
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
            "EngineNumber": engineNoController.text.trim(), // Watch casing
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
      });

      // Optional: handle response
      print("Response: $response");
      clearFields();
    } catch (e) {
      print('Error occurred: $e');
    }

    notifyListeners();
  }
  void clearFields() {
    vehicleTypeController.clear();
    vehicleBrandNameController.clear();
    vehicleValueController.clear();
    insurancePolicyNoController.clear();
    insuranceCompanyNameController.clear();
    vehicleRegNoController.clear();
    manufacturingYearController.clear();
    vehicleColorController.clear();
    vehicleKilometerController.clear();
    chassisNoController.clear();
    engineNoController.clear();
    batteryNoController.clear();
    tyreNoController.clear();
    otherAccessoriesController.clear();
    remarkController.clear();
    scratchesController.clear();
    dentController.clear();
    otherVisibleObservationController.clear();
    vehicleConditionNumberController.clear();
    lrNumberController.clear();
    partyNameController.clear();
    partyPhoneController.clear();
    partyEmailController.clear();
    vehicleDateController.clear();
    moveFromVehicleController.clear();
    moveToVehicleController.clear();


    notifyListeners();
  }
}
