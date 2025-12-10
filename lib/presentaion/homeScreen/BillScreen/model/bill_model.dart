class BillDetailsModel {
  bool? status;
  String? message;
  Data? data;

  BillDetailsModel({this.status, this.message, this.data});

  BillDetailsModel.fromJson(Map<String, dynamic> json) {
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
  InvoiceDetails? invoiceDetails;
  BillingDetails? billingDetails;
  ConsignorDetails? consignorDetails;
  ConsigneeDetails? consigneeDetails;
  PackageDetails? packageDetails;
  PaymentDetails? paymentDetails;
  InsuranceDetails? insuranceDetails;
  VehicleInsuranceDetails? vehicleInsuranceDetails;

  FormData(
      {this.invoiceDetails,
        this.billingDetails,
        this.consignorDetails,
        this.consigneeDetails,
        this.packageDetails,
        this.paymentDetails,
        this.insuranceDetails,
        this.vehicleInsuranceDetails});

  FormData.fromJson(Map<String, dynamic> json) {
    invoiceDetails = json['invoiceDetails'] != null
        ? new InvoiceDetails.fromJson(json['invoiceDetails'])
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

  get lrDetails => null;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.invoiceDetails != null) {
      data['invoiceDetails'] = this.invoiceDetails!.toJson();
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

class InvoiceDetails {
  String? invoiceNumber;
  String? invoiCecompanyName;
  String? invoiceLRNumber;
  String? invoiceDate;
  String? invoiceDeliveryDate;
  String? invoiceMovingPath;
  String? invoiceShipmentType;
  String? invoiceMovicePathRemark;
  String? invoiceMovePath;
  String? invoiceMoveTo;
  String? invoiceVehicleNumber;

  InvoiceDetails(
      {this.invoiceNumber,
        this.invoiCecompanyName,
        this.invoiceLRNumber,
        this.invoiceDate,
        this.invoiceDeliveryDate,
        this.invoiceMovingPath,
        this.invoiceShipmentType,
        this.invoiceMovicePathRemark,
        this.invoiceMovePath,
        this.invoiceMoveTo,
        this.invoiceVehicleNumber});

  InvoiceDetails.fromJson(Map<String, dynamic> json) {
    invoiceNumber = json['invoiceNumber'];
    invoiCecompanyName = json['invoiCecompanyName'];
    invoiceLRNumber = json['invoiceLRNumber'];
    invoiceDate = json['invoiceDate'];
    invoiceDeliveryDate = json['invoiceDeliveryDate'];
    invoiceMovingPath = json['invoiceMovingPath'];
    invoiceShipmentType = json['invoiceShipmentType'];
    invoiceMovicePathRemark = json['invoiceMovicePathRemark'];
    invoiceMovePath = json['invoiceMovePath'];
    invoiceMoveTo = json['invoiceMoveTo'];
    invoiceVehicleNumber = json['invoiceVehicleNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['invoiceNumber'] = this.invoiceNumber;
    data['invoiCecompanyName'] = this.invoiCecompanyName;
    data['invoiceLRNumber'] = this.invoiceLRNumber;
    data['invoiceDate'] = this.invoiceDate;
    data['invoiceDeliveryDate'] = this.invoiceDeliveryDate;
    data['invoiceMovingPath'] = this.invoiceMovingPath;
    data['invoiceShipmentType'] = this.invoiceShipmentType;
    data['invoiceMovicePathRemark'] = this.invoiceMovicePathRemark;
    data['invoiceMovePath'] = this.invoiceMovePath;
    data['invoiceMoveTo'] = this.invoiceMoveTo;
    data['invoiceVehicleNumber'] = this.invoiceVehicleNumber;
    return data;
  }
}

class BillingDetails {
  String? customerName;
  String? customerPhone;
  String? billCountry;
  String? billaddress;
  String? billcity;
  String? billstate;
  String? billpincode;
  String? billgstNo;

  BillingDetails(
      {this.customerName,
        this.customerPhone,
        this.billCountry,
        this.billaddress,
        this.billcity,
        this.billstate,
        this.billpincode,
        this.billgstNo});

  BillingDetails.fromJson(Map<String, dynamic> json) {
    customerName = json['customerName'];
    customerPhone = json['customerPhone'];
    billCountry = json['billCountry'];
    billaddress = json['billaddress'];
    billcity = json['billcity'];
    billstate = json['billstate'];
    billpincode = json['billpincode'];
    billgstNo = json['billgstNo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customerName'] = this.customerName;
    data['customerPhone'] = this.customerPhone;
    data['billCountry'] = this.billCountry;
    data['billaddress'] = this.billaddress;
    data['billcity'] = this.billcity;
    data['billstate'] = this.billstate;
    data['billpincode'] = this.billpincode;
    data['billgstNo'] = this.billgstNo;
    return data;
  }
}

class ConsignorDetails {
  String? consignorName;
  String? consignorPhone;
  String? consignoraddress;
  String? consignorCountry;
  String? consignorcity;
  String? consignorstate;
  String? consignorpincode;
  String? consignorgstNo;

  ConsignorDetails(
      {this.consignorName,
        this.consignorPhone,
        this.consignoraddress,
        this.consignorCountry,
        this.consignorcity,
        this.consignorstate,
        this.consignorpincode,
        this.consignorgstNo});

  ConsignorDetails.fromJson(Map<String, dynamic> json) {
    consignorName = json['consignorName'];
    consignorPhone = json['consignorPhone'];
    consignoraddress = json['consignoraddress'];
    consignorCountry = json['consignorCountry'];
    consignorcity = json['consignorcity'];
    consignorstate = json['consignorstate'];
    consignorpincode = json['consignorpincode'];
    consignorgstNo = json['consignorgstNo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['consignorName'] = this.consignorName;
    data['consignorPhone'] = this.consignorPhone;
    data['consignoraddress'] = this.consignoraddress;
    data['consignorCountry'] = this.consignorCountry;
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
  String? packagetotalWeight;
  String? packagetotalWeightype;
  String? packagedescription;
  String? packageHSN;
  String? packageRemark;

  PackageDetails(
      {this.packageType,
        this.packagetotalWeight,
        this.packagetotalWeightype,
        this.packagedescription,
        this.packageHSN,
        this.packageRemark});

  PackageDetails.fromJson(Map<String, dynamic> json) {
    packageType = json['packageType'];
    packagetotalWeight = json['packagetotalWeight'];
    packagetotalWeightype = json['packagetotalWeightype'];
    packagedescription = json['packagedescription'];
    packageHSN = json['packageHSN'];
    packageRemark = json['packageRemark'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['packageType'] = this.packageType;
    data['packagetotalWeight'] = this.packagetotalWeight;
    data['packagetotalWeightype'] = this.packagetotalWeightype;
    data['packagedescription'] = this.packagedescription;
    data['packageHSN'] = this.packageHSN;
    data['packageRemark'] = this.packageRemark;
    return data;
  }
}

class PaymentDetails {
  String? freightCharges;
  String? advancePaid;
  String? packingCharge;
  String? unPackingCharge;
  String? paymentMode;
  String? unloadingCharges;
  String? loadingCharges;
  String? packingMaterialCharge;
  String? packingStorgeCharge;
  String? packingCarBikeTPT;
  String? packingMiscellaneous;
  String? otherCharges;
  String? packingSTCharge;
  String? packingGreenTax;
  String? packingSurcharge;
  String? packingGstShow;
  String? packingGstNo;
  String? packingGstType;
  String? packingReverseCharge;
  String? packingGstPaidBy;
  String? packingPaymentRemark;
  String? packingDiscountAmount;
  String? totalAmount;

  PaymentDetails(
      {this.freightCharges,
        this.advancePaid,
        this.packingCharge,
        this.unPackingCharge,
        this.paymentMode,
        this.unloadingCharges,
        this.loadingCharges,
        this.packingMaterialCharge,
        this.packingStorgeCharge,
        this.packingCarBikeTPT,
        this.packingMiscellaneous,
        this.otherCharges,
        this.packingSTCharge,
        this.packingGreenTax,
        this.packingSurcharge,
        this.packingGstShow,
        this.packingGstNo,
        this.packingGstType,
        this.packingReverseCharge,
        this.packingGstPaidBy,
        this.packingPaymentRemark,
        this.packingDiscountAmount,
        this.totalAmount});

  PaymentDetails.fromJson(Map<String, dynamic> json) {
    freightCharges = json['freightCharges'];
    advancePaid = json['advancePaid'];
    packingCharge = json['packingCharge'];
    unPackingCharge = json['unPackingCharge'];
    paymentMode = json['paymentMode'];
    unloadingCharges = json['unloadingCharges'];
    loadingCharges = json['loadingCharges'];
    packingMaterialCharge = json['packingMaterialCharge'];
    packingStorgeCharge = json['packingStorgeCharge'];
    packingCarBikeTPT = json['packingCarBikeTPT'];
    packingMiscellaneous = json['packingMiscellaneous'];
    otherCharges = json['otherCharges'];
    packingSTCharge = json['packingSTCharge'];
    packingGreenTax = json['packingGreenTax'];
    packingSurcharge = json['packingSurcharge'];
    packingGstShow = json['packingGstShow'];
    packingGstNo = json['packingGstNo'];
    packingGstType = json['packingGstType'];
    packingReverseCharge = json['packingReverseCharge'];
    packingGstPaidBy = json['packingGstPaidBy'];
    packingPaymentRemark = json['packingPaymentRemark'];
    packingDiscountAmount = json['packingDiscountAmount'];
    totalAmount = json['totalAmount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['freightCharges'] = this.freightCharges;
    data['advancePaid'] = this.advancePaid;
    data['packingCharge'] = this.packingCharge;
    data['unPackingCharge'] = this.unPackingCharge;
    data['paymentMode'] = this.paymentMode;
    data['unloadingCharges'] = this.unloadingCharges;
    data['loadingCharges'] = this.loadingCharges;
    data['packingMaterialCharge'] = this.packingMaterialCharge;
    data['packingStorgeCharge'] = this.packingStorgeCharge;
    data['packingCarBikeTPT'] = this.packingCarBikeTPT;
    data['packingMiscellaneous'] = this.packingMiscellaneous;
    data['otherCharges'] = this.otherCharges;
    data['packingSTCharge'] = this.packingSTCharge;
    data['packingGreenTax'] = this.packingGreenTax;
    data['packingSurcharge'] = this.packingSurcharge;
    data['packingGstShow'] = this.packingGstShow;
    data['packingGstNo'] = this.packingGstNo;
    data['packingGstType'] = this.packingGstType;
    data['packingReverseCharge'] = this.packingReverseCharge;
    data['packingGstPaidBy'] = this.packingGstPaidBy;
    data['packingPaymentRemark'] = this.packingPaymentRemark;
    data['packingDiscountAmount'] = this.packingDiscountAmount;
    data['totalAmount'] = this.totalAmount;
    return data;
  }
}

class InsuranceDetails {
  String? insuranceType;
  String? insuranceCharges;
  String? insuranceCharges1;
  String? declarationValueOfGoods;

  InsuranceDetails(
      {this.insuranceType,
        this.insuranceCharges,
        this.insuranceCharges1,
        this.declarationValueOfGoods});

  InsuranceDetails.fromJson(Map<String, dynamic> json) {
    insuranceType = json['insuranceType'];
    insuranceCharges = json['insuranceCharges'];
    insuranceCharges1 = json['insuranceCharges1'];
    declarationValueOfGoods = json['declarationValueOfGoods'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['insuranceType'] = this.insuranceType;
    data['insuranceCharges'] = this.insuranceCharges;
    data['insuranceCharges1'] = this.insuranceCharges1;
    data['declarationValueOfGoods'] = this.declarationValueOfGoods;
    return data;
  }
}

class VehicleInsuranceDetails {
  String? vehicleNumber;
  String? insuranceType;
  String? insuranceType1;
  String? insuranceCharges;

  VehicleInsuranceDetails(
      {this.vehicleNumber, this.insuranceType, this.insuranceCharges,this.insuranceType1});

  VehicleInsuranceDetails.fromJson(Map<String, dynamic> json) {
    vehicleNumber = json['vehicleNumber'];
    insuranceType = json['insuranceType'];
    insuranceType1 = json['insuranceType1'];
    insuranceCharges = json['insuranceCharges'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vehicleNumber'] = this.vehicleNumber;
    data['insuranceType'] = this.insuranceType;
    data['insuranceType1'] = this.insuranceType1;
    data['insuranceCharges'] = this.insuranceCharges;
    return data;
  }
}
