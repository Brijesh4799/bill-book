import '../../../../WebServices/app_url.dart';
import '../../../../WebServices/network/network_api_services.dart';
import '../model/bill_report_model.dart';
class billReportRepository {
  final _apiService = NetworkApiServices();
  Future<BillReportModel> getbilldataApi(String startDate, String endDate) async {
    try {
      final url = '${AppUrl.billdetails}?startDate=$startDate&endDate=$endDate';
      final response = await _apiService.getApiWithToken(url);
      print('Response: $response');
      if (response != null) {
        return BillReportModel.fromJson(response);
      } else {
        throw Exception('Failed to load data: Response is null');
      }
    } catch (e) {
      print('Error fetching packing report: $e');
      rethrow;
    }
  }
}



