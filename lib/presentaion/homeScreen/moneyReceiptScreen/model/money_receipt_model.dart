class MoneyReceiptModel {
  bool? status;
  String? message;
  Data? data;

  MoneyReceiptModel({this.status, this.message, this.data});

  MoneyReceiptModel.fromJson(Map<String, dynamic> json) {
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
  String? receiptNumber;
  String? receiptDate;
  String? name;
  String? phone;
  String? receiptAgainst;
  String? billNumber;
  String? billDate;
  String? moveFrom;
  String? moveTo;
  String? paymentType;
  String? receiptAmount;
  String? paymentMode;
  String? transactionNumber;
  String? branch;
  String? remark;

  FormData(
      {this.receiptNumber,
        this.receiptDate,
        this.name,
        this.phone,
        this.receiptAgainst,
        this.billNumber,
        this.billDate,
        this.moveFrom,
        this.moveTo,
        this.paymentType,
        this.receiptAmount,
        this.paymentMode,
        this.transactionNumber,
        this.branch,
        this.remark});

  FormData.fromJson(Map<String, dynamic> json) {
    receiptNumber = json['receiptNumber'];
    receiptDate = json['receiptDate'];
    name = json['name'];
    phone = json['phone'];
    receiptAgainst = json['receiptAgainst'];
    billNumber = json['billNumber'];
    billDate = json['billDate'];
    moveFrom = json['moveFrom'];
    moveTo = json['moveTo'];
    paymentType = json['paymentType'];
    receiptAmount = json['receiptAmount'];
    paymentMode = json['paymentMode'];
    transactionNumber = json['transactionNumber'];
    branch = json['branch'];
    remark = json['remark'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['receiptNumber'] = this.receiptNumber;
    data['receiptDate'] = this.receiptDate;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['receiptAgainst'] = this.receiptAgainst;
    data['billNumber'] = this.billNumber;
    data['billDate'] = this.billDate;
    data['moveFrom'] = this.moveFrom;
    data['moveTo'] = this.moveTo;
    data['paymentType'] = this.paymentType;
    data['receiptAmount'] = this.receiptAmount;
    data['paymentMode'] = this.paymentMode;
    data['transactionNumber'] = this.transactionNumber;
    data['branch'] = this.branch;
    data['remark'] = this.remark;
    return data;
  }
}
