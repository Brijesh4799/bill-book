import '../../../../../WebServices/app_url.dart';
import '../../../../../WebServices/network/network_api_services.dart';
import '../model/cms_model.dart';

class CmsRepository{
  final _apiService = NetworkApiServices();

  Future<CMSModel?> businessapi(var data) async {
    try {
      dynamic response =
      await _apiService. getApiWithToken( AppUrl.cms);
      return CMSModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}