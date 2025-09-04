import '../../../../WebServices/app_url.dart';
import '../../../../WebServices/network/network_api_services.dart';
import '../model/nocletter_model.dart';

class NocLetterRepository{
  final _apiService = NetworkApiServices();

  Future<NocLetterModel?> businessapi(var data) async {
    try {
      dynamic response =
     // await _apiService. patchApiWithToken(data, AppUrl.noc);
      await _apiService. postApiWithToken(data, AppUrl.noc);
      return NocLetterModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}