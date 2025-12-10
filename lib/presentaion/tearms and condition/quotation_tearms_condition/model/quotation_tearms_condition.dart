class QuotationTearmsAndConditionModel {
  String? sId;
  String? type;
  String? agreement;
  String? termAndConditions;
  String? privacyPolicy;
  String? refundPolicy;
  String? aboutUs;
  int? iV;

  QuotationTearmsAndConditionModel(
      {this.sId,
        this.type,
        this.agreement,
        this.termAndConditions,
        this.privacyPolicy,
        this.refundPolicy,
        this.aboutUs,
        this.iV});

  QuotationTearmsAndConditionModel.fromJson(Map<String, dynamic> json) {
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
