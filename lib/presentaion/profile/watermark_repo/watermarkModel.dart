class WaterMarkRepo {
  bool? success;
  Data? data;

  WaterMarkRepo({this.success, this.data});

  WaterMarkRepo.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? userId;
  List<PdfPermissions>? pdfPermissions;
  String? lastUpdated;
  int? iV;

  Data({this.sId, this.userId, this.pdfPermissions, this.lastUpdated, this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userId = json['userId'];
    if (json['pdfPermissions'] != null) {
      pdfPermissions = <PdfPermissions>[];
      json['pdfPermissions'].forEach((v) {
        pdfPermissions!.add(new PdfPermissions.fromJson(v));
      });
    }
    lastUpdated = json['lastUpdated'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['userId'] = this.userId;
    if (this.pdfPermissions != null) {
      data['pdfPermissions'] =
          this.pdfPermissions!.map((v) => v.toJson()).toList();
    }
    data['lastUpdated'] = this.lastUpdated;
    data['__v'] = this.iV;
    return data;
  }
}

class PdfPermissions {
  String? pdfType;
  bool? enableWatermark;
  String? sId;

  PdfPermissions({this.pdfType, this.enableWatermark, this.sId});

  PdfPermissions.fromJson(Map<String, dynamic> json) {
    pdfType = json['pdfType'];
    enableWatermark = json['enableWatermark'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pdfType'] = this.pdfType;
    data['enableWatermark'] = this.enableWatermark;
    data['_id'] = this.sId;
    return data;
  }
}
