class BusinessDetailsModel {
  bool? status;
  String? message;
  Data? data;

  BusinessDetailsModel({this.status, this.message, this.data});

  BusinessDetailsModel.fromJson(Map<String, dynamic> json) {
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
  BankDetails? bankDetails;
  UpiDetails? upiDetails;
  OtherDetails? otherDetails;
  String? sId;
  String? userId;
  String? logo;
  String? sign;
  int? iV;
  String? address;
  String? city;
  String? contactNumber1;
  String? email;
  String? gstNo;
  String? pan;
  String? state;
  String? tagline;
  String? website;
  String? contactNumber2;
  String? contactNumber3;
  String? contactNumber4;
  String? jurisdiction;
  String? landlineNumber;
  String? name;
  String? tollFreeNumber;
  String? whatsappNumber;

  Data(
      {this.bankDetails,
        this.upiDetails,
        this.otherDetails,
        this.sId,
        this.userId,
        this.logo,
        this.sign,
        this.iV,
        this.address,
        this.city,
        this.contactNumber1,
        this.email,
        this.gstNo,
        this.pan,
        this.state,
        this.tagline,
        this.website,
        this.contactNumber2,
        this.contactNumber3,
        this.contactNumber4,
        this.jurisdiction,
        this.landlineNumber,
        this.name,
        this.tollFreeNumber,
        this.whatsappNumber});

  Data.fromJson(Map<String, dynamic> json) {
    bankDetails = json['bankDetails'] != null
        ? new BankDetails.fromJson(json['bankDetails'])
        : null;
    upiDetails = json['upiDetails'] != null
        ? new UpiDetails.fromJson(json['upiDetails'])
        : null;
    otherDetails = json['otherDetails'] != null
        ? new OtherDetails.fromJson(json['otherDetails'])
        : null;
    sId = json['_id'];
    userId = json['userId'];
    logo = json['logo'];
    sign = json['sign'];
    iV = json['__v'];
    address = json['address'];
    city = json['city'];
    contactNumber1 = json['contactNumber1'];
    email = json['email'];
    gstNo = json['gstNo'];
    pan = json['pan'];
    state = json['state'];
    tagline = json['tagline'];
    website = json['website'];
    contactNumber2 = json['contactNumber2'];
    contactNumber3 = json['contactNumber3'];
    contactNumber4 = json['contactNumber4'];
    jurisdiction = json['jurisdiction'];
    landlineNumber = json['landlineNumber'];
    name = json['name'];
    tollFreeNumber = json['tollFreeNumber'];
    whatsappNumber = json['whatsappNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.bankDetails != null) {
      data['bankDetails'] = this.bankDetails!.toJson();
    }
    if (this.upiDetails != null) {
      data['upiDetails'] = this.upiDetails!.toJson();
    }
    if (this.otherDetails != null) {
      data['otherDetails'] = this.otherDetails!.toJson();
    }
    data['_id'] = this.sId;
    data['userId'] = this.userId;
    data['logo'] = this.logo;
    data['sign'] = this.sign;
    data['__v'] = this.iV;
    data['address'] = this.address;
    data['city'] = this.city;
    data['contactNumber1'] = this.contactNumber1;
    data['email'] = this.email;
    data['gstNo'] = this.gstNo;
    data['pan'] = this.pan;
    data['state'] = this.state;
    data['tagline'] = this.tagline;
    data['website'] = this.website;
    data['contactNumber2'] = this.contactNumber2;
    data['contactNumber3'] = this.contactNumber3;
    data['contactNumber4'] = this.contactNumber4;
    data['jurisdiction'] = this.jurisdiction;
    data['landlineNumber'] = this.landlineNumber;
    data['name'] = this.name;
    data['tollFreeNumber'] = this.tollFreeNumber;
    data['whatsappNumber'] = this.whatsappNumber;
    return data;
  }
}

class BankDetails {
  String? accountHolderName;
  String? bankName;
  String? accountNo;
  String? ifscCode;
  String? branch;

  BankDetails(
      {this.accountHolderName,
        this.bankName,
        this.accountNo,
        this.ifscCode,
        this.branch});

  BankDetails.fromJson(Map<String, dynamic> json) {
    accountHolderName = json['accountHolderName'];
    bankName = json['bankName'];
    accountNo = json['accountNo'];
    ifscCode = json['ifscCode'];
    branch = json['branch'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accountHolderName'] = this.accountHolderName;
    data['bankName'] = this.bankName;
    data['accountNo'] = this.accountNo;
    data['ifscCode'] = this.ifscCode;
    data['branch'] = this.branch;
    return data;
  }
}

class UpiDetails {
  String? upiId1;
  String? googlePayNumber;
  String? phonePeNumber;
  String? upiId2;

  UpiDetails(
      {this.upiId1, this.googlePayNumber, this.phonePeNumber, this.upiId2});

  UpiDetails.fromJson(Map<String, dynamic> json) {
    upiId1 = json['upiId1'];
    googlePayNumber = json['googlePayNumber'];
    phonePeNumber = json['phonePeNumber'];
    upiId2 = json['upiId2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['upiId1'] = this.upiId1;
    data['googlePayNumber'] = this.googlePayNumber;
    data['phonePeNumber'] = this.phonePeNumber;
    data['upiId2'] = this.upiId2;
    return data;
  }
}

class OtherDetails {
  String? affiliatedBy;
  String? govtRegNo;
  String? isoCertificateDetails;

  OtherDetails({this.affiliatedBy, this.govtRegNo, this.isoCertificateDetails});

  OtherDetails.fromJson(Map<String, dynamic> json) {
    affiliatedBy = json['affiliatedBy'];
    govtRegNo = json['govtRegNo'];
    isoCertificateDetails = json['isoCertificateDetails'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['affiliatedBy'] = this.affiliatedBy;
    data['govtRegNo'] = this.govtRegNo;
    data['isoCertificateDetails'] = this.isoCertificateDetails;
    return data;
  }
}
