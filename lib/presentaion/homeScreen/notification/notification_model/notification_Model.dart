class NotificationModel {
  bool? success;
  int? count;
  List<Data>? data;

  NotificationModel({this.success, this.count, this.data});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    count = json['count'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['count'] = this.count;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? userId;
  String? pdfId;
  String? pdfType;
  String? message;
  bool? isRead;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Data(
      {this.sId,
        this.userId,
        this.pdfId,
        this.pdfType,
        this.message,
        this.isRead,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userId = json['userId'];
    pdfId = json['pdfId'];
    pdfType = json['pdfType'];
    message = json['message'];
    isRead = json['isRead'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['userId'] = this.userId;
    data['pdfId'] = this.pdfId;
    data['pdfType'] = this.pdfType;
    data['message'] = this.message;
    data['isRead'] = this.isRead;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
