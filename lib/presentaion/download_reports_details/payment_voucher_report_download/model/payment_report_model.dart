class PaymentVoucherReportModel {
  bool? status;
  String? message;
  List<Data>? data;
  Pagination? pagination;

  PaymentVoucherReportModel(
      {this.status, this.message, this.data, this.pagination});

  PaymentVoucherReportModel.fromJson(Map<String, dynamic> json) {
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
