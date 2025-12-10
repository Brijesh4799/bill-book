/*
class VerifyOtpModel {
  bool? status;
  String? message;
  String? token;
  Data? data;

  VerifyOtpModel({this.status, this.message, this.token, this.data});

  VerifyOtpModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    token = json['token'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['token'] = this.token;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  User? user;
  bool? newUser;

  Data({this.user, this.newUser});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    newUser = json['newUser'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['newUser'] = this.newUser;
    return data;
  }
}

class User {
  DeviceInfo? deviceInfo;
  String? sId;
  String? name;
  String? email;
  String? mobileNo;
  String? company;
  String? profileImage;
  String? address;
  String? city;
  String? state;
  String? pincode;
  String? lastLogin;
  bool? isVerified;
  bool? isNewUser;
  String? referralCode;
  bool? subscribed;
  String? subscriptionPlanId;
  String? planExpiry;
  String? status;
  String? createdAt;
  int? iV;

  User(
      {this.deviceInfo,
        this.sId,
        this.name,
        this.email,
        this.mobileNo,
        this.company,
        this.profileImage,
        this.address,
        this.city,
        this.state,
        this.pincode,
        this.lastLogin,
        this.isVerified,
        this.isNewUser,
        this.referralCode,
        this.subscribed,
        this.subscriptionPlanId,
        this.planExpiry,
        this.status,
        this.createdAt,
        this.iV});

  User.fromJson(Map<String, dynamic> json) {
    deviceInfo = json['deviceInfo'] != null
        ? new DeviceInfo.fromJson(json['deviceInfo'])
        : null;
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    mobileNo = json['mobileNo'];
    company = json['company'];
    profileImage = json['profileImage'];
    address = json['address'];
    city = json['city'];
    state = json['state'];
    pincode = json['pincode'];
    lastLogin = json['lastLogin'];
    isVerified = json['isVerified'];
    isNewUser = json['isNewUser'];
    referralCode = json['referralCode'];
    subscribed = json['subscribed'];
    subscriptionPlanId = json['subscription_plan_id'];
    planExpiry = json['plan_expiry'];
    status = json['status'];
    createdAt = json['createdAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.deviceInfo != null) {
      data['deviceInfo'] = this.deviceInfo!.toJson();
    }
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['mobileNo'] = this.mobileNo;
    data['company'] = this.company;
    data['profileImage'] = this.profileImage;
    data['address'] = this.address;
    data['city'] = this.city;
    data['state'] = this.state;
    data['pincode'] = this.pincode;
    data['lastLogin'] = this.lastLogin;
    data['isVerified'] = this.isVerified;
    data['isNewUser'] = this.isNewUser;
    data['referralCode'] = this.referralCode;
    data['subscribed'] = this.subscribed;
    data['subscription_plan_id'] = this.subscriptionPlanId;
    data['plan_expiry'] = this.planExpiry;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['__v'] = this.iV;
    return data;
  }
}

class DeviceInfo {
  String? deviceId;
  String? deviceModel;
  String? osVersion;

  DeviceInfo({this.deviceId, this.deviceModel, this.osVersion});

  DeviceInfo.fromJson(Map<String, dynamic> json) {
    deviceId = json['deviceId'];
    deviceModel = json['deviceModel'];
    osVersion = json['osVersion'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['deviceId'] = this.deviceId;
    data['deviceModel'] = this.deviceModel;
    data['osVersion'] = this.osVersion;
    return data;
  }
}*/


class VerifyOtpModel {
  bool? status;
  String? message;
  String? token;
  Data? data;

  VerifyOtpModel({this.status, this.message, this.token, this.data});

  VerifyOtpModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    token = json['token'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['token'] = this.token;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  User? user;
  bool? newUser;

  Data({this.user, this.newUser});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    newUser = json['newUser'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['newUser'] = this.newUser;
    return data;
  }
}

class User {
  DeviceInfo? deviceInfo;
  String? sId;
  String? name;
  String? email;
  String? mobileNo;
  String? company;
  String? address;
  String? city;
  String? state;
  String? pincode;
  String? lastLogin;
  bool? isVerified;
  bool? isNewUser;
  bool? subscribed;
  String? subscriptionPlanId;
  String? planExpiry;
  String? status;
  String? createdAt;
  int? iV;
  String? referralCode;
  String? profileImage;
  String? deviceToken;

  User(
      {this.deviceInfo,
        this.sId,
        this.name,
        this.email,
        this.mobileNo,
        this.company,
        this.address,
        this.city,
        this.state,
        this.pincode,
        this.lastLogin,
        this.isVerified,
        this.isNewUser,
        this.subscribed,
        this.subscriptionPlanId,
        this.planExpiry,
        this.status,
        this.createdAt,
        this.iV,
        this.referralCode,
        this.profileImage,
        this.deviceToken});

  User.fromJson(Map<String, dynamic> json) {
    deviceInfo = json['deviceInfo'] != null
        ? new DeviceInfo.fromJson(json['deviceInfo'])
        : null;
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    mobileNo = json['mobileNo'];
    company = json['company'];
    address = json['address'];
    city = json['city'];
    state = json['state'];
    pincode = json['pincode'];
    lastLogin = json['lastLogin'];
    isVerified = json['isVerified'];
    isNewUser = json['isNewUser'];
    subscribed = json['subscribed'];
    subscriptionPlanId = json['subscription_plan_id'];
    planExpiry = json['plan_expiry'];
    status = json['status'];
    createdAt = json['createdAt'];
    iV = json['__v'];
    referralCode = json['referralCode'];
    profileImage = json['profileImage'];
    deviceToken = json['deviceToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.deviceInfo != null) {
      data['deviceInfo'] = this.deviceInfo!.toJson();
    }
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['mobileNo'] = this.mobileNo;
    data['company'] = this.company;
    data['address'] = this.address;
    data['city'] = this.city;
    data['state'] = this.state;
    data['pincode'] = this.pincode;
    data['lastLogin'] = this.lastLogin;
    data['isVerified'] = this.isVerified;
    data['isNewUser'] = this.isNewUser;
    data['subscribed'] = this.subscribed;
    data['subscription_plan_id'] = this.subscriptionPlanId;
    data['plan_expiry'] = this.planExpiry;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['__v'] = this.iV;
    data['referralCode'] = this.referralCode;
    data['profileImage'] = this.profileImage;
    data['deviceToken'] = this.deviceToken;
    return data;
  }
}

class DeviceInfo {
  String? deviceId;
  String? deviceModel;
  String? osVersion;

  DeviceInfo({this.deviceId, this.deviceModel, this.osVersion});

  DeviceInfo.fromJson(Map<String, dynamic> json) {
    deviceId = json['deviceId'];
    deviceModel = json['deviceModel'];
    osVersion = json['osVersion'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['deviceId'] = this.deviceId;
    data['deviceModel'] = this.deviceModel;
    data['osVersion'] = this.osVersion;
    return data;
  }
}
