class MoneyGetDataModel {
  final bool? status;
  final MoneyData? data;

  MoneyGetDataModel({this.status, this.data});

  factory MoneyGetDataModel.fromJson(Map<String, dynamic> json) {
    return MoneyGetDataModel(
      status: json['status'],
      data: json['data'] != null ? MoneyData.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'data': data?.toJson(),
    };
  }
}

class MoneyData {
  final String? id;
  final String? userId;
  final FormData? formData;
  final String? status;
  final String? createdAt;
  final String? updatedAt;
  final int? v;

  MoneyData({
    this.id,
    this.userId,
    this.formData,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory MoneyData.fromJson(Map<String, dynamic> json) {
    return MoneyData(
      id: json['_id'],
      userId: json['userId'],
      formData:
      json['formData'] != null ? FormData.fromJson(json['formData']) : null,
      status: json['status'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      v: json['__v'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'userId': userId,
      'formData': formData?.toJson(),
      'status': status,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      '__v': v,
    };
  }
}

class FormData {
  final String? receiptNumber;
  final String? receiptDate;
  final String? name;
  final String? phone;
  final String? receiptAgainst;
  final String? billNumber;
  final String? billDate;
  final String? moveFrom;
  final String? moveTo;
  final String? paymentType;
  final String? receiptAmount;
  final String? paymentMode;
  final String? transactionNumber;
  final String? branch;
  final String? remark;

  FormData({
    this.receiptNumber,
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
    this.remark,
  });

  factory FormData.fromJson(Map<String, dynamic> json) {
    return FormData(
      receiptNumber: json['receiptNumber']?.toString(),
      receiptDate: json['receiptDate'],
      name: json['name'],
      phone: json['phone']?.toString(),
      receiptAgainst: json['receiptAgainst'],
      billNumber: json['billNumber'],
      billDate: json['billDate'],
      moveFrom: json['moveFrom'],
      moveTo: json['moveTo'],
      paymentType: json['paymentType'],
      receiptAmount: json['receiptAmount']?.toString(),
      paymentMode: json['paymentMode'],
      transactionNumber: json['transactionNumber'],
      branch: json['branch'],
      remark: json['remark'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'receiptNumber': receiptNumber,
      'receiptDate': receiptDate,
      'name': name,
      'phone': phone,
      'receiptAgainst': receiptAgainst,
      'billNumber': billNumber,
      'billDate': billDate,
      'moveFrom': moveFrom,
      'moveTo': moveTo,
      'paymentType': paymentType,
      'receiptAmount': receiptAmount,
      'paymentMode': paymentMode,
      'transactionNumber': transactionNumber,
      'branch': branch,
      'remark': remark,
    };
  }
}

/*
class MoneyGetDataModel {
  bool? status;
  Data? data;

  MoneyGetDataModel({this.status, this.data});

  MoneyGetDataModel.fromJson(Map<String, dynamic> json) {
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
*/
