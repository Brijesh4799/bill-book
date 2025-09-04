class FocScfPdfModel {
  bool? status;
  String? message;
  List<Data>? data;
  Pagination? pagination;

  FocScfPdfModel({this.status, this.message, this.data, this.pagination});

  FocScfPdfModel.fromJson(Map<String, dynamic> json) {
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
  FovScf? fovScf;
  InsuranceDetails? insuranceDetails;

  FormData({this.fovScf, this.insuranceDetails});

  FormData.fromJson(Map<String, dynamic> json) {
    fovScf =
    json['fovScf'] != null ? new FovScf.fromJson(json['fovScf']) : null;
    insuranceDetails = json['insuranceDetails'] != null
        ? new InsuranceDetails.fromJson(json['insuranceDetails'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.fovScf != null) {
      data['fovScf'] = this.fovScf!.toJson();
    }
    if (this.insuranceDetails != null) {
      data['insuranceDetails'] = this.insuranceDetails!.toJson();
    }
    return data;
  }
}

class FovScf {
  String? fovScfType;
  String? date;
  String? lrNumber;
  String? name;
  String? phone;
  String? email;
  String? moveFromCity;
  String? moveToCity;

  FovScf(
      {this.fovScfType,
        this.date,
        this.lrNumber,
        this.name,
        this.phone,
        this.email,
        this.moveFromCity,
        this.moveToCity});

  FovScf.fromJson(Map<String, dynamic> json) {
    fovScfType = json['fovScfType'];
    date = json['date'];
    lrNumber = json['lrNumber'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    moveFromCity = json['moveFromCity'];
    moveToCity = json['moveToCity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fovScfType'] = this.fovScfType;
    data['date'] = this.date;
    data['lrNumber'] = this.lrNumber;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['moveFromCity'] = this.moveFromCity;
    data['moveToCity'] = this.moveToCity;
    return data;
  }
}

class InsuranceDetails {
  String? insuranceRiskType;
  String? insuranceChargePercent;

  InsuranceDetails({this.insuranceRiskType, this.insuranceChargePercent});

  InsuranceDetails.fromJson(Map<String, dynamic> json) {
    insuranceRiskType = json['insuranceRiskType'];
    insuranceChargePercent = json['insuranceChargePercent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['insuranceRiskType'] = this.insuranceRiskType;
    data['insuranceChargePercent'] = this.insuranceChargePercent;
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
