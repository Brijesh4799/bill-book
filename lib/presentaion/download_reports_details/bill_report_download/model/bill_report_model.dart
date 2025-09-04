class BillReportModel {
  bool? status;
  String? message;
  List<Data>? data;
  Pagination? pagination;

  BillReportModel({this.status, this.message, this.data, this.pagination});

  BillReportModel.fromJson(Map<String, dynamic> json) {
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
  String? billgstNo;
  String? billCountry;
  String? billstate;
  String? billcity;
  String? billpincode;
  String? billaddress;
  String? address;
  String? city;
  String? state;
  String? pincode;
  String? gstNo;

  BillingDetails(
      {this.customerName,
        this.customerPhone,
        this.billgstNo,
        this.billCountry,
        this.billstate,
        this.billcity,
        this.billpincode,
        this.billaddress,
        this.address,
        this.city,
        this.state,
        this.pincode,
        this.gstNo});

  BillingDetails.fromJson(Map<String, dynamic> json) {
    customerName = json['customerName'];
    customerPhone = json['customerPhone'];
    billgstNo = json['billgstNo'];
    billCountry = json['billCountry'];
    billstate = json['billstate'];
    billcity = json['billcity'];
    billpincode = json['billpincode'];
    billaddress = json['billaddress'];
    address = json['address'];
    city = json['city'];
    state = json['state'];
    pincode = json['pincode'];
    gstNo = json['gstNo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customerName'] = this.customerName;
    data['customerPhone'] = this.customerPhone;
    data['billgstNo'] = this.billgstNo;
    data['billCountry'] = this.billCountry;
    data['billstate'] = this.billstate;
    data['billcity'] = this.billcity;
    data['billpincode'] = this.billpincode;
    data['billaddress'] = this.billaddress;
    data['address'] = this.address;
    data['city'] = this.city;
    data['state'] = this.state;
    data['pincode'] = this.pincode;
    data['gstNo'] = this.gstNo;
    return data;
  }
}

class ConsignorDetails {
  String? consignorName;
  String? consignorPhone;
  String? consignorgstNo;
  String? consignorCountry;
  String? consignorstate;
  String? consignorcity;
  String? consignorpincode;
  String? consignoraddress;
  String? address;
  String? city;
  String? state;
  String? pincode;
  String? gstNo;

  ConsignorDetails(
      {this.consignorName,
        this.consignorPhone,
        this.consignorgstNo,
        this.consignorCountry,
        this.consignorstate,
        this.consignorcity,
        this.consignorpincode,
        this.consignoraddress,
        this.address,
        this.city,
        this.state,
        this.pincode,
        this.gstNo});

  ConsignorDetails.fromJson(Map<String, dynamic> json) {
    consignorName = json['consignorName'];
    consignorPhone = json['consignorPhone'];
    consignorgstNo = json['consignorgstNo'];
    consignorCountry = json['consignorCountry'];
    consignorstate = json['consignorstate'];
    consignorcity = json['consignorcity'];
    consignorpincode = json['consignorpincode'];
    consignoraddress = json['consignoraddress'];
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
    data['consignorgstNo'] = this.consignorgstNo;
    data['consignorCountry'] = this.consignorCountry;
    data['consignorstate'] = this.consignorstate;
    data['consignorcity'] = this.consignorcity;
    data['consignorpincode'] = this.consignorpincode;
    data['consignoraddress'] = this.consignoraddress;
    data['address'] = this.address;
    data['city'] = this.city;
    data['state'] = this.state;
    data['pincode'] = this.pincode;
    data['gstNo'] = this.gstNo;
    return data;
  }
}

class ConsigneeDetails {
  String? consigneeName;
  String? consigneePhone;
  String? consigneegstNo;
  String? consigneeCountry;
  String? consigneestate;
  String? consigneecity;
  String? consigneepincode;
  String? consigneeaddress;
  String? address;
  String? city;
  String? state;
  String? pincode;
  String? gstNo;

  ConsigneeDetails(
      {this.consigneeName,
        this.consigneePhone,
        this.consigneegstNo,
        this.consigneeCountry,
        this.consigneestate,
        this.consigneecity,
        this.consigneepincode,
        this.consigneeaddress,
        this.address,
        this.city,
        this.state,
        this.pincode,
        this.gstNo});

  ConsigneeDetails.fromJson(Map<String, dynamic> json) {
    consigneeName = json['consigneeName'];
    consigneePhone = json['consigneePhone'];
    consigneegstNo = json['consigneegstNo'];
    consigneeCountry = json['consigneeCountry'];
    consigneestate = json['consigneestate'];
    consigneecity = json['consigneecity'];
    consigneepincode = json['consigneepincode'];
    consigneeaddress = json['consigneeaddress'];
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
    data['consigneegstNo'] = this.consigneegstNo;
    data['consigneeCountry'] = this.consigneeCountry;
    data['consigneestate'] = this.consigneestate;
    data['consigneecity'] = this.consigneecity;
    data['consigneepincode'] = this.consigneepincode;
    data['consigneeaddress'] = this.consigneeaddress;
    data['address'] = this.address;
    data['city'] = this.city;
    data['state'] = this.state;
    data['pincode'] = this.pincode;
    data['gstNo'] = this.gstNo;
    return data;
  }
}

class PackageDetails {
  String? packageType;
  String? packagedescription;
  String? packagetotalWeight;
  String? packageHSN;
  String? packageRemark;
  String? totalWeight;
  String? description;

  PackageDetails(
      {this.packageType,
        this.packagedescription,
        this.packagetotalWeight,
        this.packageHSN,
        this.packageRemark,
        this.totalWeight,
        this.description});

  PackageDetails.fromJson(Map<String, dynamic> json) {
    packageType = json['packageType'];
    packagedescription = json['packagedescription'];
    packagetotalWeight = json['packagetotalWeight'];
    packageHSN = json['packageHSN'];
    packageRemark = json['packageRemark'];
    totalWeight = json['totalWeight'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['packageType'] = this.packageType;
    data['packagedescription'] = this.packagedescription;
    data['packagetotalWeight'] = this.packagetotalWeight;
    data['packageHSN'] = this.packageHSN;
    data['packageRemark'] = this.packageRemark;
    data['totalWeight'] = this.totalWeight;
    data['description'] = this.description;
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
  String? declarationValueOfGoods;

  InsuranceDetails(
      {this.insuranceType,
        this.insuranceCharges,
        this.declarationValueOfGoods});

  InsuranceDetails.fromJson(Map<String, dynamic> json) {
    insuranceType = json['insuranceType'];
    insuranceCharges = json['insuranceCharges'];
    declarationValueOfGoods = json['declarationValueOfGoods'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['insuranceType'] = this.insuranceType;
    data['insuranceCharges'] = this.insuranceCharges;
    data['declarationValueOfGoods'] = this.declarationValueOfGoods;
    return data;
  }
}

class VehicleInsuranceDetails {
  String? vehicleNumber;
  String? insuranceType;
  String? insuranceCharges;

  VehicleInsuranceDetails(
      {this.vehicleNumber, this.insuranceType, this.insuranceCharges});

  VehicleInsuranceDetails.fromJson(Map<String, dynamic> json) {
    vehicleNumber = json['vehicleNumber'];
    insuranceType = json['insuranceType'];
    insuranceCharges = json['insuranceCharges'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vehicleNumber'] = this.vehicleNumber;
    data['insuranceType'] = this.insuranceType;
    data['insuranceCharges'] = this.insuranceCharges;
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
