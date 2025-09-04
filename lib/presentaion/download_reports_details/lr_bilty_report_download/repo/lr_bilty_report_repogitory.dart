import '../../../../WebServices/app_url.dart';
import '../../../../WebServices/network/network_api_services.dart';
import '../model/lr_bilty_report_model.dart';


class LrBiltyReportPdfRepository {

  final _apiService = NetworkApiServices();

  Future<LrBiltyReportDownloadModel> getlrbiltyreportdataApi(String startDate, String endDate) async {
    try {
      final url = '${AppUrl.lrbill}?startDate=$startDate&endDate=$endDate';
      final response = await _apiService.getApiWithToken(url);
      print('Response: $response');

      if (response != null) {
        return LrBiltyReportDownloadModel.fromJson(response);
      } else {
        throw Exception('Failed to load data: Response is null');
      }
    } catch (e) {
      print('Error fetching packing report: $e');
      rethrow;
    }
  }
}



