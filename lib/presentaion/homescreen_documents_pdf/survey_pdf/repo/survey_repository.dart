import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../WebServices/app_url.dart';
import '../../../../WebServices/network/network_api_services.dart';
import '../get_byid_model/get_by_id_model.dart';
import '../model/survey_pdf_model.dart';

class SurveyPdfRepository{
  final _apiService = NetworkApiServices();
  // Future<SurveyPdfModel> getsurveylistdataApi() async {
  //   try {
  //     final response = await _apiService.getApiWithToken(AppUrl.surveylist);
  //     print('response: $response');
  //
  //     if (response != null) {
  //       // Parse the response into ProductsModel
  //       return SurveyPdfModel.fromJson(response);
  //     } else {
  //       throw Exception('Failed to load Cart data: response is null');
  //     }
  //   } catch (e) {
  //     print('Error fetching Cart data: $e');
  //     rethrow;
  //   }
  // }

  Future<SurveyPdfModel> getsurveylistdataApi({required int pageCount}) async {
    try {
      final response = await _apiService.getApiWithToken("${AppUrl.surveylist}?page=$pageCount&limit=10");
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
      getsurveylistdataApi(pageCount:1);

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
        getsurveylistdataApi(pageCount:1);
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

  Future<dynamic> serveypdfApi(String id) async {
    try {
      final url = "${AppUrl.surveyPDF}/$id/pdf";
      print("[log] PDF Url => $url");
      SharedPreferences pref = await SharedPreferences.getInstance();
      var token = pref.getString("token");

      //final token = await _apiService.getToken(); // implement getToken() in your service
      print("[log] token => $token");

      final response = await http.get(
        Uri.parse(url),
        headers: {
          "Authorization": "Bearer $token",
          "Accept": "application/pdf",
        },
      );

      if (response.statusCode == 200) {
        return response.bodyBytes; // ✅ raw PDF bytes
      } else {
        throw Exception("Failed to load PDF. Status: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error fetching PDF: $e");
    }
  }

}