import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../WebServices/app_url.dart';
import '../../../../WebServices/network/network_api_services.dart';
import '../get_byid_model/get_by_id_model.dart';
import '../model/survey_pdf_model.dart';

class SurveyPdfRepository{
  final _apiService = NetworkApiServices();
  Future<SurveyPdfModel> getsurveylistdataApi() async {
    try {
      final response = await _apiService.getApiWithToken(AppUrl.surveylist);
      print('response: $response');

      if (response != null) {
        // Parse the response into ProductsModel
        return SurveyPdfModel.fromJson(response);
      } else {
        throw Exception('Failed to load Cart data: response is null');
      }
    } catch (e) {
      print('Error fetching Cart data: $e');
      rethrow;
    }
  }
  Future<SurveyPdfModel> deleteQuotationById(String id) async {
    try {
      final response = await _apiService.deleteApiWithToken('${AppUrl.surveylist}/$id');

      print('response: $response');
      getsurveylistdataApi();

      if (response != null) {

        return SurveyPdfModel.fromJson(response);
      } else {
        throw Exception('Failed to load Cart data: response is null');
      }
    } catch (e) {
      print('Error fetching Cart data: $e');
      rethrow;
    }
  }

  Future<SurveyPdfModel> getsurveyIdApi(String id) async {
    try {
      final response = await _apiService.getApiWithToken('${AppUrl.surveylist}/$id{/pdf}');
      print('response: $response');

      if (response != null) {
        // Parse the response into ProductsModel
        return SurveyPdfModel.fromJson(response);
      } else {
        throw Exception('Failed to load Cart data: response is null');
      }
    } catch (e) {
      print('Error fetching Cart data: $e');
      rethrow;
    }
  }


  Future<SurveyPdfModel> getsurveyIdData(String id) async {
    try {
      final response = await _apiService.getApiWithToken('${AppUrl.surveylist}/$id');
      print('response: $response');

      if (response != null) {
        // Parse the response into ProductsModel
        return SurveyPdfModel.fromJson(response);
      } else {
        throw Exception('Failed to load Cart data: response is null');
      }
    } catch (e) {
      print('Error fetching Cart data: $e');
      rethrow;
    }
  }

  Future<SurveyPdfModel> patchsurveyByIdApi(String id, Map<String, dynamic> updateData) async {
    try {
      final response = await _apiService.patchApiWithToken(
          '${AppUrl.surveylist}/$id',
          updateData ,
          //jsonEncode(updateData)
      );

      print('PATCH Response: $response');

      if (response != null) {
        getsurveylistdataApi();
        return SurveyPdfModel.fromJson(response);
      } else {
        throw Exception('Failed to update packing data: response is null');
      }
    } catch (e) {
      print('Error patching packing data: $e');
      rethrow;
    }
  }

  Future<SurveyGetDataByIdModel?> getsurveyByIdApi(String id) async {
    try {
      print("balawant2.1");
      //final response = await _apiService.getApiWithToken(AppUrl.surveylist);
      final response = await _apiService.getApiWithToken(
        '${AppUrl.surveylist}/$id',

      );
      print("balawant2.2");
      print('response: $response');

      if (response != null) {
        return SurveyGetDataByIdModel.fromJson(response);
      } else {
        throw Exception('Failed to load Cart data: response is null');
      }
    } catch (e) {
      print('Error fetching Cart data: $e');
      rethrow;
    }
  }



}