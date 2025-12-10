class LrBiltyPdfModel {
  bool? status;
  var message;
  List<Data>? data;
  Pagination? pagination;

  LrBiltyPdfModel({this.status, this.message, this.data, this.pagination});

  LrBiltyPdfModel.fromJson(Map<String, dynamic> json) {
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
  var sId;
  var userId;
  FormData? formData;
  var status;
  var createdAt;
  var updatedAt;
  var iV;

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
  LrDetails? lrDetails;
  TruckVehicleDetails? truckVehicleDetails;
  MoveFrom? moveFrom;
  MoveTo? moveTo;
  PackageDetails? packageDetails;
  PaymentDetails? paymentDetails;
  MaterialInsurance? materialInsurance;
  DemurrageCharge? demurrageCharge;
  InvoiceEWayBill? invoiceEWayBill;

  FormData(
      {this.lrDetails,
        this.truckVehicleDetails,
        this.moveFrom,
        this.moveTo,
        this.packageDetails,
        this.paymentDetails,
        this.materialInsurance,
        this.demurrageCharge,
        this.invoiceEWayBill});

  FormData.fromJson(Map<String, dynamic> json) {
    lrDetails = json['lrDetails'] != null
        ? new LrDetails.fromJson(json['lrDetails'])
        : null;
    truckVehicleDetails = json['truckVehicleDetails'] != null
        ? new TruckVehicleDetails.fromJson(json['truckVehicleDetails'])
        : null;
    moveFrom = json['moveFrom'] != null
        ? new MoveFrom.fromJson(json['moveFrom'])
        : null;
    moveTo =
    json['moveTo'] != null ? new MoveTo.fromJson(json['moveTo']) : null;
    packageDetails = json['packageDetails'] != null
        ? new PackageDetails.fromJson(json['packageDetails'])
        : null;
    paymentDetails = json['paymentDetails'] != null
        ? new PaymentDetails.fromJson(json['paymentDetails'])
        : null;
    materialInsurance = json['materialInsurance'] != null
        ? new MaterialInsurance.fromJson(json['materialInsurance'])
        : null;
    demurrageCharge = json['demurrageCharge'] != null
        ? new DemurrageCharge.fromJson(json['demurrageCharge'])
        : null;
    invoiceEWayBill = json['invoiceEWayBill'] != null
        ? new InvoiceEWayBill.fromJson(json['invoiceEWayBill'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.lrDetails != null) {
      data['lrDetails'] = this.lrDetails!.toJson();
    }
    if (this.truckVehicleDetails != null) {
      data['truckVehicleDetails'] = this.truckVehicleDetails!.toJson();
    }
    if (this.moveFrom != null) {
      data['moveFrom'] = this.moveFrom!.toJson();
    }
    if (this.moveTo != null) {
      data['moveTo'] = this.moveTo!.toJson();
    }
    if (this.packageDetails != null) {
      data['packageDetails'] = this.packageDetails!.toJson();
    }
    if (this.paymentDetails != null) {
      data['paymentDetails'] = this.paymentDetails!.toJson();
    }
    if (this.materialInsurance != null) {
      data['materialInsurance'] = this.materialInsurance!.toJson();
    }
    if (this.demurrageCharge != null) {
      data['demurrageCharge'] = this.demurrageCharge!.toJson();
    }
    if (this.invoiceEWayBill != null) {
      data['invoiceEWayBill'] = this.invoiceEWayBill!.toJson();
    }
    return data;
  }
}

class LrDetails {
  var lrNumber;
  var lrDate;

  LrDetails({this.lrNumber, this.lrDate});

  LrDetails.fromJson(Map<String, dynamic> json) {
    lrNumber = json['lrNumber'];
    lrDate = json['lrDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lrNumber'] = this.lrNumber;
    data['lrDate'] = this.lrDate;
    return data;
  }
}

class TruckVehicleDetails {
  var truckVehicleNumber;
  var truckVehicleMoveForm;
  var truckVehicleMoveTo;
  var truckVehicleDriverName;
  var truckVehicleDriverPhoneNumber;
  var truckVehicleDriverLicenceNumber;

  TruckVehicleDetails(
      {this.truckVehicleNumber,
        this.truckVehicleMoveForm,
        this.truckVehicleMoveTo,
        this.truckVehicleDriverName,
        this.truckVehicleDriverPhoneNumber,
        this.truckVehicleDriverLicenceNumber});

  TruckVehicleDetails.fromJson(Map<String, dynamic> json) {
    truckVehicleNumber = json['truckVehicleNumber'];
    truckVehicleMoveForm = json['truckVehicleMoveForm'];
    truckVehicleMoveTo = json['truckVehicleMoveTo'];
    truckVehicleDriverName = json['truckVehicleDriverName'];
    truckVehicleDriverPhoneNumber = json['truckVehicleDriverPhoneNumber'];
    truckVehicleDriverLicenceNumber = json['truckVehicleDriverLicenceNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['truckVehicleNumber'] = this.truckVehicleNumber;
    data['truckVehicleMoveForm'] = this.truckVehicleMoveForm;
    data['truckVehicleMoveTo'] = this.truckVehicleMoveTo;
    data['truckVehicleDriverName'] = this.truckVehicleDriverName;
    data['truckVehicleDriverPhoneNumber'] = this.truckVehicleDriverPhoneNumber;
    data['truckVehicleDriverLicenceNumber'] =
        this.truckVehicleDriverLicenceNumber;
    return data;
  }
}

class MoveFrom {
  var consignorName;
  var consignorPhone;
  var consignoraddress;
  var consignorcity;
  var consignorstate;
  var consignorpincode;
  var consignorgstNo;
  var consignorStateCode;
  var consignorCountry;
  var consignorAddress;
  var address;
  var city;
  var state;
  var pincode;
  var gstNo;

  MoveFrom(
      {this.consignorName,
        this.consignorPhone,
        this.consignoraddress,
        this.consignorcity,
        this.consignorstate,
        this.consignorpincode,
        this.consignorgstNo,
        this.consignorStateCode,
        this.consignorCountry,
        this.consignorAddress,
        this.address,
        this.city,
        this.state,
        this.pincode,
        this.gstNo});

  MoveFrom.fromJson(Map<String, dynamic> json) {
    consignorName = json['consignorName'];
    consignorPhone = json['consignorPhone'];
    consignoraddress = json['consignoraddress'];
    consignorcity = json['consignorcity'];
    consignorstate = json['consignorstate'];
    consignorpincode = json['consignorpincode'];
    consignorgstNo = json['consignorgstNo'];
    consignorStateCode = json['consignorStateCode'];
    consignorCountry = json['consignorCountry'];
    consignorAddress = json['consignorAddress'];
    address = json['address'];
    city = json['city'];
    state = json['state'];
    pincode = json['pincode'];
    gstNo = json['gstNo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['consignorName'] = this.consignorName;
    data['consignorPhone'] = this.consignorPhone;
    data['consignoraddress'] = this.consignoraddress;
    data['consignorcity'] = this.consignorcity;
    data['consignorstate'] = this.consignorstate;
    data['consignorpincode'] = this.consignorpincode;
    data['consignorgstNo'] = this.consignorgstNo;
    data['consignorStateCode'] = this.consignorStateCode;
    data['consignorCountry'] = this.consignorCountry;
    data['consignorAddress'] = this.consignorAddress;
    data['address'] = this.address;
    data['city'] = this.city;
    data['state'] = this.state;
    data['pincode'] = this.pincode;
    data['gstNo'] = this.gstNo;
    return data;
  }
}

class MoveTo {
  var consigneeName;
  var consigneePhone;
  var consigneeCountry;
  var consigneeaddress;
  var consigneecity;
  var consigneestate;
  var consigneepincode;
  var consigneegstNo;
  var address;
  var city;
  var state;
  var pincode;
  var gstNo;

  MoveTo(
      {this.consigneeName,
        this.consigneePhone,
        this.consigneeCountry,
        this.consigneeaddress,
        this.consigneecity,
        this.consigneestate,
        this.consigneepincode,
        this.consigneegstNo,
        this.address,
        this.city,
        this.state,
        this.pincode,
        this.gstNo});

  MoveTo.fromJson(Map<String, dynamic> json) {
    consigneeName = json['consigneeName'];
    consigneePhone = json['consigneePhone'];
    consigneeCountry = json['consigneeCountry'];
    consigneeaddress = json['consigneeaddress'];
    consigneecity = json['consigneecity'];
    consigneestate = json['consigneestate'];
    consigneepincode = json['consigneepincode'];
    consigneegstNo = json['consigneegstNo'];
    address = json['address'];
    city = json['city'];
    state = json['state'];
    pincode = json['pincode'];
    gstNo = json['gstNo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['consigneeName'] = this.consigneeName;
    data['consigneePhone'] = this.consigneePhone;
    data['consigneeCountry'] = this.consigneeCountry;
    data['consigneeaddress'] = this.consigneeaddress;
    data['consigneecity'] = this.consigneecity;
    data['consigneestate'] = this.consigneestate;
    data['consigneepincode'] = this.consigneepincode;
    data['consigneegstNo'] = this.consigneegstNo;
    data['address'] = this.address;
    data['city'] = this.city;
    data['state'] = this.state;
    data['pincode'] = this.pincode;
    data['gstNo'] = this.gstNo;
    return data;
  }
}

class PackageDetails {
  var packageType;
  var packageNumber;
  var packageDescription;
  var packageActualWeight;
  var packageChangeWeight;
  var receivePackageCondition;
  var packageRemark;
  bool? allItemsInGoodCondition;
  var totalWeight;

  PackageDetails(
      {this.packageType,
        this.packageNumber,
        this.packageDescription,
        this.packageActualWeight,
        this.packageChangeWeight,
        this.receivePackageCondition,
        this.packageRemark,
        this.allItemsInGoodCondition,
        this.totalWeight});

  PackageDetails.fromJson(Map<String, dynamic> json) {
    packageType = json['packageType'];
    packageNumber = json['packageNumber'];
    packageDescription = json['packageDescription'];
    packageActualWeight = json['packageActualWeight'];
    packageChangeWeight = json['packageChangeWeight'];
    receivePackageCondition = json['receivePackageCondition'];
    packageRemark = json['packageRemark'];
    allItemsInGoodCondition = json['allItemsInGoodCondition'];
    totalWeight = json['totalWeight'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['packageType'] = this.packageType;
    data['packageNumber'] = this.packageNumber;
    data['packageDescription'] = this.packageDescription;
    data['packageActualWeight'] = this.packageActualWeight;
    data['packageChangeWeight'] = this.packageChangeWeight;
    data['receivePackageCondition'] = this.receivePackageCondition;
    data['packageRemark'] = this.packageRemark;
    data['allItemsInGoodCondition'] = this.allItemsInGoodCondition;
    data['totalWeight'] = this.totalWeight;
    return data;
  }
}

class PaymentDetails {
  var frightToBeBilled;
  var frightToPaid;
  var freightToPay;
  var totalBaseFreight;
  var loadingCharge;
  var unloadingCharge;
  var sTCharge;
  var otherCharge;
  var lRCNCharge;
  var paymentGst;
  var paymentGstPaidBy;
  var presentToBeBilled;
  bool? insurance;
  var insuranceAmount;

  PaymentDetails(
      {this.frightToBeBilled,
        this.frightToPaid,
        this.freightToPay,
        this.totalBaseFreight,
        this.loadingCharge,
        this.unloadingCharge,
        this.sTCharge,
        this.otherCharge,
        this.lRCNCharge,
        this.paymentGst,
        this.paymentGstPaidBy,
        this.presentToBeBilled,
        this.insurance,
        this.insuranceAmount});

  PaymentDetails.fromJson(Map<String, dynamic> json) {
    frightToBeBilled = json['frightToBeBilled'];
    frightToPaid = json['frightToPaid'];
    freightToPay = json['freightToPay'];
    totalBaseFreight = json['totalBaseFreight'];
    loadingCharge = json['loadingCharge'];
    unloadingCharge = json['unloadingCharge'];
    sTCharge = json['STCharge'];
    otherCharge = json['otherCharge'];
    lRCNCharge = json['LRCNCharge'];
    paymentGst = json['paymentGst'];
    paymentGstPaidBy = json['paymentGstPaidBy'];
    presentToBeBilled = json['presentToBeBilled'];
    insurance = json['insurance'];
    insuranceAmount = json['insuranceAmount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['frightToBeBilled'] = this.frightToBeBilled;
    data['frightToPaid'] = this.frightToPaid;
    data['freightToPay'] = this.freightToPay;
    data['totalBaseFreight'] = this.totalBaseFreight;
    data['loadingCharge'] = this.loadingCharge;
    data['unloadingCharge'] = this.unloadingCharge;
    data['STCharge'] = this.sTCharge;
    data['otherCharge'] = this.otherCharge;
    data['LRCNCharge'] = this.lRCNCharge;
    data['paymentGst'] = this.paymentGst;
    data['paymentGstPaidBy'] = this.paymentGstPaidBy;
    data['presentToBeBilled'] = this.presentToBeBilled;
    data['insurance'] = this.insurance;
    data['insuranceAmount'] = this.insuranceAmount;
    return data;
  }
}

class MaterialInsurance {
  var materialInsurance;
  var insuranceCompany;
  var policyNumber;
  var insuranceDate;
  var insuranceAmount;
  var insuranceRisk;

  MaterialInsurance(
      {this.materialInsurance,
        this.insuranceCompany,
        this.policyNumber,
        this.insuranceDate,
        this.insuranceAmount,
        this.insuranceRisk});

  MaterialInsurance.fromJson(Map<String, dynamic> json) {
    materialInsurance = json['materialInsurance'];
    insuranceCompany = json['insuranceCompany'];
    policyNumber = json['policyNumber'];
    insuranceDate = json['insuranceDate'];
    insuranceAmount = json['insuranceAmount'];
    insuranceRisk = json['insuranceRisk'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['materialInsurance'] = this.materialInsurance;
    data['insuranceCompany'] = this.insuranceCompany;
    data['policyNumber'] = this.policyNumber;
    data['insuranceDate'] = this.insuranceDate;
    data['insuranceAmount'] = this.insuranceAmount;
    data['insuranceRisk'] = this.insuranceRisk;
    return data;
  }
}

class DemurrageCharge {
  bool? demurrageChargeApplicable;
  var chargePerDay;
  var moreThanDays;

  DemurrageCharge(
      {this.demurrageChargeApplicable, this.chargePerDay, this.moreThanDays});

  DemurrageCharge.fromJson(Map<String, dynamic> json) {
    demurrageChargeApplicable = json['demurrageChargeApplicable'];
    chargePerDay = json['chargePerDay'];
    moreThanDays = json['moreThanDays'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['demurrageChargeApplicable'] = this.demurrageChargeApplicable;
    data['chargePerDay'] = this.chargePerDay;
    data['moreThanDays'] = this.moreThanDays;
    return data;
  }
}

class InvoiceEWayBill {
  var goodValue;
  var invoicebill;
  var invoiceDate;
  var eWayBillNumber;
  var eWayBillGenerateDate;
  var eWayBillExpireDate;
  var eWayBillExtendedPeriod;

  InvoiceEWayBill(
      {this.goodValue,
        this.invoicebill,
        this.invoiceDate,
        this.eWayBillNumber,
        this.eWayBillGenerateDate,
        this.eWayBillExpireDate,
        this.eWayBillExtendedPeriod});

  InvoiceEWayBill.fromJson(Map<String, dynamic> json) {
    goodValue = json['goodValue'];
    invoicebill = json['invoicebill'];
    invoiceDate = json['invoiceDate'];
    eWayBillNumber = json['eWayBillNumber'];
    eWayBillGenerateDate = json['eWayBillGenerateDate'];
    eWayBillExpireDate = json['eWayBillExpireDate'];
    eWayBillExtendedPeriod = json['eWayBillExtendedPeriod'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['goodValue'] = this.goodValue;
    data['invoicebill'] = this.invoicebill;
    data['invoiceDate'] = this.invoiceDate;
    data['eWayBillNumber'] = this.eWayBillNumber;
    data['eWayBillGenerateDate'] = this.eWayBillGenerateDate;
    data['eWayBillExpireDate'] = this.eWayBillExpireDate;
    data['eWayBillExtendedPeriod'] = this.eWayBillExtendedPeriod;
    return data;
  }
}

class Pagination {
  var total;
  var page;
  var limit;
  var totalPages;

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
