import '../../../../WebServices/app_url.dart';
import '../../../../WebServices/network/network_api_services.dart';

import '../model/survey_report_download_model.dart';

class SurveyReportPdfRepository {
  final _apiService = NetworkApiServices();

  Future<SurveyReportDownloadModel> getsurveyreportdataApi(String startDate, String endDate) async {
    try {
      final url = '${AppUrl.surveylist}?startDate=$startDate&endDate=$endDate';
      final response = await _apiService.getApiWithToken(url);
      print('Response: $response');

      if (response != null) {
        return SurveyReportDownloadModel.fromJson(response);
      } else {
        throw Exception('Failed to load data: Response is null');
      }
    } catch (e) {
      print('Error fetching packing report: $e');
      rethrow;
    }
  }
}



