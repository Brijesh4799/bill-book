import 'package:BillBook/presentaion/profile/watermark_repo/watermarkModel.dart';

import '../../../../WebServices/app_url.dart';
import '../../../../WebServices/network/network_api_services.dart';


class WatermarkRepo {
  final _apiService = NetworkApiServices();

  Future<WaterMarkRepo?> businessapi(Map<String, dynamic> data) async {
    try {
      dynamic response = await _apiService.patchApiWithToken(data as String, AppUrl.watermark as Map<String, dynamic>);
      return WaterMarkRepo.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}


/*
class WatermarkRepo{
  final _apiService = NetworkApiServices();

  Future<WaterMarkRepo?> businessapi(var data) async {
    try {
      dynamic response =
      //await _apiService. patchApiWithToken(data, AppUrl.quotationdetails);
      await _apiService. patchApiWithToken(data, AppUrl.watermark as Map<String, dynamic>);
      return WaterMarkRepo.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}*/
