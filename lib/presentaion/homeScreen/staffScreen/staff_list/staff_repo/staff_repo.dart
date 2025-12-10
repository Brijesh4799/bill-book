
import '../../../../../WebServices/app_url.dart';
import '../../../../../WebServices/network/network_api_services.dart';
import '../staff_data_post_model/staff_data_post_model.dart';
import '../staff_list_model/staff_list_model.dart';

class StaffListRepository{
  final _apiService = NetworkApiServices();

  Future<StafeListModel?> businessapi(var data) async {
    try {
      dynamic response =
      await _apiService. getApiWithToken( AppUrl.stafflist);
      return StafeListModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
  Future<StafeListModel?> activestaffapi(var data) async {
    try {
      dynamic response =
      await _apiService. getApiWithToken( AppUrl.activestafflist);
      return StafeListModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }

  Future<StaffListPostModel?> Poststaff(var data) async {
    try {
      dynamic response =
      await _apiService. postApiWithToken(data, AppUrl.poststafflist);
      return StaffListPostModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }

}

//activestafflist