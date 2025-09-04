import '../../../../WebServices/app_url.dart';
import '../../../../WebServices/network/network_api_services.dart';
import '../model/otp_verify_model.dart';

class VerifyOtpRepository {
  final _apiService = NetworkApiServices();

  Future<VerifyOtpModel?> verifyOtpApi(var data) async {
    try {
      dynamic response =
      await _apiService.postApi(data, AppUrl.verifyOtp);
      return VerifyOtpModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}