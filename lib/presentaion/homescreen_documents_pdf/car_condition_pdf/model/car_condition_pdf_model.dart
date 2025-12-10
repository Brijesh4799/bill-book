
class CarConditionPdfModel {
  bool? status;
  String? message;
  List<Data>? data;
  Pagination? pagination;

  CarConditionPdfModel({this.status, this.message, this.data, this.pagination});

  CarConditionPdfModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    pagination = json['pagination'] != null
        ? new Pagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.pagination != null) {
      data['pagination'] = this.pagination!.toJson();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? userId;
  FormData? formData;
  String? status;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Data(
      {this.sId,
        this.userId,
        this.formData,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userId = json['userId'];
    formData = json['formData'] != null
        ? new FormData.fromJson(json['formData'])
        : null;
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['userId'] = this.userId;
    if (this.formData != null) {
      data['formData'] = this.formData!.toJson();
    }
    data['status'] = this.status;
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
  String? vehicleType;
  String? vehicleBrandName;
  String? vehicleValue;
  String? insuranceCompanyName;
  String? vehicleRegistrationNumber;
  String? manufacturingYear;
  String? color;
  String? vehicleKilometerReading;
  String? fuelType;

  VehicleConditionDetails(
      {this.vehicleConditionNumber,
        this.vehicleLRNumber,
        this.vehiclePartyName,
        this.vehiclePartyPhone,
        this.vehiclePartyEmail,
        this.vehiclePartydate,
        this.vehiclePartyMoveFrom,
        this.vehiclePartyMoveTo,
        this.vehicleType,
        this.vehicleBrandName,
        this.vehicleValue,
        this.insuranceCompanyName,
        this.vehicleRegistrationNumber,
        this.manufacturingYear,
        this.color,
        this.vehicleKilometerReading,
        this.fuelType});

  VehicleConditionDetails.fromJson(Map<String, dynamic> json) {
    vehicleConditionNumber = json['vehicleConditionNumber'];
    vehicleLRNumber = json['vehicleLRNumber'];
    vehiclePartyName = json['vehiclePartyName'];
    vehiclePartyPhone = json['vehiclePartyPhone'];
    vehiclePartyEmail = json['vehiclePartyEmail'];
    vehiclePartydate = json['vehiclePartydate'];
    vehiclePartyMoveFrom = json['vehiclePartyMoveFrom'];
    vehiclePartyMoveTo = json['vehiclePartyMoveTo'];
    vehicleType = json['vehicleType'];
    vehicleBrandName = json['vehicleBrandName'];
    vehicleValue = json['vehicleValue'];
    insuranceCompanyName = json['insuranceCompanyName'];
    vehicleRegistrationNumber = json['vehicleRegistrationNumber'];
    manufacturingYear = json['manufacturingYear'];
    color = json['color'];
    vehicleKilometerReading = json['vehicleKilometerReading'];
    fuelType = json['fuelType'];
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
    data['vehicleType'] = this.vehicleType;
    data['vehicleBrandName'] = this.vehicleBrandName;
    data['vehicleValue'] = this.vehicleValue;
    data['insuranceCompanyName'] = this.insuranceCompanyName;
    data['vehicleRegistrationNumber'] = this.vehicleRegistrationNumber;
    data['manufacturingYear'] = this.manufacturingYear;
    data['color'] = this.color;
    data['vehicleKilometerReading'] = this.vehicleKilometerReading;
    data['fuelType'] = this.fuelType;
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
  String? partyName;
  String? partyPhone;
  String? email;
  String? date;
  String? moveFrom;
  String? moveTo;

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
        this.engineNumber,
        this.partyName,
        this.partyPhone,
        this.email,
        this.date,
        this.moveFrom,
        this.moveTo});

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
    partyName = json['partyName'];
    partyPhone = json['partyPhone'];
    email = json['email'];
    date = json['date'];
    moveFrom = json['moveFrom'];
    moveTo = json['moveTo'];
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
    data['partyName'] = this.partyName;
    data['partyPhone'] = this.partyPhone;
    data['email'] = this.email;
    data['date'] = this.date;
    data['moveFrom'] = this.moveFrom;
    data['moveTo'] = this.moveTo;
    return data;
  }
}

class AccessoriesDetails {
  String? accessoriesBattaeryNumber;
  String? accessoriesType;
  String? anyotherAccessories;
  String? anyRemark;
  List<Accessories>? accessories;

  AccessoriesDetails(
      {this.accessoriesBattaeryNumber,
        this.accessoriesType,
        this.anyotherAccessories,
        this.anyRemark,
        this.accessories});

  AccessoriesDetails.fromJson(Map<String, dynamic> json) {
    accessoriesBattaeryNumber = json['accessoriesBattaeryNumber'];
    accessoriesType = json['accessoriesType'];
    anyotherAccessories = json['anyotherAccessories'];
    anyRemark = json['anyRemark'];
    if (json['accessories'] != null) {
      accessories = <Accessories>[];
      json['accessories'].forEach((v) {
        accessories!.add(new Accessories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accessoriesBattaeryNumber'] = this.accessoriesBattaeryNumber;
    data['accessoriesType'] = this.accessoriesType;
    data['anyotherAccessories'] = this.anyotherAccessories;
    data['anyRemark'] = this.anyRemark;
    if (this.accessories != null) {
      data['accessories'] = this.accessories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Accessories {
  String? name;
  bool? present;

  Accessories({this.name, this.present});

  Accessories.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    present = json['present'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['present'] = this.present;
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

class Pagination {
  int? total;
  int? page;
  int? limit;
  int? totalPages;

  Pagination({this.total, this.page, this.limit, this.totalPages});

  Pagination.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    page = json['page'];
    limit = json['limit'];
    totalPages = json['totalPages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['page'] = this.page;
    data['limit'] = this.limit;
    data['totalPages'] = this.totalPages;
    return data;
  }
}
