import '../../../../WebServices/app_url.dart';
import '../../../../WebServices/network/network_api_services.dart';
import '../model/quotation_report_model.dart';



class QuotationreportRepogistory {
  final _apiService = NetworkApiServices();

  Future<QuotationReportModel> getquotationApi(String startDate, String endDate) async {
    try {
      final url = '${AppUrl.quotationdetails}?startDate=$startDate&endDate=$endDate';
      final response = await _apiService.getApiWithToken(url);
      print('Response: $response');

      if (response != null) {
        return QuotationReportModel.fromJson(response);
      } else {
        throw Exception('Failed to load data: Response is null');
      }
    } catch (e) {
      print('Error fetching packing report: $e');
      rethrow;
    }
  }
}



