/*
class BillTearmsAndConditionModel {
  String? sId;
  String? type;
  String? agreement;
  String? termAndConditions;
  String? privacyPolicy;
  String? refundPolicy;
  String? aboutUs;
  int? iV;

  BillTearmsAndConditionModel(
      {this.sId,
        this.type,
        this.agreement,
        this.termAndConditions,
        this.privacyPolicy,
        this.refundPolicy,
        this.aboutUs,
        this.iV});

  BillTearmsAndConditionModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    type = json['type'];
    agreement = json['agreement'];
    termAndConditions = json['termAndConditions'];
    privacyPolicy = json['privacyPolicy'];
    refundPolicy = json['refundPolicy'];
    aboutUs = json['aboutUs'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['type'] = this.type;
    data['agreement'] = this.agreement;
    data['termAndConditions'] = this.termAndConditions;
    data['privacyPolicy'] = this.privacyPolicy;
    data['refundPolicy'] = this.refundPolicy;
    data['aboutUs'] = this.aboutUs;
    data['__v'] = this.iV;
    return data;
  }
}
*/
class BillTearmsAndConditionModel {
  String? sId;
  String? type;
  String? agreement;
  String? termAndConditions;
  String? privacyPolicy;
  String? refundPolicy;
  String? aboutUs;
  int? iV;

  BillTearmsAndConditionModel({
    this.sId,
    this.type,
    this.agreement,
    this.termAndConditions,
    this.privacyPolicy,
    this.refundPolicy,
    this.aboutUs,
    this.iV,
  });

  factory BillTearmsAndConditionModel.fromJson(Map<String, dynamic> json) {
    return BillTearmsAndConditionModel(
      sId: json['_id'],
      type: json['type'],
      agreement: json['agreement'],
      termAndConditions: json['termAndConditions'],
      privacyPolicy: json['privacyPolicy'],
      refundPolicy: json['refundPolicy'],
      aboutUs: json['aboutUs'],
      iV: json['__v'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': sId,
      'type': type,
      'agreement': agreement,
      'termAndConditions': termAndConditions,
      'privacyPolicy': privacyPolicy,
      'refundPolicy': refundPolicy,
      'aboutUs': aboutUs,
      '__v': iV,
    };
  }
}
