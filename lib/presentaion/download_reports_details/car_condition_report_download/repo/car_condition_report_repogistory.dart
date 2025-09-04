import '../../../../WebServices/app_url.dart';
import '../../../../WebServices/network/network_api_services.dart';
import '../model/car_condition_report_model.dart';


class CarConditionReportRepogistory {
  final _apiService = NetworkApiServices();

  Future<CarConditionReportModel> getcardataApi(String startDate, String endDate) async {
    try {
      final url = '${AppUrl.carcondition}?startDate=$startDate&endDate=$endDate';
      final response = await _apiService.getApiWithToken(url);
      print('Response: $response');

      if (response != null) {
        return CarConditionReportModel.fromJson(response);
      } else {
        throw Exception('Failed to load data: Response is null');
      }
    } catch (e) {
      print('Error fetching packing report: $e');
      rethrow;
    }
  }
}



