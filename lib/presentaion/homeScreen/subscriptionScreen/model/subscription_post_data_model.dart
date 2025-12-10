class SubscriptionPostModel {
  bool? success;
  String? message;
  Data? data;

  SubscriptionPostModel({this.success, this.message, this.data});

  SubscriptionPostModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? orderId;
  String? subscriptionId;
  int? amount;
  String? currency;
  String? receipt;
  String? status;

  Data(
      {this.orderId,
        this.subscriptionId,
        this.amount,
        this.currency,
        this.receipt,
        this.status});

  Data.fromJson(Map<String, dynamic> json) {
    orderId = json['orderId'];
    subscriptionId = json['subscriptionId'];
    amount = json['amount'];
    currency = json['currency'];
    receipt = json['receipt'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orderId'] = this.orderId;
    data['subscriptionId'] = this.subscriptionId;
    data['amount'] = this.amount;
    data['currency'] = this.currency;
    data['receipt'] = this.receipt;
    data['status'] = this.status;
    return data;
  }
}
