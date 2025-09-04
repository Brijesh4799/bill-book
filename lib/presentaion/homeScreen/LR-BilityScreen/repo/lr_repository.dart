import '../../../../WebServices/app_url.dart';
import '../../../../WebServices/network/network_api_services.dart';
import '../model/lr_bill_model.dart';

class LRBillRepository{
  final _apiService = NetworkApiServices();

  Future<LRBillModel?> businessapi(var data) async {
    try {
      dynamic response =
      //await _apiService. patchApiWithToken(data, AppUrl.lrbill);
      await _apiService. postApiWithToken(data, AppUrl.lrbill);
      return LRBillModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}