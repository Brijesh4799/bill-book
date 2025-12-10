class QuotationGetDataByIdModel {
  bool? status;
  Data? data;

  QuotationGetDataByIdModel({this.status, this.data});

  QuotationGetDataByIdModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? userId;
  FormData? formData;
  String? status;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Data(
      {this.sId,
        this.userId,
        this.formData,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userId = json['userId'];
    formData = json['formData'] != null
        ? new FormData.fromJson(json['formData'])
        : null;
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['userId'] = this.userId;
    if (this.formData != null) {
      data['formData'] = this.formData!.toJson();
    }
    data['status'] = this.status;
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
  Insurance? vehicleInsurance;
  OtherDetails? otherDetails;
  List<ItemParticulars>? itemParticulars;

  FormData(
      {this.quotationDetails,
        this.moveFrom,
        this.moveTo,
        this.paymentDetails,
        this.insurance,
        this.vehicleInsurance,
        this.otherDetails,
        this.itemParticulars});

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
        ? new Insurance.fromJson(json['vehicleInsurance'])
        : null;
    otherDetails = json['otherDetails'] != null
        ? new OtherDetails.fromJson(json['otherDetails'])
        : null;
    if (json['itemParticulars'] != null) {
      itemParticulars = <ItemParticulars>[];
      json['itemParticulars'].forEach((v) {
        itemParticulars!.add(new ItemParticulars.fromJson(v));
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
    if (this.itemParticulars != null) {
      data['itemParticulars'] =
          this.itemParticulars!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class QuotationDetails {
  String? quotationNumber;
  String? packingDate;
  String? movingType;
  String? companynameofparty;
  String? companygstno;
  String? partyname;
  String? email;
  String? phone;
  String? qtdate;
  String? shiptdate;

  QuotationDetails(
      {this.quotationNumber,
        this.packingDate,
        this.movingType,
        this.companynameofparty,
        this.companygstno,
        this.partyname,
        this.email,
        this.phone,
        this.qtdate,
        this.shiptdate});

  QuotationDetails.fromJson(Map<String, dynamic> json) {
    quotationNumber = json['quotationNumber'];
    packingDate = json['packingDate'];
    movingType = json['movingType'];
    companynameofparty = json['companynameofparty'];
    companygstno = json['companygstno'];
    partyname = json['partyname'];
    email = json['email'];
    phone = json['phone'];
    qtdate = json['qtdate'];
    shiptdate = json['shiptdate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['quotationNumber'] = this.quotationNumber;
    data['packingDate'] = this.packingDate;
    data['movingType'] = this.movingType;
    data['companynameofparty'] = this.companynameofparty;
    data['companygstno'] = this.companygstno;
    data['partyname'] = this.partyname;
    data['email'] = this.email;
    data['phone'] = this.email;
    data['qtdate'] = this.qtdate;
    data['shiptdate'] = this.shiptdate;
    return data;
  }
}

class MoveFrom {
  String? fromcountry;
  String? frompincode;
  String? fromaddress;
  String? state;
  String? city;
  String? fromfloor;
  String? fromisLiftAvailable;

  MoveFrom(
      {this.fromcountry,
        this.frompincode,
        this.fromaddress,
        this.state,
        this.city,
        this.fromfloor,
        this.fromisLiftAvailable});

  MoveFrom.fromJson(Map<String, dynamic> json) {
    fromcountry = json['fromcountry'];
    frompincode = json['frompincode'];
    fromaddress = json['fromaddress'];
    state = json['state'];
    city = json['city'];
    fromfloor = json['fromfloor'];
    fromisLiftAvailable = json['fromisLiftAvailable'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fromcountry'] = this.fromcountry;
    data['frompincode'] = this.frompincode;
    data['fromaddress'] = this.fromaddress;
    data['state'] = this.state;
    data['city'] = this.city;
    data['fromfloor'] = this.fromfloor;
    data['fromisLiftAvailable'] = this.fromisLiftAvailable;
    return data;
  }
}

class MoveTo {
  String? movecountry;
  String? state;
  String? city;
  String? movepincode;
  String? moveaddress;
  String? movefloore;
  String? moveisLiftAvailable;

  MoveTo(
      {this.movecountry,
        this.state,
        this.city,
        this.movepincode,
        this.moveaddress,
        this.movefloore,
        this.moveisLiftAvailable});

  MoveTo.fromJson(Map<String, dynamic> json) {
    movecountry = json['movecountry'];
    state = json['state'];
    city = json['city'];
    movepincode = json['movepincode'];
    moveaddress = json['moveaddress'];
    movefloore = json['movefloore'];
    moveisLiftAvailable = json['moveisLiftAvailable'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['movecountry'] = this.movecountry;
    data['state'] = this.state;
    data['city'] = this.city;
    data['movepincode'] = this.movepincode;
    data['moveaddress'] = this.moveaddress;
    data['movefloore'] = this.movefloore;
    data['moveisLiftAvailable'] = this.moveisLiftAvailable;
    return data;
  }
}

class PaymentDetails {
  String? freightCharge;
  String? advancePaid;
  String? pakingcharge;
  String? unpakingcharge;
  String? lodingcharge;
  String? unloadingcharge;
  String? packingmaterialcharge;
  String? storgecharge;
  String? carbiketpt;
  String? miscellaneouscharge;
  String? othercharge;
  String? stcharge;
  String? octriogreentax;
  String? remark;
  String? discount;

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
    data['remark'] = this.remark;
    data['discount'] = this.discount;
    return data;
  }
}

class Insurance {
  String? type;
  String? percent;
  String? gst;
  String? declarationvalue;

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

class OtherDetails {
  String? loadingunloading;
  String? anyiteam;
  String? restrictions;
  String? specialNeeds;

  OtherDetails(
      {this.loadingunloading,
        this.anyiteam,
        this.restrictions,
        this.specialNeeds});

  OtherDetails.fromJson(Map<String, dynamic> json) {
    loadingunloading = json['loadingunloading'];
    anyiteam = json['anyiteam'];
    restrictions = json['restrictions'];
    specialNeeds = json['specialNeeds'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['loadingunloading'] = this.loadingunloading;
    data['anyiteam'] = this.anyiteam;
    data['restrictions'] = this.restrictions;
    data['specialNeeds'] = this.specialNeeds;
    return data;
  }
}

class ItemParticulars {
  String? itemName;
  String? boxNumber;
  int? quantity;
  int? value;
  int? cft;
  String? remark;

  ItemParticulars(
      {this.itemName,
        this.boxNumber,
        this.quantity,
        this.value,
        this.cft,
        this.remark});

  ItemParticulars.fromJson(Map<String, dynamic> json) {
    itemName = json['itemName'];
    boxNumber = json['boxNumber'];
    quantity = json['quantity'];
    value = json['value'];
    cft = json['cft'];
    remark = json['remark'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itemName'] = this.itemName;
    data['boxNumber'] = this.boxNumber;
    data['quantity'] = this.quantity;
    data['value'] = this.value;
    data['cft'] = this.cft;
    data['remark'] = this.remark;
    return data;
  }
}
