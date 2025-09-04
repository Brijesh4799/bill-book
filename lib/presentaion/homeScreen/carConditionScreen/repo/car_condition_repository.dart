import '../../../../WebServices/app_url.dart';
import '../../../../WebServices/network/network_api_services.dart';
import '../../BillScreen/model/bill_model.dart';
import '../model/car_condition_model.dart';

class CarConditionRepository{
  final _apiService = NetworkApiServices();

  Future<CarConditionModel?> businessapi(var data) async {
    try {
      dynamic response =
      //await _apiService. patchApiWithToken(data, AppUrl.carcondition);
      await _apiService. postApiWithToken(data, AppUrl.carcondition);
      return CarConditionModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}