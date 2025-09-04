class PackingGetDataByIdModel {
  bool? status;
  Data? data;

  PackingGetDataByIdModel({this.status, this.data});

  PackingGetDataByIdModel.fromJson(Map<String, dynamic> json) {
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
  CustomerDetails? customerDetails;
  List<ItemParticulars>? itemParticulars;

  FormData({this.customerDetails, this.itemParticulars});

  FormData.fromJson(Map<String, dynamic> json) {
    customerDetails = json['customerDetails'] != null
        ? new CustomerDetails.fromJson(json['customerDetails'])
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
    if (this.customerDetails != null) {
      data['customerDetails'] = this.customerDetails!.toJson();
    }
    if (this.itemParticulars != null) {
      data['itemParticulars'] =
          this.itemParticulars!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CustomerDetails {
  String? name;
  String? phone;
  String? packingNumber;
  String? date;
  String? moveFrom;
  String? moveTo;
  String? vehicleNo;

  CustomerDetails(
      {this.name,
        this.phone,
        this.packingNumber,
        this.date,
        this.moveFrom,
        this.moveTo,
        this.vehicleNo});

  CustomerDetails.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
    packingNumber = json['packingNumber'];
    date = json['date'];
    moveFrom = json['moveFrom'];
    moveTo = json['moveTo'];
    vehicleNo = json['vehicleNo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['packingNumber'] = this.packingNumber;
    data['date'] = this.date;
    data['moveFrom'] = this.moveFrom;
    data['moveTo'] = this.moveTo;
    data['vehicleNo'] = this.vehicleNo;
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
