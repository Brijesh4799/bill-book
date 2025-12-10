import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../WebServices/app_url.dart';
import '../../../../WebServices/network/network_api_services.dart';
import '../get_by_id_model/lr_bilty_getbyid_model.dart';
import '../model/lr_bilty_pdf_model.dart';

class LrBiltyRepository{
  final _apiService = NetworkApiServices();

  // Future<LrBiltyPdfModel> getlrbiltydatadataApi() async {
  //   try {
  //     final response = await _apiService.getApiWithToken(AppUrl.lrbill);
  //     print('response: $response');
  //
  //     if (response != null) {
  //       // Parse the response into ProductsModel
  //       return LrBiltyPdfModel.fromJson(response);
  //     } else {
  //       throw Exception('Failed to load Cart data: response is null');
  //     }
  //   } catch (e) {
  //     print('Error fetching Cart data: $e');
  //     rethrow;
  //   }
  // }

  Future<LrBiltyPdfModel> getlrbiltydatadataApi({required int pageCount}) async {
    try {
      final response = await _apiService.getApiWithToken("${AppUrl.lrbill}?page=$pageCount&limit=10");
      print('response: $response');

      if (response != null) {
        // Parse the response into ProductsModel
        return LrBiltyPdfModel.fromJson(response);
      } else {
        throw Exception('Failed to load Cart data: response is null');
      }
    } catch (e) {
      print('Error fetching Cart data: $e');
      rethrow;
    }
  }

  Future<LrBiltyPdfModel> deletelrbiltyById(String id) async {
    try {
      final response = await _apiService.deleteApiWithToken('${AppUrl.lrbill}/$id');

      print('response: $response');

      if (response != null) {
        // Parse the response into ProductsModel
        return LrBiltyPdfModel.fromJson(response);
      } else {
        throw Exception('Failed to load Cart data: response is null');
      }
    } catch (e) {
      print('Error fetching Cart data: $e');
      rethrow;
    }
  }

  Future<LrBiltyPdfModel> patchLrBiltyByIdApi(String id, Map<String, dynamic> updateData) async {
    try {
      final response = await _apiService.patchApiWithToken(
          '${AppUrl.lrbill}/$id',
          updateData,
          //jsonEncode(updateData)
      );

      print('PATCH Response: $response');

      if (response != null) {
        getlrbiltydatadataApi(pageCount:1);
        return LrBiltyPdfModel.fromJson(response);
      } else {
        throw Exception('Failed to update packing data: response is null');
      }
    } catch (e) {
      print('Error patching packing data: $e');
      rethrow;
    }
  }

  Future<LrBiltyGetDataByIdModel?> getlrbiltyByIdApi(String id) async {
    try {
      final response = await _apiService.getApiWithToken(
        '${AppUrl.lrbill}/$id',

      );
      print('response: $response');

      if (response != null) {
        return LrBiltyGetDataByIdModel.fromJson(response);
      } else {
        throw Exception('Failed to load Cart data: response is null');
      }
    } catch (e) {
      print('Error fetching Cart data: $e');
      rethrow;
    }
  }



  Future<dynamic> lrbiltypdfApi(String id) async {
    try {
      final url = "${AppUrl.lrbiltyPDF}/$id/pdf";
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