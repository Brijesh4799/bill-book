class PaymentGetDataModel {
  bool? status;
  Data? data;

  PaymentGetDataModel({this.status, this.data});

  PaymentGetDataModel.fromJson(Map<String, dynamic> json) {
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
  String? voucherNumber;
  String? voucherDate;
  String? receiverName;
  String? receiverPhone;
  int? voucherAmount;
  String? number;
  String? payFor;
  String? remark;
  String? paymentType;
  String? paymentMode;

  FormData(
      {this.voucherNumber,
        this.voucherDate,
        this.receiverName,
        this.receiverPhone,
        this.voucherAmount,
        this.number,
        this.payFor,
        this.remark,
        this.paymentType,
        this.paymentMode});

  FormData.fromJson(Map<String, dynamic> json) {
    voucherNumber = json['voucherNumber'];
    voucherDate = json['voucherDate'];
    receiverName = json['receiverName'];
    receiverPhone = json['receiverPhone'];
    voucherAmount = json['voucherAmount'];
    number = json['number'];
    payFor = json['payFor'];
    remark = json['remark'];
    paymentType = json['paymentType'];
    paymentMode = json['paymentMode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['voucherNumber'] = this.voucherNumber;
    data['voucherDate'] = this.voucherDate;
    data['receiverName'] = this.receiverName;
    data['receiverPhone'] = this.receiverPhone;
    data['voucherAmount'] = this.voucherAmount;
    data['number'] = this.number;
    data['payFor'] = this.payFor;
    data['remark'] = this.remark;
    data['paymentType'] = this.paymentType;
    data['paymentMode'] = this.paymentMode;
    return data;
  }
}
