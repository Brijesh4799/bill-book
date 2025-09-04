class UpdateProfileModel {
  bool? _success;
  String? _message;
  User? _user;

  UpdateProfileModel({bool? success, String? message, User? user}) {
    if (success != null) {
      this._success = success;
    }
    if (message != null) {
      this._message = message;
    }
    if (user != null) {
      this._user = user;
    }
  }

  bool? get success => _success;
  set success(bool? success) => _success = success;
  String? get message => _message;
  set message(String? message) => _message = message;
  User? get user => _user;
  set user(User? user) => _user = user;

  UpdateProfileModel.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _message = json['message'];
    _user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this._success;
    data['message'] = this._message;
    if (this._user != null) {
      data['user'] = this._user!.toJson();
    }
    return data;
  }
}

class User {
  Otp? _otp;
  DeviceInfo? _deviceInfo;
  String? _sId;
  String? _name;
  String? _email;
  String? _mobileNo;
  String? _company;
  String? _address;
  String? _city;
  String? _state;
  String? _pincode;
  String? _lastLogin;
  bool? _isVerified;
  bool? _isNewUser;
  bool? _subscribed;
  String? _subscriptionPlanId;
  String? _planExpiry;
  String? _status;
  String? _createdAt;
  int? _iV;
  String? _referralCode;
  String? _profileImage;

  User(
      {Otp? otp,
        DeviceInfo? deviceInfo,
        String? sId,
        String? name,
        String? email,
        String? mobileNo,
        String? company,
        String? address,
        String? city,
        String? state,
        String? pincode,
        String? lastLogin,
        bool? isVerified,
        bool? isNewUser,
        bool? subscribed,
        String? subscriptionPlanId,
        String? planExpiry,
        String? status,
        String? createdAt,
        int? iV,
        String? referralCode,
        String? profileImage}) {
    if (otp != null) {
      this._otp = otp;
    }
    if (deviceInfo != null) {
      this._deviceInfo = deviceInfo;
    }
    if (sId != null) {
      this._sId = sId;
    }
    if (name != null) {
      this._name = name;
    }
    if (email != null) {
      this._email = email;
    }
    if (mobileNo != null) {
      this._mobileNo = mobileNo;
    }
    if (company != null) {
      this._company = company;
    }
    if (address != null) {
      this._address = address;
    }
    if (city != null) {
      this._city = city;
    }
    if (state != null) {
      this._state = state;
    }
    if (pincode != null) {
      this._pincode = pincode;
    }
    if (lastLogin != null) {
      this._lastLogin = lastLogin;
    }
    if (isVerified != null) {
      this._isVerified = isVerified;
    }
    if (isNewUser != null) {
      this._isNewUser = isNewUser;
    }
    if (subscribed != null) {
      this._subscribed = subscribed;
    }
    if (subscriptionPlanId != null) {
      this._subscriptionPlanId = subscriptionPlanId;
    }
    if (planExpiry != null) {
      this._planExpiry = planExpiry;
    }
    if (status != null) {
      this._status = status;
    }
    if (createdAt != null) {
      this._createdAt = createdAt;
    }
    if (iV != null) {
      this._iV = iV;
    }
    if (referralCode != null) {
      this._referralCode = referralCode;
    }
    if (profileImage != null) {
      this._profileImage = profileImage;
    }
  }

  Otp? get otp => _otp;
  set otp(Otp? otp) => _otp = otp;
  DeviceInfo? get deviceInfo => _deviceInfo;
  set deviceInfo(DeviceInfo? deviceInfo) => _deviceInfo = deviceInfo;
  String? get sId => _sId;
  set sId(String? sId) => _sId = sId;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get email => _email;
  set email(String? email) => _email = email;
  String? get mobileNo => _mobileNo;
  set mobileNo(String? mobileNo) => _mobileNo = mobileNo;
  String? get company => _company;
  set company(String? company) => _company = company;
  String? get address => _address;
  set address(String? address) => _address = address;
  String? get city => _city;
  set city(String? city) => _city = city;
  String? get state => _state;
  set state(String? state) => _state = state;
  String? get pincode => _pincode;
  set pincode(String? pincode) => _pincode = pincode;
  String? get lastLogin => _lastLogin;
  set lastLogin(String? lastLogin) => _lastLogin = lastLogin;
  bool? get isVerified => _isVerified;
  set isVerified(bool? isVerified) => _isVerified = isVerified;
  bool? get isNewUser => _isNewUser;
  set isNewUser(bool? isNewUser) => _isNewUser = isNewUser;
  bool? get subscribed => _subscribed;
  set subscribed(bool? subscribed) => _subscribed = subscribed;
  String? get subscriptionPlanId => _subscriptionPlanId;
  set subscriptionPlanId(String? subscriptionPlanId) =>
      _subscriptionPlanId = subscriptionPlanId;
  String? get planExpiry => _planExpiry;
  set planExpiry(String? planExpiry) => _planExpiry = planExpiry;
  String? get status => _status;
  set status(String? status) => _status = status;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  int? get iV => _iV;
  set iV(int? iV) => _iV = iV;
  String? get referralCode => _referralCode;
  set referralCode(String? referralCode) => _referralCode = referralCode;
  String? get profileImage => _profileImage;
  set profileImage(String? profileImage) => _profileImage = profileImage;

  User.fromJson(Map<String, dynamic> json) {
    _otp = json['otp'] != null ? new Otp.fromJson(json['otp']) : null;
    _deviceInfo = json['deviceInfo'] != null
        ? new DeviceInfo.fromJson(json['deviceInfo'])
        : null;
    _sId = json['_id'];
    _name = json['name'];
    _email = json['email'];
    _mobileNo = json['mobileNo'];
    _company = json['company'];
    _address = json['address'];
    _city = json['city'];
    _state = json['state'];
    _pincode = json['pincode'];
    _lastLogin = json['lastLogin'];
    _isVerified = json['isVerified'];
    _isNewUser = json['isNewUser'];
    _subscribed = json['subscribed'];
    _subscriptionPlanId = json['subscription_plan_id'];
    _planExpiry = json['plan_expiry'];
    _status = json['status'];
    _createdAt = json['createdAt'];
    _iV = json['__v'];
    _referralCode = json['referralCode'];
    _profileImage = json['profileImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._otp != null) {
      data['otp'] = this._otp!.toJson();
    }
    if (this._deviceInfo != null) {
      data['deviceInfo'] = this._deviceInfo!.toJson();
    }
    data['_id'] = this._sId;
    data['name'] = this._name;
    data['email'] = this._email;
    data['mobileNo'] = this._mobileNo;
    data['company'] = this._company;
    data['address'] = this._address;
    data['city'] = this._city;
    data['state'] = this._state;
    data['pincode'] = this._pincode;
    data['lastLogin'] = this._lastLogin;
    data['isVerified'] = this._isVerified;
    data['isNewUser'] = this._isNewUser;
    data['subscribed'] = this._subscribed;
    data['subscription_plan_id'] = this._subscriptionPlanId;
    data['plan_expiry'] = this._planExpiry;
    data['status'] = this._status;
    data['createdAt'] = this._createdAt;
    data['__v'] = this._iV;
    data['referralCode'] = this._referralCode;
    data['profileImage'] = this._profileImage;
    return data;
  }
}

class Otp {
  String? _code;
  String? _expiresAt;

  Otp({String? code, String? expiresAt}) {
    if (code != null) {
      this._code = code;
    }
    if (expiresAt != null) {
      this._expiresAt = expiresAt;
    }
  }

  String? get code => _code;
  set code(String? code) => _code = code;
  String? get expiresAt => _expiresAt;
  set expiresAt(String? expiresAt) => _expiresAt = expiresAt;

  Otp.fromJson(Map<String, dynamic> json) {
    _code = json['code'];
    _expiresAt = json['expiresAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this._code;
    data['expiresAt'] = this._expiresAt;
    return data;
  }
}

class DeviceInfo {
  String? _deviceId;
  String? _deviceModel;
  String? _osVersion;

  DeviceInfo({String? deviceId, String? deviceModel, String? osVersion}) {
    if (deviceId != null) {
      this._deviceId = deviceId;
    }
    if (deviceModel != null) {
      this._deviceModel = deviceModel;
    }
    if (osVersion != null) {
      this._osVersion = osVersion;
    }
  }

  String? get deviceId => _deviceId;
  set deviceId(String? deviceId) => _deviceId = deviceId;
  String? get deviceModel => _deviceModel;
  set deviceModel(String? deviceModel) => _deviceModel = deviceModel;
  String? get osVersion => _osVersion;
  set osVersion(String? osVersion) => _osVersion = osVersion;

  DeviceInfo.fromJson(Map<String, dynamic> json) {
    _deviceId = json['deviceId'];
    _deviceModel = json['deviceModel'];
    _osVersion = json['osVersion'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['deviceId'] = this._deviceId;
    data['deviceModel'] = this._deviceModel;
    data['osVersion'] = this._osVersion;
    return data;
  }
}