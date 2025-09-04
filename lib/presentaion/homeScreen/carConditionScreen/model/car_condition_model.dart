class CarConditionModel {
  bool? status;
  String? message;
  Data? data;

  CarConditionModel({this.status, this.message, this.data});

  CarConditionModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? userId;
  FormData? formData;
  String? status;
  String? sId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Data(
      {this.userId,
        this.formData,
        this.status,
        this.sId,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    formData = json['formData'] != null
        ? new FormData.fromJson(json['formData'])
        : null;
    status = json['status'];
    sId = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    if (this.formData != null) {
      data['formData'] = this.formData!.toJson();
    }
    data['status'] = this.status;
    data['_id'] = this.sId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class FormData {
  VehicleConditionDetails? vehicleConditionDetails;
  VehicleDetails? vehicleDetails;
  AccessoriesDetails? accessoriesDetails;
  DentScratchesDetails? dentScratchesDetails;

  FormData(
      {this.vehicleConditionDetails,
        this.vehicleDetails,
        this.accessoriesDetails,
        this.dentScratchesDetails});

  FormData.fromJson(Map<String, dynamic> json) {
    vehicleConditionDetails = json['vehicleConditionDetails'] != null
        ? new VehicleConditionDetails.fromJson(json['vehicleConditionDetails'])
        : null;
    vehicleDetails = json['vehicleDetails'] != null
        ? new VehicleDetails.fromJson(json['vehicleDetails'])
        : null;
    accessoriesDetails = json['accessoriesDetails'] != null
        ? new AccessoriesDetails.fromJson(json['accessoriesDetails'])
        : null;
    dentScratchesDetails = json['dentScratchesDetails'] != null
        ? new DentScratchesDetails.fromJson(json['dentScratchesDetails'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.vehicleConditionDetails != null) {
      data['vehicleConditionDetails'] = this.vehicleConditionDetails!.toJson();
    }
    if (this.vehicleDetails != null) {
      data['vehicleDetails'] = this.vehicleDetails!.toJson();
    }
    if (this.accessoriesDetails != null) {
      data['accessoriesDetails'] = this.accessoriesDetails!.toJson();
    }
    if (this.dentScratchesDetails != null) {
      data['dentScratchesDetails'] = this.dentScratchesDetails!.toJson();
    }
    return data;
  }
}

class VehicleConditionDetails {
  String? vehicleConditionNumber;
  String? vehicleLRNumber;
  String? vehiclePartyName;
  String? vehiclePartyPhone;
  String? vehiclePartyEmail;
  String? vehiclePartydate;
  String? vehiclePartyMoveFrom;
  String? vehiclePartyMoveTo;

  VehicleConditionDetails(
      {this.vehicleConditionNumber,
        this.vehicleLRNumber,
        this.vehiclePartyName,
        this.vehiclePartyPhone,
        this.vehiclePartyEmail,
        this.vehiclePartydate,
        this.vehiclePartyMoveFrom,
        this.vehiclePartyMoveTo});

  VehicleConditionDetails.fromJson(Map<String, dynamic> json) {
    vehicleConditionNumber = json['vehicleConditionNumber'];
    vehicleLRNumber = json['vehicleLRNumber'];
    vehiclePartyName = json['vehiclePartyName'];
    vehiclePartyPhone = json['vehiclePartyPhone'];
    vehiclePartyEmail = json['vehiclePartyEmail'];
    vehiclePartydate = json['vehiclePartydate'];
    vehiclePartyMoveFrom = json['vehiclePartyMoveFrom'];
    vehiclePartyMoveTo = json['vehiclePartyMoveTo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vehicleConditionNumber'] = this.vehicleConditionNumber;
    data['vehicleLRNumber'] = this.vehicleLRNumber;
    data['vehiclePartyName'] = this.vehiclePartyName;
    data['vehiclePartyPhone'] = this.vehiclePartyPhone;
    data['vehiclePartyEmail'] = this.vehiclePartyEmail;
    data['vehiclePartydate'] = this.vehiclePartydate;
    data['vehiclePartyMoveFrom'] = this.vehiclePartyMoveFrom;
    data['vehiclePartyMoveTo'] = this.vehiclePartyMoveTo;
    return data;
  }
}

class VehicleDetails {
  String? vehicleType;
  String? vehicleBrandName;
  String? vehicleValue;
  String? insurancePolicyNumber;
  String? insuranceCompanyName;
  String? vehicleRegistrationNumber;
  String? manufacturingYear;
  String? color;
  String? vehicleKilometerReading;
  String? chassisNumber;
  String? engineNumber;

  VehicleDetails(
      {this.vehicleType,
        this.vehicleBrandName,
        this.vehicleValue,
        this.insurancePolicyNumber,
        this.insuranceCompanyName,
        this.vehicleRegistrationNumber,
        this.manufacturingYear,
        this.color,
        this.vehicleKilometerReading,
        this.chassisNumber,
        this.engineNumber});

  VehicleDetails.fromJson(Map<String, dynamic> json) {
    vehicleType = json['vehicleType'];
    vehicleBrandName = json['vehicleBrandName'];
    vehicleValue = json['vehicleValue'];
    insurancePolicyNumber = json['insurancePolicyNumber'];
    insuranceCompanyName = json['insuranceCompanyName'];
    vehicleRegistrationNumber = json['vehicleRegistrationNumber'];
    manufacturingYear = json['manufacturingYear'];
    color = json['color'];
    vehicleKilometerReading = json['vehicleKilometerReading'];
    chassisNumber = json['chassisNumber'];
    engineNumber = json['EngineNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vehicleType'] = this.vehicleType;
    data['vehicleBrandName'] = this.vehicleBrandName;
    data['vehicleValue'] = this.vehicleValue;
    data['insurancePolicyNumber'] = this.insurancePolicyNumber;
    data['insuranceCompanyName'] = this.insuranceCompanyName;
    data['vehicleRegistrationNumber'] = this.vehicleRegistrationNumber;
    data['manufacturingYear'] = this.manufacturingYear;
    data['color'] = this.color;
    data['vehicleKilometerReading'] = this.vehicleKilometerReading;
    data['chassisNumber'] = this.chassisNumber;
    data['EngineNumber'] = this.engineNumber;
    return data;
  }
}

class AccessoriesDetails {
  String? accessoriesBattaeryNumber;
  String? accessoriesType;
  String? anyotherAccessories;
  String? anyRemark;

  AccessoriesDetails(
      {this.accessoriesBattaeryNumber,
        this.accessoriesType,
        this.anyotherAccessories,
        this.anyRemark});

  AccessoriesDetails.fromJson(Map<String, dynamic> json) {
    accessoriesBattaeryNumber = json['accessoriesBattaeryNumber'];
    accessoriesType = json['accessoriesType'];
    anyotherAccessories = json['anyotherAccessories'];
    anyRemark = json['anyRemark'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accessoriesBattaeryNumber'] = this.accessoriesBattaeryNumber;
    data['accessoriesType'] = this.accessoriesType;
    data['anyotherAccessories'] = this.anyotherAccessories;
    data['anyRemark'] = this.anyRemark;
    return data;
  }
}

class DentScratchesDetails {
  String? scratches;
  String? dent;
  String? anyOtherVisibleObservation;

  DentScratchesDetails(
      {this.scratches, this.dent, this.anyOtherVisibleObservation});

  DentScratchesDetails.fromJson(Map<String, dynamic> json) {
    scratches = json['scratches'];
    dent = json['dent'];
    anyOtherVisibleObservation = json['anyOtherVisibleObservation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['scratches'] = this.scratches;
    data['dent'] = this.dent;
    data['anyOtherVisibleObservation'] = this.anyOtherVisibleObservation;
    return data;
  }
}
