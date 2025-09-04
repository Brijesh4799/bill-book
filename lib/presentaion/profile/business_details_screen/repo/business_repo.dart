import 'dart:developer';
import 'dart:io';
import '../../../../WebServices/app_url.dart';
import '../../../../WebServices/network/network_api_services.dart';
import '../model/business_details_model.dart';

class BusinessRepository {
  final _apiService = NetworkApiServices();

  Future<BusinessDetailsModel?> uploadDocuments({
    required var data,
    File? logoImg,
    File? signImg,
    File? stampImg,

  }) async {
      try {
    dynamic response =
    await _apiService.multipartApiForPanAndAadhaar(
      url: AppUrl.businessdetails,
      data: data,
      logoImg: logoImg,
      signImg: signImg,
      stampImg: stampImg,

    );

    return BusinessDetailsModel.fromJson(response);
  } catch (e) {
    throw e;
  }

  }

}
