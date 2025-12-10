

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../WebServices/app_url.dart';
import '../../../../WebServices/network/network_api_services.dart';
import '../get_by_id_model/noc_get_byid_model.dart';
import '../model/noc_letter_pdf_model.dart';

class NocLetterPdfRepository{
  final _apiService = NetworkApiServices();
  // Future<NocLetterPdfModel> getnocletterdataApi() async {
  //   try {
  //     final response = await _apiService.getApiWithToken(AppUrl.noc);
  //     print('response: $response');
  //
  //     if (response != null) {
  //       // Parse the response into ProductsModel
  //       return NocLetterPdfModel.fromJson(response);
  //     } else {
  //       throw Exception('Failed to load Cart data: response is null');
  //     }
  //   } catch (e) {
  //     print('Error fetching Cart data: $e');
  //     rethrow;
  //   }
  // }

  Future<NocLetterPdfModel> getnocletterdataApi({required int pageCount}) async {
    try {
      final response = await _apiService.getApiWithToken("${AppUrl.noc}?page=$pageCount&limit=10");
      print('response: $response');

      if (response != null) {
        // Parse the response into ProductsModel
        return NocLetterPdfModel.fromJson(response);
      } else {
        throw Exception('Failed to load Cart data: response is null');
      }
    } catch (e) {
      print('Error fetching Cart data: $e');
      rethrow;
    }
  }

  Future<NocLetterPdfModel> deleteNocById(String id) async {
    try {
      //final response = await _apiService.deleteApiWithToken(AppUrl.surveylist/'$id');
      final response = await _apiService.deleteApiWithToken('${AppUrl.noc}/$id');

      print('response: $response');

      if (response != null) {
        // Parse the response into ProductsModel
        return NocLetterPdfModel.fromJson(response);
      } else {
        throw Exception('Failed to load Cart data: response is null');
      }
    } catch (e) {
      print('Error fetching Cart data: $e');
      rethrow;
    }
  }
  Future<NocLetterPdfModel> patchtwsByIdApi(String id, Map<String, dynamic> updateData) async {
    try {
      final response = await _apiService.patchApiWithToken(
          '${AppUrl.noc}/$id',
          updateData ,
         // jsonEncode(updateData)
      );

      print('PATCH Response: $response');

      if (response != null) {
        getnocletterdataApi(pageCount:1);
        return NocLetterPdfModel.fromJson(response);
      } else {
        throw Exception('Failed to update noc data data: response is null');
      }
    } catch (e) {
      print('Error patching noc  data: $e');
      rethrow;
    }
  }

  Future<NocGetDataModel?> getnocByIdApi(String id) async {
    try {
      final response = await _apiService.getApiWithToken(
        '${AppUrl.noc}/$id',

      );
      print('response: $response');

      if (response != null) {
        return NocGetDataModel.fromJson(response);
      } else {
        throw Exception('Failed to load Cart data: response is null');
      }
    } catch (e) {
      print('Error fetching Cart data: $e');
      rethrow;
    }
  }


  Future<dynamic> nocpdfApi(String id) async {
    try {
      final url = "${AppUrl.nocPDF}/$id/pdf";
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