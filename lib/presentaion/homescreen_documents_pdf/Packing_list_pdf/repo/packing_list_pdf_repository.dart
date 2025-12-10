import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../WebServices/app_url.dart';
import '../../../../WebServices/network/network_api_services.dart';
import '../get_by_id_model/packing_get_byid_model.dart';
import '../model/packing_list_pdf_model.dart';

class PackingListPdfRepository{
  final _apiService = NetworkApiServices();
  // Future<PackingListPdfModel> getpackinglistdataApi() async {
  //   try {
  //     final response = await _apiService.getApiWithToken(AppUrl.packinglist);
  //     print('response: $response');
  //
  //     if (response != null) {
  //       // Parse the response into ProductsModel
  //       return PackingListPdfModel.fromJson(response);
  //     } else {
  //       throw Exception('Failed to load Cart data: response is null');
  //     }
  //   } catch (e) {
  //     print('Error fetching Cart data: $e');
  //     rethrow;
  //   }
  // }






  Future<PackingListPdfModel> getpackinglistdataApi({required int pageCount}) async {
    try {
      final response = await _apiService.getApiWithToken("${AppUrl.packinglist}?page=$pageCount&limit=10");
      print('response: $response');

      if (response != null) {
        // Parse the response into ProductsModel
        return PackingListPdfModel.fromJson(response);
      } else {
        throw Exception('Failed to load Cart data: response is null');
      }
    } catch (e) {
      print('Error fetching Cart data: $e');
      rethrow;
    }
  }
  Future<PackingListPdfModel> deleteQuotationById(String id) async {
    try {
      //final response = await _apiService.deleteApiWithToken(AppUrl.surveylist/'$id');
      final response = await _apiService.deleteApiWithToken('${AppUrl.packinglist}/$id');

      print('response: $response');

      if (response != null) {
        // Parse the response into ProductsModel
        return PackingListPdfModel.fromJson(response);
      } else {
        throw Exception('Failed to load Cart data: response is null');
      }
    } catch (e) {
      print('Error fetching Cart data: $e');
      rethrow;
    }
  }

  Future<PackingListPdfModel> patchPackingByIdApi(String id, Map<String, dynamic> updateData) async {
    try {
      final response = await _apiService.patchApiWithToken(
        '${AppUrl.packinglist}/$id',
        updateData,
          //jsonEncode(updateData)
      );

      print('PATCH Response: $response');

      if (response != null) {
        getpackinglistdataApi(pageCount: 1);
        return PackingListPdfModel.fromJson(response);
      } else {
        throw Exception('Failed to update packing data: response is null');
      }
    } catch (e) {
      print('Error patching packing data: $e');
      rethrow;
    }
  }



  Future<PackingGetDataByIdModel?> getpackingByIdApi(String id) async {
    try {
      final response = await _apiService.getApiWithToken(
        '${AppUrl.packinglist}/$id',

      );
      print('response: $response');

      if (response != null) {
        return PackingGetDataByIdModel.fromJson(response);
      } else {
        throw Exception('Failed to load Cart data: response is null');
      }
    } catch (e) {
      print('Error fetching Cart data: $e');
      rethrow;
    }
  }


  Future<dynamic> packagepdfApi(String id) async {
    try {
      final url = "${AppUrl.packagePDF}/$id/pdf";
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