

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../WebServices/app_url.dart';
import '../../../../WebServices/network/network_api_services.dart';
import '../get_by_id_model/car_condition_get_by_id.dart';
import '../model/car_condition_pdf_model.dart';


class CarConditionPdfRepository{
  final _apiService = NetworkApiServices();
  Future<CarConditionPdfModel> getcarconditiondataApi({required int pageCount}) async {
    try {
      final response = await _apiService.getApiWithToken("${AppUrl.carcondition}?page=$pageCount&limit=10");
      print('response: $response');

      if (response != null) {
        // Parse the response into ProductsModel
        return CarConditionPdfModel.fromJson(response);
      } else {
        throw Exception('Failed to load Cart data: response is null');
      }
    } catch (e) {
      print('Error fetching Cart data: $e');
      rethrow;
    }
  }
  Future<CarConditionPdfModel> deleteCarConditionById(String id) async {
    try {
      //final response = await _apiService.deleteApiWithToken(AppUrl.surveylist/'$id');
      final response = await _apiService.deleteApiWithToken('${AppUrl.carcondition}/$id');

      print('response: $response');

      if (response != null) {
        // Parse the response into ProductsModel
        return CarConditionPdfModel.fromJson(response);
      } else {
        throw Exception('Failed to load Cart data: response is null');
      }
    } catch (e) {
      print('Error fetching Cart data: $e');
      rethrow;
    }
  }


  Future<CarConditionPdfModel> patchcarByIdApi(String id, Map<String, dynamic> updateData) async {
    try {
      final response = await _apiService.patchApiWithToken(
          '${AppUrl.carcondition}/$id',
          updateData ,
         // jsonEncode(updateData)
      );

      print('PATCH Response: $response');

      if (response != null) {
        getcarconditiondataApi(pageCount: 1);
        return CarConditionPdfModel.fromJson(response);
      } else {
        throw Exception('Failed to update Bill data data: response is null');
      }
    } catch (e) {
      print('Error patching bill  data: $e');
      rethrow;
    }
  }

  Future<CarConditionGetDataModel?> getcarconditionByIdApi(String id) async {
    try {
      final response = await _apiService.getApiWithToken(
        '${AppUrl.carcondition}/$id',

      );
      print('response: $response');

      if (response != null) {
        return CarConditionGetDataModel.fromJson(response);
      } else {
        throw Exception('Failed to load Cart data: response is null');
      }
    } catch (e) {
      print('Error fetching Cart data: $e');
      rethrow;
    }
  }


  Future<dynamic> carpdfApi(String id) async {
    try {
      final url = "${AppUrl.carPDF}/$id/pdf";
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
        return response.bodyBytes;
      } else {
        throw Exception("Failed to load PDF. Status: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error fetching PDF: $e");
    }
  }

}