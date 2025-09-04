import '../../../../WebServices/app_url.dart';
import '../../../../WebServices/network/network_api_services.dart';
import '../model/survey_list_model.dart';

class SurveyRepository{
  final _apiService = NetworkApiServices();

  /*Future<SurveyListModel?> businessapi(var data) async {
    try {
      dynamic response =
      await _apiService. patchApiWithToken(data, AppUrl.surveylist);
      return SurveyListModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }*/

  Future<SurveyListModel?> businessapi(var data) async {
    try {
      dynamic response =
      //await _apiService. patchApiWithToken(data, AppUrl.quotationdetails);
      await _apiService. postApiWithToken(data, AppUrl.surveylist);
      return SurveyListModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}