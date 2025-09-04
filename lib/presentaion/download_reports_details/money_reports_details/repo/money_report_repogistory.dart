import '../../../../WebServices/app_url.dart';
import '../../../../WebServices/network/network_api_services.dart';
import '../model/money_reports_download.dart';


class MoneyReportRepogistory {
  final _apiService = NetworkApiServices();

  Future<MoneyReceiptReportModel> getmoneydataApi(String startDate, String endDate) async {
    try {
      final url = '${AppUrl.moneyreceipt}?startDate=$startDate&endDate=$endDate';
      final response = await _apiService.getApiWithToken(url);
      print('Response: $response');

      if (response != null) {
        return MoneyReceiptReportModel.fromJson(response);
      } else {
        throw Exception('Failed to load data: Response is null');
      }
    } catch (e) {
      print('Error fetching packing report: $e');
      rethrow;
    }
  }
}



