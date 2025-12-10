class ReadNotificationModel {
  bool? success;
  Data? data;

  ReadNotificationModel({this.success, this.data});

  ReadNotificationModel.fromJson(Map<String, dynamic> json) {
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
  String? pdfId;
  String? pdfType;
  String? title;
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
        this.title,
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
    title = json['title'];
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
    data['title'] = this.title;
    data['message'] = this.message;
    data['isRead'] = this.isRead;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
