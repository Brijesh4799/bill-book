import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../WebServices/app_url.dart';
import '../../../../WebServices/network/network_api_services.dart';

import '../get_by_id_model/tws_get_byid_model.dart';
import '../model/tws_pdf_model.dart';

class TWSPdfRepository{
  final _apiService = NetworkApiServices();
  // Future<TwsPdfModel> gettwslistdataApi() async {
  //   try {
  //     final response = await _apiService.getApiWithToken(AppUrl.twsform);
  //     print('response: $response');
  //
  //     if (response != null) {
  //       // Parse the response into ProductsModel
  //       return TwsPdfModel.fromJson(response);
  //     } else {
  //       throw Exception('Failed to load Cart data: response is null');
  //     }
  //   } catch (e) {
  //     print('Error fetching Cart data: $e');
  //     rethrow;
  //   }
  // }

  Future<TwsPdfModel> gettwslistdataApi({required int pageCount}) async {
    try {
      final response = await _apiService.getApiWithToken("${AppUrl.twsform}?page=$pageCount&limit=10");
      print('response: $response');

      if (response != null) {
        // Parse the response into ProductsModel
        return TwsPdfModel.fromJson(response);
      } else {
        throw Exception('Failed to load Cart data: response is null');
      }
    } catch (e) {
      print('Error fetching Cart data: $e');
      rethrow;
    }
  }

  Future<TwsPdfModel> deletetwsById(String id) async {
    try {
      //final response = await _apiService.deleteApiWithToken(AppUrl.surveylist/'$id');
      final response = await _apiService.deleteApiWithToken('${AppUrl.twsform}/$id');

      print('response: $response');

      if (response != null) {
        // Parse the response into ProductsModel
        return TwsPdfModel.fromJson(response);
      } else {
        throw Exception('Failed to load Cart data: response is null');
      }
    } catch (e) {
      print('Error fetching Cart data: $e');
      rethrow;
    }
  }

  Future<TwsPdfModel> patchtwsByIdApi(String id, Map<String, dynamic> updateData) async {
    try {
      final response = await _apiService.patchApiWithToken(
          '${AppUrl.twsform}/$id',
          updateData ,
          //jsonEncode(updateData)
      );

      print('PATCH Response: $response');

      if (response != null) {
        gettwslistdataApi(pageCount:1);
        return TwsPdfModel.fromJson(response);
      } else {
        throw Exception('Failed to update tws data data: response is null');
      }
    } catch (e) {
      print('Error patching tws  data: $e');
      rethrow;
    }
  }

  Future<TWSGetDataModel?> gettwsByIdApi(String id) async {
    try {
      final response = await _apiService.getApiWithToken(
        '${AppUrl.twsform}/$id',

      );
      print('response: $response');

      if (response != null) {
        return TWSGetDataModel.fromJson(response);
      } else {
        throw Exception('Failed to load Cart data: response is null');
      }
    } catch (e) {
      print('Error fetching Cart data: $e');
      rethrow;
    }
  }

  Future<dynamic> twspdfApi(String id) async {
    try {
      final url = "${AppUrl.twsPDF}/$id/pdf";
      print("[log] PDF Url => $url");
      SharedPreferences pref = await SharedPreferences.getInstance();
      var token = pref.getString("token");

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