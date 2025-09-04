class GetProfileModel {
  bool? success;
  User? user;

  GetProfileModel({this.success, this.user});

  GetProfileModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  String? sId;
  String? name;
  String? mobileNo;
  String? email;
  String? profileImage;
  String? status;
  String? createdAt;

  User(
      {this.sId,
        this.name,
        this.mobileNo,
        this.email,
        this.profileImage,
        this.status,
        this.createdAt});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    mobileNo = json['mobileNo'];
    email = json['email'];
    profileImage = json['profileImage'];
    status = json['status'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['mobileNo'] = this.mobileNo;
    data['email'] = this.email;
    data['profileImage'] = this.profileImage;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    return data;
  }
}
