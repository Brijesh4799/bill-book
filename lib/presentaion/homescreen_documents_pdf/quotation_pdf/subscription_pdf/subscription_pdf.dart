class SubscriptionPdf {
  bool? success;
  bool? isSubscribed;

  SubscriptionPdf({this.success, this.isSubscribed});

  SubscriptionPdf.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    isSubscribed = json['isSubscribed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['isSubscribed'] = this.isSubscribed;
    return data;
  }
}
