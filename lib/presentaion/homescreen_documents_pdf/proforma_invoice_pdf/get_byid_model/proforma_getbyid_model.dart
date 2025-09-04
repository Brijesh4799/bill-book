class ProformaGetDataByIdModel {
  bool? status;
  Data? data;

  ProformaGetDataByIdModel({this.status, this.data});

  ProformaGetDataByIdModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
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
  PreInvoiceDetails? preInvoiceDetails;
  BillingDetails? billingDetails;
  ConsignorDetails? consignorDetails;
  ConsigneeDetails? consigneeDetails;
  PackageDetails? packageDetails;
  PaymentDetails? paymentDetails;
  InsuranceDetails? insuranceDetails;
  VehicleInsuranceDetails? vehicleInsuranceDetails;

  FormData(
      {this.preInvoiceDetails,
        this.billingDetails,
        this.consignorDetails,
        this.consigneeDetails,
        this.packageDetails,
        this.paymentDetails,
        this.insuranceDetails,
        this.vehicleInsuranceDetails});

  FormData.fromJson(Map<String, dynamic> json) {
    preInvoiceDetails = json['preInvoiceDetails'] != null
        ? new PreInvoiceDetails.fromJson(json['preInvoiceDetails'])
        : null;
    billingDetails = json['billingDetails'] != null
        ? new BillingDetails.fromJson(json['billingDetails'])
        : null;
    consignorDetails = json['consignorDetails'] != null
        ? new ConsignorDetails.fromJson(json['consignorDetails'])
        : null;
    consigneeDetails = json['consigneeDetails'] != null
        ? new ConsigneeDetails.fromJson(json['consigneeDetails'])
        : null;
    packageDetails = json['packageDetails'] != null
        ? new PackageDetails.fromJson(json['packageDetails'])
        : null;
    paymentDetails = json['paymentDetails'] != null
        ? new PaymentDetails.fromJson(json['paymentDetails'])
        : null;
    insuranceDetails = json['insuranceDetails'] != null
        ? new InsuranceDetails.fromJson(json['insuranceDetails'])
        : null;
    vehicleInsuranceDetails = json['vehicleInsuranceDetails'] != null
        ? new VehicleInsuranceDetails.fromJson(json['vehicleInsuranceDetails'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.preInvoiceDetails != null) {
      data['preInvoiceDetails'] = this.preInvoiceDetails!.toJson();
    }
    if (this.billingDetails != null) {
      data['billingDetails'] = this.billingDetails!.toJson();
    }
    if (this.consignorDetails != null) {
      data['consignorDetails'] = this.consignorDetails!.toJson();
    }
    if (this.consigneeDetails != null) {
      data['consigneeDetails'] = this.consigneeDetails!.toJson();
    }
    if (this.packageDetails != null) {
      data['packageDetails'] = this.packageDetails!.toJson();
    }
    if (this.paymentDetails != null) {
      data['paymentDetails'] = this.paymentDetails!.toJson();
    }
    if (this.insuranceDetails != null) {
      data['insuranceDetails'] = this.insuranceDetails!.toJson();
    }
    if (this.vehicleInsuranceDetails != null) {
      data['vehicleInsuranceDetails'] = this.vehicleInsuranceDetails!.toJson();
    }
    return data;
  }
}

class PreInvoiceDetails {
  String? preInvoiceNumber;
  String? preCompanyName;
  String? preInvoiceDate;
  String? preDeliveryDate;
  String? preGst;
  String? shipment;
  String? gstShow;
  String? typeShipment;
  String? movingPathRemark;
  String? moveFrom;
  String? moveto;
  String? vehicleNumber;

  PreInvoiceDetails(
      {this.preInvoiceNumber,
        this.preCompanyName,
        this.preInvoiceDate,
        this.preDeliveryDate,
        this.preGst,
        this.shipment,
        this.gstShow,
        this.typeShipment,
        this.movingPathRemark,
        this.moveFrom,
        this.moveto,
        this.vehicleNumber});

  PreInvoiceDetails.fromJson(Map<String, dynamic> json) {
    preInvoiceNumber = json['preInvoiceNumber'];
    preCompanyName = json['preCompanyName'];
    preInvoiceDate = json['preInvoiceDate'];
    preDeliveryDate = json['preDeliveryDate'];
    preGst = json['preGst'];
    shipment = json['Shipment'];
    gstShow = json['gstShow'];
    typeShipment = json['typeShipment'];
    movingPathRemark = json['movingPathRemark'];
    moveFrom = json['moveFrom'];
    moveto = json['moveto'];
    vehicleNumber = json['vehicleNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['preInvoiceNumber'] = this.preInvoiceNumber;
    data['preCompanyName'] = this.preCompanyName;
    data['preInvoiceDate'] = this.preInvoiceDate;
    data['preDeliveryDate'] = this.preDeliveryDate;
    data['preGst'] = this.preGst;
    data['Shipment'] = this.shipment;
    data['gstShow'] = this.gstShow;
    data['typeShipment'] = this.typeShipment;
    data['movingPathRemark'] = this.movingPathRemark;
    data['moveFrom'] = this.moveFrom;
    data['moveto'] = this.moveto;
    data['vehicleNumber'] = this.vehicleNumber;
    return data;
  }
}

class BillingDetails {
  String? customerName;
  String? customerPhone;
  String? customerGstNumber;
  String? customerCountry;
  String? customeraddress;
  String? customercity;
  String? customerstate;
  String? customerpincode;
  String? customergstNo;

  BillingDetails(
      {this.customerName,
        this.customerPhone,
        this.customerGstNumber,
        this.customerCountry,
        this.customeraddress,
        this.customercity,
        this.customerstate,
        this.customerpincode,
        this.customergstNo});

  BillingDetails.fromJson(Map<String, dynamic> json) {
    customerName = json['customerName'];
    customerPhone = json['customerPhone'];
    customerGstNumber = json['customerGstNumber'];
    customerCountry = json['customerCountry'];
    customeraddress = json['customeraddress'];
    customercity = json['customercity'];
    customerstate = json['customerstate'];
    customerpincode = json['customerpincode'];
    customergstNo = json['customergstNo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customerName'] = this.customerName;
    data['customerPhone'] = this.customerPhone;
    data['customerGstNumber'] = this.customerGstNumber;
    data['customerCountry'] = this.customerCountry;
    data['customeraddress'] = this.customeraddress;
    data['customercity'] = this.customercity;
    data['customerstate'] = this.customerstate;
    data['customerpincode'] = this.customerpincode;
    data['customergstNo'] = this.customergstNo;
    return data;
  }
}

class ConsignorDetails {
  String? consignorName;
  String? consignorPhone;
  String? consignorcountry;
  String? consignoraddress;
  String? consignorcity;
  String? consignorstate;
  String? consignorpincode;
  String? consignorgstNo;

  ConsignorDetails(
      {this.consignorName,
        this.consignorPhone,
        this.consignorcountry,
        this.consignoraddress,
        this.consignorcity,
        this.consignorstate,
        this.consignorpincode,
        this.consignorgstNo});

  ConsignorDetails.fromJson(Map<String, dynamic> json) {
    consignorName = json['consignorName'];
    consignorPhone = json['consignorPhone'];
    consignorcountry = json['consignorcountry'];
    consignoraddress = json['consignoraddress'];
    consignorcity = json['consignorcity'];
    consignorstate = json['consignorstate'];
    consignorpincode = json['consignorpincode'];
    consignorgstNo = json['consignorgstNo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['consignorName'] = this.consignorName;
    data['consignorPhone'] = this.consignorPhone;
    data['consignorcountry'] = this.consignorcountry;
    data['consignoraddress'] = this.consignoraddress;
    data['consignorcity'] = this.consignorcity;
    data['consignorstate'] = this.consignorstate;
    data['consignorpincode'] = this.consignorpincode;
    data['consignorgstNo'] = this.consignorgstNo;
    return data;
  }
}

class ConsigneeDetails {
  String? consigneeName;
  String? consigneePhone;
  String? consigneeCountry;
  String? consigneeaddress;
  String? consigneecity;
  String? consigneestate;
  String? consigneepincode;
  String? consigneegstNo;

  ConsigneeDetails(
      {this.consigneeName,
        this.consigneePhone,
        this.consigneeCountry,
        this.consigneeaddress,
        this.consigneecity,
        this.consigneestate,
        this.consigneepincode,
        this.consigneegstNo});

  ConsigneeDetails.fromJson(Map<String, dynamic> json) {
    consigneeName = json['consigneeName'];
    consigneePhone = json['consigneePhone'];
    consigneeCountry = json['consigneeCountry'];
    consigneeaddress = json['consigneeaddress'];
    consigneecity = json['consigneecity'];
    consigneestate = json['consigneestate'];
    consigneepincode = json['consigneepincode'];
    consigneegstNo = json['consigneegstNo'];
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
    return data;
  }
}

class PackageDetails {
  String? packageType;
  String? totalWeightUnit;
  String? totalWeight;
  String? description;
  String? hsnCode;
  String? detailsremark;

  PackageDetails(
      {this.packageType,
        this.totalWeightUnit,
        this.totalWeight,
        this.description,
        this.hsnCode,
        this.detailsremark});

  PackageDetails.fromJson(Map<String, dynamic> json) {
    packageType = json['packageType'];
    totalWeightUnit = json['totalWeightUnit'];
    totalWeight = json['totalWeight'];
    description = json['description'];
    hsnCode = json['hsnCode'];
    detailsremark = json['detailsremark'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['packageType'] = this.packageType;
    data['totalWeightUnit'] = this.totalWeightUnit;
    data['totalWeight'] = this.totalWeight;
    data['description'] = this.description;
    data['hsnCode'] = this.hsnCode;
    data['detailsremark'] = this.detailsremark;
    return data;
  }
}

class PaymentDetails {
  String? freightCharge;
  String? advancePaid;
  String? packingCharge;
  String? unPackedCharge;
  String? paymentMode;
  String? unloadingCharges;
  String? loadingCharges;
  String? packingMaterialCharge;
  String? storgeCharge;
  String? carBikeTPT;
  String? miscellaneousCharge;
  String? otherCharges;
  String? stCharge;
  String? greenTax;
  String? surcharge;
  String? gstShow;
  String? paymentGstNo;
  String? paymentGstType;
  String? reverseCharge;
  String? gstPaidBy;
  String? paymentRemark;
  String? paymentDiscount;

  PaymentDetails(
      {this.freightCharge,
        this.advancePaid,
        this.packingCharge,
        this.unPackedCharge,
        this.paymentMode,
        this.unloadingCharges,
        this.loadingCharges,
        this.packingMaterialCharge,
        this.storgeCharge,
        this.carBikeTPT,
        this.miscellaneousCharge,
        this.otherCharges,
        this.stCharge,
        this.greenTax,
        this.surcharge,
        this.gstShow,
        this.paymentGstNo,
        this.paymentGstType,
        this.reverseCharge,
        this.gstPaidBy,
        this.paymentRemark,
        this.paymentDiscount});

  PaymentDetails.fromJson(Map<String, dynamic> json) {
    freightCharge = json['freightCharge'];
    advancePaid = json['advancePaid'];
    packingCharge = json['packingCharge'];
    unPackedCharge = json['unPackedCharge'];
    paymentMode = json['paymentMode'];
    unloadingCharges = json['unloadingCharges'];
    loadingCharges = json['loadingCharges'];
    packingMaterialCharge = json['packingMaterialCharge'];
    storgeCharge = json['storgeCharge'];
    carBikeTPT = json['carBikeTPT'];
    miscellaneousCharge = json['miscellaneousCharge'];
    otherCharges = json['otherCharges'];
    stCharge = json['stCharge'];
    greenTax = json['greenTax'];
    surcharge = json['surcharge'];
    gstShow = json['gstShow'];
    paymentGstNo = json['paymentGstNo'];
    paymentGstType = json['paymentGstType'];
    reverseCharge = json['reverseCharge'];
    gstPaidBy = json['gstPaidBy'];
    paymentRemark = json['paymentRemark'];
    paymentDiscount = json['paymentDiscount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['freightCharge'] = this.freightCharge;
    data['advancePaid'] = this.advancePaid;
    data['packingCharge'] = this.packingCharge;
    data['unPackedCharge'] = this.unPackedCharge;
    data['paymentMode'] = this.paymentMode;
    data['unloadingCharges'] = this.unloadingCharges;
    data['loadingCharges'] = this.loadingCharges;
    data['packingMaterialCharge'] = this.packingMaterialCharge;
    data['storgeCharge'] = this.storgeCharge;
    data['carBikeTPT'] = this.carBikeTPT;
    data['miscellaneousCharge'] = this.miscellaneousCharge;
    data['otherCharges'] = this.otherCharges;
    data['stCharge'] = this.stCharge;
    data['greenTax'] = this.greenTax;
    data['surcharge'] = this.surcharge;
    data['gstShow'] = this.gstShow;
    data['paymentGstNo'] = this.paymentGstNo;
    data['paymentGstType'] = this.paymentGstType;
    data['reverseCharge'] = this.reverseCharge;
    data['gstPaidBy'] = this.gstPaidBy;
    data['paymentRemark'] = this.paymentRemark;
    data['paymentDiscount'] = this.paymentDiscount;
    return data;
  }
}

class InsuranceDetails {
  String? insuranceType;
  String? insuranceCharges;
  String? insuranceGst;
  String? declarationValueOfGoods;

  InsuranceDetails(
      {this.insuranceType,
        this.insuranceCharges,
        this.insuranceGst,
        this.declarationValueOfGoods});

  InsuranceDetails.fromJson(Map<String, dynamic> json) {
    insuranceType = json['insuranceType'];
    insuranceCharges = json['insuranceCharges'];
    insuranceGst = json['insuranceGst'];
    declarationValueOfGoods = json['declarationValueOfGoods'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['insuranceType'] = this.insuranceType;
    data['insuranceCharges'] = this.insuranceCharges;
    data['insuranceGst'] = this.insuranceGst;
    data['declarationValueOfGoods'] = this.declarationValueOfGoods;
    return data;
  }
}

class VehicleInsuranceDetails {
  String? vehicleNumber;
  String? vehicleGst;
  String? insuranceType;
  String? insuranceCharges;

  VehicleInsuranceDetails(
      {this.vehicleNumber,
        this.vehicleGst,
        this.insuranceType,
        this.insuranceCharges});

  VehicleInsuranceDetails.fromJson(Map<String, dynamic> json) {
    vehicleNumber = json['vehicleNumber'];
    vehicleGst = json['vehicleGst'];
    insuranceType = json['insuranceType'];
    insuranceCharges = json['insuranceCharges'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vehicleNumber'] = this.vehicleNumber;
    data['vehicleGst'] = this.vehicleGst;
    data['insuranceType'] = this.insuranceType;
    data['insuranceCharges'] = this.insuranceCharges;
    return data;
  }
}
