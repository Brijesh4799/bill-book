class SubscriptionModel {
  bool? status;
  String? message;
  List<Data>? data;

  SubscriptionModel({this.status, this.message, this.data});

  SubscriptionModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? name;
  int? durationDays;
  int? price;
  int? adminAccount;
  int? staffAccount;
  bool? isActive;
  int? iV;

  Data(
      {this.sId,
        this.name,
        this.durationDays,
        this.price,
        this.adminAccount,
        this.staffAccount,
        this.isActive,
        this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    durationDays = json['duration_days'];
    price = json['price'];
    adminAccount = json['adminAccount'];
    staffAccount = json['staffAccount'];
    isActive = json['isActive'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['duration_days'] = this.durationDays;
    data['price'] = this.price;
    data['adminAccount'] = this.adminAccount;
    data['staffAccount'] = this.staffAccount;
    data['isActive'] = this.isActive;
    data['__v'] = this.iV;
    return data;
  }
}
