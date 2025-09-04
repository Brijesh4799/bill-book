import '../../../../WebServices/app_url.dart';
import '../../../../WebServices/network/network_api_services.dart';
import '../model/Tws_form_model.dart';

class TwsFormRepository{
  final _apiService = NetworkApiServices();

  Future<TwsFormModel?> businessapi(var data) async {
    try {
      dynamic response =
     // await _apiService. patchApiWithToken(data, AppUrl.twsform);
      await _apiService. postApiWithToken(data, AppUrl.twsform);
      return TwsFormModel.fromJson(response);
    } catch (e) {
      throw e;
    }

  }
  //String get name => nameController.text;
}