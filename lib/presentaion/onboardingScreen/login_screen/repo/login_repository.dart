
import '../../../../WebServices/app_url.dart';
import '../../../../WebServices/network/network_api_services.dart';

class LoginRepository {
  final _apiService = NetworkApiServices();

  Future<dynamic> getOtpApi(var data) async {
    try {
      dynamic response =
      await _apiService.postApi(data, AppUrl.login);
      return response;
    } catch (e) {
      throw e;
    }
  }
}