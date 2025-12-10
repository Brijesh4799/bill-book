/*
class UserUpdateInput {
  bool? success;
  String? message;
  User? user;

  UserUpdateInput({this.success, this.message, this.user});

  UserUpdateInput.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  Otp? otp;
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

  User(
      {this.otp,
        this.deviceInfo,
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
        this.profileImage});

  User.fromJson(Map<String, dynamic> json) {
    otp = json['otp'] != null ? new Otp.fromJson(json['otp']) : null;
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.otp != null) {
      data['otp'] = this.otp!.toJson();
    }
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
    return data;
  }
}

class Otp {
  String? code;
  String? expiresAt;

  Otp({this.code, this.expiresAt});

  Otp.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    expiresAt = json['expiresAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['expiresAt'] = this.expiresAt;
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
*/


class UserUpdateInput {
  bool? success;
  String? message;
  User? user;

  UserUpdateInput({this.success, this.message, this.user});

  UserUpdateInput.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['success'] = success;
    data['message'] = message;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  Otp? otp;
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

  User({
    this.otp,
    this.deviceInfo,
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
  });

  User.fromJson(Map<String, dynamic> json) {
    otp = json['otp'] != null ? Otp.fromJson(json['otp']) : null;
    deviceInfo = json['deviceInfo'] != null
        ? DeviceInfo.fromJson(json['deviceInfo'])
        : null;
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    mobileNo = json['mobileNo'];
    company = json['company'];
    address = json['address'];
    city = json['city'];
    state = json['state'];
    pincode = json['Pincode'] != null ? json['Pincode'].toString() : null; // ✅ Corrected
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (otp != null) {
      data['otp'] = otp!.toJson();
    }
    if (deviceInfo != null) {
      data['deviceInfo'] = deviceInfo!.toJson();
    }
    data['_id'] = sId;
    data['name'] = name;
    data['email'] = email;
    data['mobileNo'] = mobileNo;
    data['company'] = company;
    data['address'] = address;
    data['city'] = city;
    data['state'] = state;
    data['pincode'] = pincode;
    data['lastLogin'] = lastLogin;
    data['isVerified'] = isVerified;
    data['isNewUser'] = isNewUser;
    data['subscribed'] = subscribed;
    data['subscription_plan_id'] = subscriptionPlanId;
    data['plan_expiry'] = planExpiry;
    data['status'] = status;
    data['createdAt'] = createdAt;
    data['__v'] = iV;
    data['referralCode'] = referralCode;
    data['profileImage'] = profileImage;
    return data;
  }
}

class Otp {
  String? code;
  String? expiresAt;

  Otp({this.code, this.expiresAt});

  Otp.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    expiresAt = json['expiresAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['code'] = code;
    data['expiresAt'] = expiresAt;
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
    final Map<String, dynamic> data = {};
    data['deviceId'] = deviceId;
    data['deviceModel'] = deviceModel;
    data['osVersion'] = osVersion;
    return data;
  }
}
