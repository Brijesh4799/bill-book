class PaymentVoucherModel {
  bool? status;
  String? message;
  Data? data;

  PaymentVoucherModel({this.status, this.message, this.data});

  PaymentVoucherModel.fromJson(Map<String, dynamic> json) {
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
  String? voucherNumber;
  String? voucherDate;
  String? receiverName;
  String? receiverPhone;
  String? paymentType;
  int? voucherAmount;
  String? paymentMode;
  String? number;
  String? payFor;
  String? remark;

  FormData(
      {this.voucherNumber,
        this.voucherDate,
        this.receiverName,
        this.receiverPhone,
        this.paymentType,
        this.voucherAmount,
        this.paymentMode,
        this.number,
        this.payFor,
        this.remark});

  FormData.fromJson(Map<String, dynamic> json) {
    voucherNumber = json['voucherNumber'];
    voucherDate = json['voucherDate'];
    receiverName = json['receiverName'];
    receiverPhone = json['receiverPhone'];
    paymentType = json['paymentType'];
    voucherAmount = json['voucherAmount'];
    paymentMode = json['paymentMode'];
    number = json['number'];
    payFor = json['payFor'];
    remark = json['remark'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['voucherNumber'] = this.voucherNumber;
    data['voucherDate'] = this.voucherDate;
    data['receiverName'] = this.receiverName;
    data['receiverPhone'] = this.receiverPhone;
    data['paymentType'] = this.paymentType;
    data['voucherAmount'] = this.voucherAmount;
    data['paymentMode'] = this.paymentMode;
    data['number'] = this.number;
    data['payFor'] = this.payFor;
    data['remark'] = this.remark;
    return data;
  }
}
