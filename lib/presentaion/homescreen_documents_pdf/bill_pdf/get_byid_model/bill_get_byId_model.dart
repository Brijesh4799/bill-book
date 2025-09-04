class BillGetDataByIdModel {
  final bool status;
  final BillData? data;

  BillGetDataByIdModel({
    required this.status,
    this.data,
  });

  factory BillGetDataByIdModel.fromJson(Map<String, dynamic> json) {
    return BillGetDataByIdModel(
      status: json['status'] ?? false,
      data: json['data'] != null ? BillData.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'data': data?.toJson(),
    };
  }
}

class BillData {
  final String id;
  final String userId;
  final FormData formData;
  final String status;
  final String createdAt;
  final String updatedAt;
  final int v;

  BillData({
    required this.id,
    required this.userId,
    required this.formData,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory BillData.fromJson(Map<String, dynamic> json) {
    return BillData(
      id: json['_id'] ?? '',
      userId: json['userId'] ?? '',
      formData: FormData.fromJson(json['formData']),
      status: json['status'] ?? '',
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
      v: json['__v'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'userId': userId,
      'formData': formData.toJson(),
      'status': status,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      '__v': v,
    };
  }
}

class FormData {
  final InvoiceDetails invoiceDetails;
  final BillingDetails billingDetails;
  final ConsignorDetails consignorDetails;
  final ConsigneeDetails consigneeDetails;
  final PackageDetails packageDetails;
  final PaymentDetails paymentDetails;
  final InsuranceDetails insuranceDetails;
  final VehicleInsuranceDetails vehicleInsuranceDetails;

  FormData({
    required this.invoiceDetails,
    required this.billingDetails,
    required this.consignorDetails,
    required this.consigneeDetails,
    required this.packageDetails,
    required this.paymentDetails,
    required this.insuranceDetails,
    required this.vehicleInsuranceDetails,
  });

  factory FormData.fromJson(Map<String, dynamic> json) {
    return FormData(
      invoiceDetails: InvoiceDetails.fromJson(json['invoiceDetails']),
      billingDetails: BillingDetails.fromJson(json['billingDetails']),
      consignorDetails: ConsignorDetails.fromJson(json['consignorDetails']),
      consigneeDetails: ConsigneeDetails.fromJson(json['consigneeDetails']),
      packageDetails: PackageDetails.fromJson(json['packageDetails']),
      paymentDetails: PaymentDetails.fromJson(json['paymentDetails']),
      insuranceDetails: InsuranceDetails.fromJson(json['insuranceDetails']),
      vehicleInsuranceDetails: VehicleInsuranceDetails.fromJson(json['vehicleInsuranceDetails']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'invoiceDetails': invoiceDetails.toJson(),
      'billingDetails': billingDetails.toJson(),
      'consignorDetails': consignorDetails.toJson(),
      'consigneeDetails': consigneeDetails.toJson(),
      'packageDetails': packageDetails.toJson(),
      'paymentDetails': paymentDetails.toJson(),
      'insuranceDetails': insuranceDetails.toJson(),
      'vehicleInsuranceDetails': vehicleInsuranceDetails.toJson(),
    };
  }
}

class InvoiceDetails {
  final String invoiceNumber;
  final String invoiCecompanyName;
  final String invoiceLRNumber;
  final String invoiceDate;
  final String invoiceDeliveryDate;
  final String invoiceMovingPath;
  final String invoiceShipmentType;
  final String invoiceMovicePathRemark;
  final String invoiceMovePath;
  final String invoiceMoveTo;
  final String invoiceVehicleNumber;

  InvoiceDetails({
    required this.invoiceNumber,
    required this.invoiCecompanyName,
    required this.invoiceLRNumber,
    required this.invoiceDate,
    required this.invoiceDeliveryDate,
    required this.invoiceMovingPath,
    required this.invoiceShipmentType,
    required this.invoiceMovicePathRemark,
    required this.invoiceMovePath,
    required this.invoiceMoveTo,
    required this.invoiceVehicleNumber,
  });

  factory InvoiceDetails.fromJson(Map<String, dynamic> json) {
    return InvoiceDetails(
      invoiceNumber: json['invoiceNumber'] ?? '',
      invoiCecompanyName: json['invoiCecompanyName'] ?? '',
      invoiceLRNumber: json['invoiceLRNumber'] ?? '',
      invoiceDate: json['invoiceDate'] ?? '',
      invoiceDeliveryDate: json['invoiceDeliveryDate'] ?? '',
      invoiceMovingPath: json['invoiceMovingPath'] ?? '',
      invoiceShipmentType: json['invoiceShipmentType'] ?? '',
      invoiceMovicePathRemark: json['invoiceMovicePathRemark'] ?? '',
      invoiceMovePath: json['invoiceMovePath'] ?? '',
      invoiceMoveTo: json['invoiceMoveTo'] ?? '',
      invoiceVehicleNumber: json['invoiceVehicleNumber'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'invoiceNumber': invoiceNumber,
      'invoiCecompanyName': invoiCecompanyName,
      'invoiceLRNumber': invoiceLRNumber,
      'invoiceDate': invoiceDate,
      'invoiceDeliveryDate': invoiceDeliveryDate,
      'invoiceMovingPath': invoiceMovingPath,
      'invoiceShipmentType': invoiceShipmentType,
      'invoiceMovicePathRemark': invoiceMovicePathRemark,
      'invoiceMovePath': invoiceMovePath,
      'invoiceMoveTo': invoiceMoveTo,
      'invoiceVehicleNumber': invoiceVehicleNumber,
    };
  }
}

class BillingDetails {
  final String customerName;
  final String customerPhone;
  final String billCountry;
  final String billaddress;
  final String billcity;
  final String billstate;
  final String billpincode;
  final String billgstNo;

  BillingDetails({
    required this.customerName,
    required this.customerPhone,
    required this.billCountry,
    required this.billaddress,
    required this.billcity,
    required this.billstate,
    required this.billpincode,
    required this.billgstNo,
  });

  factory BillingDetails.fromJson(Map<String, dynamic> json) {
    return BillingDetails(
      customerName: json['customerName'] ?? '',
      customerPhone: json['customerPhone'] ?? '',
      billCountry: json['billCountry'] ?? '',
      billaddress: json['billaddress'] ?? '',
      billcity: json['billcity'] ?? '',
      billstate: json['billstate'] ?? '',
      billpincode: json['billpincode'] ?? '',
      billgstNo: json['billgstNo'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'customerName': customerName,
      'customerPhone': customerPhone,
      'billCountry': billCountry,
      'billaddress': billaddress,
      'billcity': billcity,
      'billstate': billstate,
      'billpincode': billpincode,
      'billgstNo': billgstNo,
    };
  }
}

class ConsignorDetails {
  final String consignorName;
  final String consignorPhone;
  final String consignoraddress;
  final String consignorCountry;
  final String consignorcity;
  final String consignorstate;
  final String consignorpincode;
  final String consignorgstNo;

  ConsignorDetails({
    required this.consignorName,
    required this.consignorPhone,
    required this.consignoraddress,
    required this.consignorCountry,
    required this.consignorcity,
    required this.consignorstate,
    required this.consignorpincode,
    required this.consignorgstNo,
  });

  factory ConsignorDetails.fromJson(Map<String, dynamic> json) {
    return ConsignorDetails(
      consignorName: json['consignorName'] ?? '',
      consignorPhone: json['consignorPhone'] ?? '',
      consignoraddress: json['consignoraddress'] ?? '',
      consignorCountry: json['consignorCountry'] ?? '',
      consignorcity: json['consignorcity'] ?? '',
      consignorstate: json['consignorstate'] ?? '',
      consignorpincode: json['consignorpincode'] ?? '',
      consignorgstNo: json['consignorgstNo'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'consignorName': consignorName,
      'consignorPhone': consignorPhone,
      'consignoraddress': consignoraddress,
      'consignorCountry': consignorCountry,
      'consignorcity': consignorcity,
      'consignorstate': consignorstate,
      'consignorpincode': consignorpincode,
      'consignorgstNo': consignorgstNo,
    };
  }
}

class ConsigneeDetails {
  final String consigneeName;
  final String consigneePhone;
  final String consigneeCountry;
  final String consigneeaddress;
  final String consigneecity;
  final String consigneestate;
  final String consigneepincode;
  final String consigneegstNo;

  ConsigneeDetails({
    required this.consigneeName,
    required this.consigneePhone,
    required this.consigneeCountry,
    required this.consigneeaddress,
    required this.consigneecity,
    required this.consigneestate,
    required this.consigneepincode,
    required this.consigneegstNo,
  });

  factory ConsigneeDetails.fromJson(Map<String, dynamic> json) {
    return ConsigneeDetails(
      consigneeName: json['consigneeName'] ?? '',
      consigneePhone: json['consigneePhone'] ?? '',
      consigneeCountry: json['consigneeCountry'] ?? '',
      consigneeaddress: json['consigneeaddress'] ?? '',
      consigneecity: json['consigneecity'] ?? '',
      consigneestate: json['consigneestate'] ?? '',
      consigneepincode: json['consigneepincode'] ?? '',
      consigneegstNo: json['consigneegstNo'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'consigneeName': consigneeName,
      'consigneePhone': consigneePhone,
      'consigneeCountry': consigneeCountry,
      'consigneeaddress': consigneeaddress,
      'consigneecity': consigneecity,
      'consigneestate': consigneestate,
      'consigneepincode': consigneepincode,
      'consigneegstNo': consigneegstNo,
    };
  }
}

class PackageDetails {
  final String packageType;
  final String packagetotalWeight;
  final String packagedescription;
  final String packageHSN;
  final String packageRemark;

  PackageDetails({
    required this.packageType,
    required this.packagetotalWeight,
    required this.packagedescription,
    required this.packageHSN,
    required this.packageRemark,
  });

  factory PackageDetails.fromJson(Map<String, dynamic> json) {
    return PackageDetails(
      packageType: json['packageType'] ?? '',
      packagetotalWeight: json['packagetotalWeight'] ?? '',
      packagedescription: json['packagedescription'] ?? '',
      packageHSN: json['packageHSN'] ?? '',
      packageRemark: json['packageRemark'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'packageType': packageType,
      'packagetotalWeight': packagetotalWeight,
      'packagedescription': packagedescription,
      'packageHSN': packageHSN,
      'packageRemark': packageRemark,
    };
  }
}

class PaymentDetails {
  final String freightCharges;
  final String advancePaid;
  final String packingCharge;
  final String unPackingCharge;
  final String paymentMode;
  final String unloadingCharges;
  final String loadingCharges;
  final String packingMaterialCharge;
  final String packingStorgeCharge;
  final String packingCarBikeTPT;
  final String packingMiscellaneous;
  final String otherCharges;
  final String packingSTCharge;
  final String packingGreenTax;
  final String packingSurcharge;
  final String packingGstShow;
  final String packingGstNo;
  final String packingGstType;
  final String packingReverseCharge;
  final String packingGstPaidBy;
  final String packingPaymentRemark;
  final String packingDiscountAmount;
  final String totalAmount;

  PaymentDetails({
    required this.freightCharges,
    required this.advancePaid,
    required this.packingCharge,
    required this.unPackingCharge,
    required this.paymentMode,
    required this.unloadingCharges,
    required this.loadingCharges,
    required this.packingMaterialCharge,
    required this.packingStorgeCharge,
    required this.packingCarBikeTPT,
    required this.packingMiscellaneous,
    required this.otherCharges,
    required this.packingSTCharge,
    required this.packingGreenTax,
    required this.packingSurcharge,
    required this.packingGstShow,
    required this.packingGstNo,
    required this.packingGstType,
    required this.packingReverseCharge,
    required this.packingGstPaidBy,
    required this.packingPaymentRemark,
    required this.packingDiscountAmount,
    required this.totalAmount,
  });

  factory PaymentDetails.fromJson(Map<String, dynamic> json) {
    return PaymentDetails(
      freightCharges: json['freightCharges'].toString(),
      advancePaid: json['advancePaid'].toString(),
      packingCharge: json['packingCharge'].toString(),
      unPackingCharge: json['unPackingCharge'].toString(),
      paymentMode: json['paymentMode'] ?? '',
      unloadingCharges: json['unloadingCharges'].toString(),
      loadingCharges: json['loadingCharges'].toString(),
      packingMaterialCharge: json['packingMaterialCharge'].toString(),
      packingStorgeCharge: json['packingStorgeCharge'].toString(),
      packingCarBikeTPT: json['packingCarBikeTPT'] ?? '',
      packingMiscellaneous: json['packingMiscellaneous'] ?? '',
      otherCharges: json['otherCharges'].toString(),
      packingSTCharge: json['packingSTCharge'].toString(),
      packingGreenTax: json['packingGreenTax'].toString(),
      packingSurcharge: json['packingSurcharge'].toString(),
      packingGstShow: json['packingGstShow'] ?? '',
      packingGstNo: json['packingGstNo'].toString(),
      packingGstType: json['packingGstType'] ?? '',
      packingReverseCharge: json['packingReverseCharge'].toString(),
      packingGstPaidBy: json['packingGstPaidBy'] ?? '',
      packingPaymentRemark: json['packingPaymentRemark'] ?? '',
      packingDiscountAmount: json['packingDiscountAmount'].toString(),
      totalAmount: json['totalAmount'].toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'freightCharges': freightCharges,
      'advancePaid': advancePaid,
      'packingCharge': packingCharge,
      'unPackingCharge': unPackingCharge,
      'paymentMode': paymentMode,
      'unloadingCharges': unloadingCharges,
      'loadingCharges': loadingCharges,
      'packingMaterialCharge': packingMaterialCharge,
      'packingStorgeCharge': packingStorgeCharge,
      'packingCarBikeTPT': packingCarBikeTPT,
      'packingMiscellaneous': packingMiscellaneous,
      'otherCharges': otherCharges,
      'packingSTCharge': packingSTCharge,
      'packingGreenTax': packingGreenTax,
      'packingSurcharge': packingSurcharge,
      'packingGstShow': packingGstShow,
      'packingGstNo': packingGstNo,
      'packingGstType': packingGstType,
      'packingReverseCharge': packingReverseCharge,
      'packingGstPaidBy': packingGstPaidBy,
      'packingPaymentRemark': packingPaymentRemark,
      'packingDiscountAmount': packingDiscountAmount,
      'totalAmount': totalAmount,
    };
  }
}

class InsuranceDetails {
  final String insuranceType;
  final String insuranceCharges;
  final String declarationValueOfGoods;

  InsuranceDetails({
    required this.insuranceType,
    required this.insuranceCharges,
    required this.declarationValueOfGoods,
  });

  factory InsuranceDetails.fromJson(Map<String, dynamic> json) {
    return InsuranceDetails(
      insuranceType: json['insuranceType'] ?? '',
      insuranceCharges: json['insuranceCharges'].toString(),
      declarationValueOfGoods: json['declarationValueOfGoods'].toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'insuranceType': insuranceType,
      'insuranceCharges': insuranceCharges,
      'declarationValueOfGoods': declarationValueOfGoods,
    };
  }
}

class VehicleInsuranceDetails {
  final String vehicleNumber;
  final String insuranceType;
  final String insuranceCharges;

  VehicleInsuranceDetails({
    required this.vehicleNumber,
    required this.insuranceType,
    required this.insuranceCharges,
  });

  factory VehicleInsuranceDetails.fromJson(Map<String, dynamic> json) {
    return VehicleInsuranceDetails(
      vehicleNumber: json['vehicleNumber'] ?? '',
      insuranceType: json['insuranceType'] ?? '',
      insuranceCharges: json['insuranceCharges'].toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'vehicleNumber': vehicleNumber,
      'insuranceType': insuranceType,
      'insuranceCharges': insuranceCharges,
    };
  }
}


/*
class BillGetDataByIdModel {
  bool? status;
  Data? data;

  BillGetDataByIdModel({this.status, this.data});

  BillGetDataByIdModel.fromJson(Map<String, dynamic> json) {
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
  String? invoiceDate;

  InvoiceDetails({this.invoiceNumber, this.invoiceDate});

  InvoiceDetails.fromJson(Map<String, dynamic> json) {
    invoiceNumber = json['invoiceNumber'];
    invoiceDate = json['invoiceDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['invoiceNumber'] = this.invoiceNumber;
    data['invoiceDate'] = this.invoiceDate;
    return data;
  }
}

class BillingDetails {
  String? customerName;
  String? customerPhone;
  String? address;
  String? city;
  String? state;
  String? pincode;
  String? gstNo;

  BillingDetails(
      {this.customerName,
        this.customerPhone,
        this.address,
        this.city,
        this.state,
        this.pincode,
        this.gstNo});

  BillingDetails.fromJson(Map<String, dynamic> json) {
    customerName = json['customerName'];
    customerPhone = json['customerPhone'];
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
  String? address;
  String? city;
  String? state;
  String? pincode;
  String? gstNo;

  ConsignorDetails(
      {this.consignorName,
        this.consignorPhone,
        this.address,
        this.city,
        this.state,
        this.pincode,
        this.gstNo});

  ConsignorDetails.fromJson(Map<String, dynamic> json) {
    consignorName = json['consignorName'];
    consignorPhone = json['consignorPhone'];
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
  String? address;
  String? city;
  String? state;
  String? pincode;
  String? gstNo;

  ConsigneeDetails(
      {this.consigneeName,
        this.consigneePhone,
        this.address,
        this.city,
        this.state,
        this.pincode,
        this.gstNo});

  ConsigneeDetails.fromJson(Map<String, dynamic> json) {
    consigneeName = json['consigneeName'];
    consigneePhone = json['consigneePhone'];
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
  String? totalWeight;
  String? description;

  PackageDetails({this.packageType, this.totalWeight, this.description});

  PackageDetails.fromJson(Map<String, dynamic> json) {
    packageType = json['packageType'];
    totalWeight = json['totalWeight'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['packageType'] = this.packageType;
    data['totalWeight'] = this.totalWeight;
    data['description'] = this.description;
    return data;
  }
}

class PaymentDetails {
  String? freightCharges;
  String? advancePaid;
  String? paymentMode;
  String? unloadingCharges;
  String? loadingCharges;
  String? otherCharges;
  String? totalAmount;

  PaymentDetails(
      {this.freightCharges,
        this.advancePaid,
        this.paymentMode,
        this.unloadingCharges,
        this.loadingCharges,
        this.otherCharges,
        this.totalAmount});

  PaymentDetails.fromJson(Map<String, dynamic> json) {
    freightCharges = json['freightCharges'];
    advancePaid = json['advancePaid'];
    paymentMode = json['paymentMode'];
    unloadingCharges = json['unloadingCharges'];
    loadingCharges = json['loadingCharges'];
    otherCharges = json['otherCharges'];
    totalAmount = json['totalAmount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['freightCharges'] = this.freightCharges;
    data['advancePaid'] = this.advancePaid;
    data['paymentMode'] = this.paymentMode;
    data['unloadingCharges'] = this.unloadingCharges;
    data['loadingCharges'] = this.loadingCharges;
    data['otherCharges'] = this.otherCharges;
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
*/
