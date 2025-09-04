class HomePageModel {
  bool? success;
  String? message;
  HomeData? homeData;
  DocCounts? docCounts;
  List<Banners>? banners;

  HomePageModel(
      {this.success,
        this.message,
        this.homeData,
        this.docCounts,
        this.banners});

  HomePageModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    homeData = json['homeData'] != null
        ? new HomeData.fromJson(json['homeData'])
        : null;
    docCounts = json['docCounts'] != null
        ? new DocCounts.fromJson(json['docCounts'])
        : null;
    if (json['banners'] != null) {
      banners = <Banners>[];
      json['banners'].forEach((v) {
        banners!.add(new Banners.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.homeData != null) {
      data['homeData'] = this.homeData!.toJson();
    }
    if (this.docCounts != null) {
      data['docCounts'] = this.docCounts!.toJson();
    }
    if (this.banners != null) {
      data['banners'] = this.banners!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class HomeData {
  String? logo;
  String? favicon;
  AdminCard? adminCard;

  HomeData({this.logo, this.favicon, this.adminCard});

  HomeData.fromJson(Map<String, dynamic> json) {
    logo = json['logo'];
    favicon = json['favicon'];
    adminCard = json['adminCard'] != null
        ? new AdminCard.fromJson(json['adminCard'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['logo'] = this.logo;
    data['favicon'] = this.favicon;
    if (this.adminCard != null) {
      data['adminCard'] = this.adminCard!.toJson();
    }
    return data;
  }
}

class AdminCard {
  String? title;
  String? description;
  String? image;
  bool? isActive;

  AdminCard({this.title, this.description, this.image, this.isActive});

  AdminCard.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    image = json['image'];
    isActive = json['isActive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    data['image'] = this.image;
    data['isActive'] = this.isActive;
    return data;
  }
}

class DocCounts {
  int? quotation;
  int? bill;
  int? carCondition;
  int? fovScf;
  int? lrbilty;
  int? money;
  int? noc;
  int? packing;
  int? paymentVoucher;
  int? proforma;
  int? survey;
  int? tws;

  DocCounts(
      {this.quotation,
        this.bill,
        this.carCondition,
        this.fovScf,
        this.lrbilty,
        this.money,
        this.noc,
        this.packing,
        this.paymentVoucher,
        this.proforma,
        this.survey,
        this.tws});

  DocCounts.fromJson(Map<String, dynamic> json) {
    quotation = json['quotation'];
    bill = json['bill'];
    carCondition = json['carCondition'];
    fovScf = json['fovScf'];
    lrbilty = json['lrbilty'];
    money = json['money'];
    noc = json['noc'];
    packing = json['packing'];
    paymentVoucher = json['paymentVoucher'];
    proforma = json['proforma'];
    survey = json['survey'];
    tws = json['tws'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['quotation'] = this.quotation;
    data['bill'] = this.bill;
    data['carCondition'] = this.carCondition;
    data['fovScf'] = this.fovScf;
    data['lrbilty'] = this.lrbilty;
    data['money'] = this.money;
    data['noc'] = this.noc;
    data['packing'] = this.packing;
    data['paymentVoucher'] = this.paymentVoucher;
    data['proforma'] = this.proforma;
    data['survey'] = this.survey;
    data['tws'] = this.tws;
    return data;
  }
}

class Banners {
  String? sId;
  String? title;
  String? image;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Banners(
      {this.sId,
        this.title,
        this.image,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Banners.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['image'] = this.image;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
