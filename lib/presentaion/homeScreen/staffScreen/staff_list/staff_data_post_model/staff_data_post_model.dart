class StaffListPostModel {
  bool? status;
  String? message;
  Data? data;

  StaffListPostModel({this.status, this.message, this.data});

  StaffListPostModel.fromJson(Map<String, dynamic> json) {
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
  NewStaff? newStaff;

  Data({this.newStaff});

  Data.fromJson(Map<String, dynamic> json) {
    newStaff = json['newStaff'] != null
        ? new NewStaff.fromJson(json['newStaff'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.newStaff != null) {
      data['newStaff'] = this.newStaff!.toJson();
    }
    return data;
  }
}

class NewStaff {
  String? name;
  String? email;
  String? phone;
  String? address;
  String? image;
  String? sId;
  int? iV;

  NewStaff(
      {this.name,
        this.email,
        this.phone,
        this.address,
        this.image,
        this.sId,
        this.iV});

  NewStaff.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
    image = json['image'];
    sId = json['_id'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['image'] = this.image;
    data['_id'] = this.sId;
    data['__v'] = this.iV;
    return data;
  }
}
