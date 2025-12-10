

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../WebServices/app_url.dart';
import '../../../../WebServices/network/network_api_services.dart';
import '../get_by_id_model/fov_scf_get_byid_model.dart';
import '../model/fov_scf_form_pdf_model.dart';


class FocScfPdfRepository{
  final _apiService = NetworkApiServices();
  // Future<FocScfPdfModel> getfocscfdataApi() async {
  //   try {
  //     final response = await _apiService.getApiWithToken(AppUrl.fovScf);
  //     print('response: $response');
  //
  //     if (response != null) {
  //       // Parse the response into ProductsModel
  //       return FocScfPdfModel.fromJson(response);
  //     } else {
  //       throw Exception('Failed to load Cart data: response is null');
  //     }
  //   } catch (e) {
  //     print('Error fetching Cart data: $e');
  //     rethrow;
  //   }
  // }

  Future<FocScfPdfModel> getfocscfdataApi({required int pageCount}) async {
    try {
      final response = await _apiService.getApiWithToken("${AppUrl.fovScf}?page=$pageCount&limit=10");
      print('response: $response');

      if (response != null) {
        // Parse the response into ProductsModel
        return FocScfPdfModel.fromJson(response);
      } else {
        throw Exception('Failed to load Cart data: response is null');
      }
    } catch (e) {
      print('Error fetching Cart data: $e');
      rethrow;
    }
  }

  Future<FocScfPdfModel> deleteFocById(String id) async {
    try {
      //final response = await _apiService.deleteApiWithToken(AppUrl.surveylist/'$id');
      final response = await _apiService.deleteApiWithToken('${AppUrl.fovScf}/$id');

      print('response: $response');

      if (response != null) {
        // Parse the response into ProductsModel
        return FocScfPdfModel.fromJson(response);
      } else {
        throw Exception('Failed to load Cart data: response is null');
      }
    } catch (e) {
      print('Error fetching Cart data: $e');
      rethrow;
    }
  }


  Future<FocScfPdfModel> patchtwsByIdApi(String id, Map<String, dynamic> updateData) async {
    try {
      final response = await _apiService.patchApiWithToken(
          '${AppUrl.fovScf}/$id',
          updateData,
         // jsonEncode(updateData)
      );

      print('PATCH Response: $response');

      if (response != null) {
        getfocscfdataApi(pageCount:1);
        return FocScfPdfModel.fromJson(response);
      } else {
        throw Exception('Failed to update foc data data: response is null');
      }
    } catch (e) {
      print('Error patching foc  data: $e');
      rethrow;
    }
  }

  Future<FovScfGetDataModel?> getfocscfByIdApi(String id) async {
    try {
      final response = await _apiService.getApiWithToken(
        '${AppUrl.fovScf}/$id',

      );
      print('response: $response');

      if (response != null) {
        return FovScfGetDataModel.fromJson(response);
      } else {
        throw Exception('Failed to load Cart data: response is null');
      }
    } catch (e) {
      print('Error fetching Cart data: $e');
      rethrow;
    }
  }


  Future<dynamic> foccfpdfApi(String id) async {
    try {
      final url = "${AppUrl.fovscfPDF}/$id/pdf";
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