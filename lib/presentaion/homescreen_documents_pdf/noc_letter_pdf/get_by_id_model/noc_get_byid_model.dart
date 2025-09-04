class NocGetDataModel {
  bool? status;
  Data? data;

  NocGetDataModel({this.status, this.data});

  NocGetDataModel.fromJson(Map<String, dynamic> json) {
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
  NocLetterFor? nocLetterFor;
  NocForm? nocForm;

  FormData({this.nocLetterFor, this.nocForm});

  FormData.fromJson(Map<String, dynamic> json) {
    nocLetterFor = json['nocLetterFor'] != null
        ? new NocLetterFor.fromJson(json['nocLetterFor'])
        : null;
    nocForm =
    json['nocForm'] != null ? new NocForm.fromJson(json['nocForm']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.nocLetterFor != null) {
      data['nocLetterFor'] = this.nocLetterFor!.toJson();
    }
    if (this.nocForm != null) {
      data['nocForm'] = this.nocForm!.toJson();
    }
    return data;
  }
}

class NocLetterFor {
  String? nocType;

  NocLetterFor({this.nocType});

  NocLetterFor.fromJson(Map<String, dynamic> json) {
    nocType = json['nocType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nocType'] = this.nocType;
    return data;
  }
}

class NocForm {
  String? date;
  String? lrNumber;
  String? lrDate;
  String? name;
  String? phone;
  String? email;
  String? moveFromCity;
  String? moveToCity;

  NocForm(
      {this.date,
        this.lrNumber,
        this.lrDate,
        this.name,
        this.phone,
        this.email,
        this.moveFromCity,
        this.moveToCity});

  NocForm.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    lrNumber = json['lrNumber'];
    lrDate = json['lrDate'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    moveFromCity = json['moveFromCity'];
    moveToCity = json['moveToCity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['lrNumber'] = this.lrNumber;
    data['lrDate'] = this.lrDate;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['moveFromCity'] = this.moveFromCity;
    data['moveToCity'] = this.moveToCity;
    return data;
  }
}
