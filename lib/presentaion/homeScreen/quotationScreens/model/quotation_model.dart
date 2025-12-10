class QuotationModel {
  bool? status;
  var message;
  Data? data;

  QuotationModel({this.status, this.message, this.data});

  QuotationModel.fromJson(Map<String, dynamic> json) {
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
  var userId;
  FormData? formData;
  var status;
  var sId;
  var createdAt;
  var updatedAt;
  var iV;

  Data(
      {this.userId,
        this.formData,
        this.status,
        this.sId,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    formData = json['formData'] != null
        ? new FormData.fromJson(json['formData'])
        : null;
    status = json['status'];
    sId = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    if (this.formData != null) {
      data['formData'] = this.formData!.toJson();
    }
    data['status'] = this.status;
    data['_id'] = this.sId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class FormData {
  QuotationDetails? quotationDetails;
  MoveFrom? moveFrom;
  MoveTo? moveTo;
  PaymentDetails? paymentDetails;
  Insurance? insurance;
  VehicleInsurance? vehicleInsurance;
  OtherDetails? otherDetails;
  List<Items>? items;

  FormData(
      {this.quotationDetails,
        this.moveFrom,
        this.moveTo,
        this.paymentDetails,
        this.insurance,
        this.vehicleInsurance,
        this.otherDetails,
        this.items});

  FormData.fromJson(Map<String, dynamic> json) {
    quotationDetails = json['quotationDetails'] != null
        ? new QuotationDetails.fromJson(json['quotationDetails'])
        : null;
    moveFrom = json['moveFrom'] != null
        ? new MoveFrom.fromJson(json['moveFrom'])
        : null;
    moveTo =
    json['moveTo'] != null ? new MoveTo.fromJson(json['moveTo']) : null;
    paymentDetails = json['paymentDetails'] != null
        ? new PaymentDetails.fromJson(json['paymentDetails'])
        : null;
    insurance = json['insurance'] != null
        ? new Insurance.fromJson(json['insurance'])
        : null;
    vehicleInsurance = json['vehicleInsurance'] != null
        ? new VehicleInsurance.fromJson(json['vehicleInsurance'])
        : null;
    otherDetails = json['otherDetails'] != null
        ? new OtherDetails.fromJson(json['otherDetails'])
        : null;
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.quotationDetails != null) {
      data['quotationDetails'] = this.quotationDetails!.toJson();
    }
    if (this.moveFrom != null) {
      data['moveFrom'] = this.moveFrom!.toJson();
    }
    if (this.moveTo != null) {
      data['moveTo'] = this.moveTo!.toJson();
    }
    if (this.paymentDetails != null) {
      data['paymentDetails'] = this.paymentDetails!.toJson();
    }
    if (this.insurance != null) {
      data['insurance'] = this.insurance!.toJson();
    }
    if (this.vehicleInsurance != null) {
      data['vehicleInsurance'] = this.vehicleInsurance!.toJson();
    }
    if (this.otherDetails != null) {
      data['otherDetails'] = this.otherDetails!.toJson();
    }
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class QuotationDetails {
  var quotationNumber;
  var movingType;
  var companyName;
  var packingDate;
  var companynameofparty;
  var companygstno;
  var partyname;
  var email;
  var qtdate;
  var phone;
  var shiptdate;

  QuotationDetails(
      {this.quotationNumber,
        this.movingType,
        this.companyName,
        this.packingDate,
        this.companynameofparty,
        this.companygstno,
        this.partyname,
        this.email,
        this.qtdate,
        this.phone,
        this.shiptdate});

  QuotationDetails.fromJson(Map<String, dynamic> json) {
    quotationNumber = json['quotationNumber'];
    movingType = json['movingType'];
    companyName = json['companyName'];
    packingDate = json['packingDate'];
    companynameofparty = json['companynameofparty'];
    companygstno = json['companygstno'];
    partyname = json['partyname'];
    email = json['email'];
    qtdate = json['qtdate'];
    phone = json['phone'];
    shiptdate = json['shiptdate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['quotationNumber'] = this.quotationNumber;
    data['movingType'] = this.movingType;
    data['companyName'] = this.companyName;
    data['packingDate'] = this.packingDate;
    data['companynameofparty'] = this.companynameofparty;
    data['companygstno'] = this.companygstno;
    data['partyname'] = this.partyname;
    data['email'] = this.email;
    data['qtdate'] = this.qtdate;
    data['phone'] = this.phone;
    data['shiptdate'] = this.shiptdate;
    return data;
  }
}

class MoveFrom {
  var fromcountry;
  var fromstate;
  var fromcity;
  var frompincode;
  var fromaddress;
  var fromfloor;
  var fromisLiftAvailable;

  MoveFrom(
      {this.fromcountry,
        this.fromstate,
        this.fromcity,
        this.frompincode,
        this.fromaddress,
        this.fromfloor,
        this.fromisLiftAvailable});

  MoveFrom.fromJson(Map<String, dynamic> json) {
    fromcountry = json['fromcountry'];
    fromstate = json['fromstate'];
    fromcity = json['fromcity'];
    frompincode = json['frompincode'];
    fromaddress = json['fromaddress'];
    fromfloor = json['fromfloor'];
    fromisLiftAvailable = json['fromisLiftAvailable'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fromcountry'] = this.fromcountry;
    data['fromstate'] = this.fromstate;
    data['fromcity'] = this.fromcity;
    data['frompincode'] = this.frompincode;
    data['fromaddress'] = this.fromaddress;
    data['fromfloor'] = this.fromfloor;
    data['fromisLiftAvailable'] = this.fromisLiftAvailable;
    return data;
  }
}

class MoveTo {
  var movecountry;
  var movestate;
  var movecity;
  var movepincode;
  var moveaddress;
  var movefloore;
  var moveisLiftAvailable;

  MoveTo(
      {this.movecountry,
        this.movestate,
        this.movecity,
        this.movepincode,
        this.moveaddress,
        this.movefloore,
        this.moveisLiftAvailable});

  MoveTo.fromJson(Map<String, dynamic> json) {
    movecountry = json['movecountry'];
    movestate = json['movestate'];
    movecity = json['movecity'];
    movepincode = json['movepincode'];
    moveaddress = json['moveaddress'];
    movefloore = json['movefloore'];
    moveisLiftAvailable = json['moveisLiftAvailable'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['movecountry'] = this.movecountry;
    data['movestate'] = this.movestate;
    data['movecity'] = this.movecity;
    data['movepincode'] = this.movepincode;
    data['moveaddress'] = this.moveaddress;
    data['movefloore'] = this.movefloore;
    data['moveisLiftAvailable'] = this.moveisLiftAvailable;
    return data;
  }
}

class PaymentDetails {
  var freightCharge;
  var advancePaid;
  var pakingcharge;
  var unpakingcharge;
  var lodingcharge;
  var unloadingcharge;
  var packingmaterialcharge;
  var storgecharge;
  var carbiketpt;
  var miscellaneouscharge;
  var othercharge;
  var stcharge;
  var octriogreentax;
  var surcharge;
  var surchargevalue;
  var gstshowhide;
  var gstPercent;
  var gsttype;
  var remark;
  var discount;

  PaymentDetails(
      {this.freightCharge,
        this.advancePaid,
        this.pakingcharge,
        this.unpakingcharge,
        this.lodingcharge,
        this.unloadingcharge,
        this.packingmaterialcharge,
        this.storgecharge,
        this.carbiketpt,
        this.miscellaneouscharge,
        this.othercharge,
        this.stcharge,
        this.octriogreentax,
        this.surcharge,
        this.surchargevalue,
        this.gstshowhide,
        this.gstPercent,
        this.gsttype,
        this.remark,
        this.discount});

  PaymentDetails.fromJson(Map<String, dynamic> json) {
    freightCharge = json['freightCharge'];
    advancePaid = json['advancePaid'];
    pakingcharge = json['pakingcharge'];
    unpakingcharge = json['unpakingcharge'];
    lodingcharge = json['lodingcharge'];
    unloadingcharge = json['unloadingcharge'];
    packingmaterialcharge = json['packingmaterialcharge'];
    storgecharge = json['storgecharge'];
    carbiketpt = json['carbiketpt'];
    miscellaneouscharge = json['miscellaneouscharge'];
    othercharge = json['othercharge'];
    stcharge = json['stcharge'];
    octriogreentax = json['octriogreentax'];
    surcharge = json['surcharge'];
    surchargevalue = json['surchargevalue'];
    gstshowhide = json['gstshowhide'];
    gstPercent = json['gstPercent'];
    gsttype = json['gsttype'];
    remark = json['remark'];
    discount = json['discount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['freightCharge'] = this.freightCharge;
    data['advancePaid'] = this.advancePaid;
    data['pakingcharge'] = this.pakingcharge;
    data['unpakingcharge'] = this.unpakingcharge;
    data['lodingcharge'] = this.lodingcharge;
    data['unloadingcharge'] = this.unloadingcharge;
    data['packingmaterialcharge'] = this.packingmaterialcharge;
    data['storgecharge'] = this.storgecharge;
    data['carbiketpt'] = this.carbiketpt;
    data['miscellaneouscharge'] = this.miscellaneouscharge;
    data['othercharge'] = this.othercharge;
    data['stcharge'] = this.stcharge;
    data['octriogreentax'] = this.octriogreentax;
    data['surcharge'] = this.surcharge;
    data['gstshowhide'] = this.gstshowhide;
    data['gstPercent'] = this.gstPercent;
    data['gsttype'] = this.gsttype;
    data['remark'] = this.remark;
    data['discount'] = this.discount;
    return data;
  }
}

class Insurance {
  var type;
  var percent;
  var gst;
  var declarationvalue;

  Insurance({this.type, this.percent, this.gst, this.declarationvalue});

  Insurance.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    percent = json['percent'];
    gst = json['gst'];
    declarationvalue = json['declarationvalue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['percent'] = this.percent;
    data['gst'] = this.gst;
    data['declarationvalue'] = this.declarationvalue;
    return data;
  }
}

class VehicleInsurance {
  var type;
  var insurancecharge;
  var gst;
  var declarationvalue;

  VehicleInsurance(
      {this.type, this.insurancecharge, this.gst, this.declarationvalue});

  VehicleInsurance.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    insurancecharge = json['insurancecharge'];
    gst = json['gst'];
    declarationvalue = json['declarationvalue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['insurancecharge'] = this.insurancecharge;
    data['gst'] = this.gst;
    data['declarationvalue'] = this.declarationvalue;
    return data;
  }
}

class OtherDetails {
  var loadingunloading;
  var anyiteam;
  var restrictions;
  var restrictionsforloding;
  var specialNeeds;

  OtherDetails(
      {this.loadingunloading,
        this.anyiteam,
        this.restrictions,
        this.restrictionsforloding,
        this.specialNeeds});

  OtherDetails.fromJson(Map<String, dynamic> json) {
    loadingunloading = json['loadingunloading'];
    anyiteam = json['anyiteam'];
    restrictions = json['restrictions'];
    restrictionsforloding = json['restrictionsforloding'];
    specialNeeds = json['specialNeeds'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['loadingunloading'] = this.loadingunloading;
    data['anyiteam'] = this.anyiteam;
    data['restrictions'] = this.restrictions;
    data['restrictionsforloding'] = this.restrictionsforloding;
    data['specialNeeds'] = this.specialNeeds;
    return data;
  }
}

class Items {
  var name;
  var qty;
  var value;
  var remark;

  Items({this.name, this.qty, this.value, this.remark});

  Items.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    qty = json['qty'];
    value = json['value'];
    remark = json['remark'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['qty'] = this.qty;
    data['value'] = this.value;
    data['remark'] = this.remark;
    return data;
  }
}