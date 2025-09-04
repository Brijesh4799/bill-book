import '../../../../WebServices/app_url.dart';
import '../../../../WebServices/network/network_api_services.dart';
import '../../BillScreen/model/bill_model.dart';
import '../moel/FovScfFormModel.dart';

class FovScfFormRepository{
  final _apiService = NetworkApiServices();

  Future<FovScfFormModel?> businessapi(var data) async {
    try {
      dynamic response =
     // await _apiService. patchApiWithToken(data, AppUrl.fovScf);
      await _apiService. postApiWithToken(data, AppUrl.fovScf);
      return FovScfFormModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}