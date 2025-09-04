class TWSGetDataModel {
  bool? status;
  Data? data;

  TWSGetDataModel({this.status, this.data});

  TWSGetDataModel.fromJson(Map<String, dynamic> json) {
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
  String? movingType;
  String? date;
  String? lrNumber;
  String? name;
  String? phone;
  String? email;
  String? moveFromCity;
  String? moveFromAddress;
  String? moveToCity;
  String? moveToAddress;

  FormData(
      {this.movingType,
        this.date,
        this.lrNumber,
        this.name,
        this.phone,
        this.email,
        this.moveFromCity,
        this.moveFromAddress,
        this.moveToCity,
        this.moveToAddress});

  FormData.fromJson(Map<String, dynamic> json) {
    movingType = json['movingType'];
    date = json['date'];
    lrNumber = json['lrNumber'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    moveFromCity = json['moveFromCity'];
    moveFromAddress = json['moveFromAddress'];
    moveToCity = json['moveToCity'];
    moveToAddress = json['moveToAddress'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['movingType'] = this.movingType;
    data['date'] = this.date;
    data['lrNumber'] = this.lrNumber;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['moveFromCity'] = this.moveFromCity;
    data['moveFromAddress'] = this.moveFromAddress;
    data['moveToCity'] = this.moveToCity;
    data['moveToAddress'] = this.moveToAddress;
    return data;
  }
}
