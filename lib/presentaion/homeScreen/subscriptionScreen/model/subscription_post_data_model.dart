class SubscriptionPostModel {
  bool? status;
  String? message;
  Data? data;

  SubscriptionPostModel({this.status, this.message, this.data});

  SubscriptionPostModel.fromJson(Map<String, dynamic> json) {
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
  String? planId;
  String? startDate;
  String? endDate;
  bool? isActive;
  String? paymentId;
  int? amount;
  String? paymentStatus;
  String? sId;
  int? iV;

  Data(
      {this.userId,
        this.planId,
        this.startDate,
        this.endDate,
        this.isActive,
        this.paymentId,
        this.amount,
        this.paymentStatus,
        this.sId,
        this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    planId = json['planId'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    isActive = json['isActive'];
    paymentId = json['paymentId'];
    amount = json['amount'];
    paymentStatus = json['paymentStatus'];
    sId = json['_id'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['planId'] = this.planId;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['isActive'] = this.isActive;
    data['paymentId'] = this.paymentId;
    data['amount'] = this.amount;
    data['paymentStatus'] = this.paymentStatus;
    data['_id'] = this.sId;
    data['__v'] = this.iV;
    return data;
  }
}
