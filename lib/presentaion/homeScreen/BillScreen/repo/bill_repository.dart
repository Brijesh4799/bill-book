import '../../../../WebServices/app_url.dart';
import '../../../../WebServices/network/network_api_services.dart';

import '../model/bill_model.dart';

class BillRepository{
  final _apiService = NetworkApiServices();

  Future<BillDetailsModel?> businessapi(var data) async {
    try {
      dynamic response =
      //await _apiService. patchApiWithToken(data, AppUrl.billdetails);
      await _apiService. postApiWithToken(data, AppUrl.billdetails);
      return BillDetailsModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}