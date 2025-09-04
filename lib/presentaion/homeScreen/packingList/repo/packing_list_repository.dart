import '../../../../WebServices/app_url.dart';
import '../../../../WebServices/network/network_api_services.dart';
import '../model/packing_list_model.dart';

class PackingListRepository{
  final _apiService = NetworkApiServices();

  /*Future<PackingListModel?> businessapi(var data) async {
    try {
      dynamic response =
      await _apiService. patchApiWithToken(data, AppUrl.packinglist);
      return PackingListModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }*/
  Future<PackingListModel?> businessapi(var data) async {
    try {
      dynamic response =
      //await _apiService. patchApiWithToken(data, AppUrl.quotationdetails);
      await _apiService. postApiWithToken(data, AppUrl.packinglist);
      return PackingListModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}