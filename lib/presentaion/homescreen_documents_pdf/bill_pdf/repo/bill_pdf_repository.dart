import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../WebServices/app_url.dart';
import '../../../../WebServices/network/network_api_services.dart';
import '../get_byid_model/bill_get_byId_model.dart';
import '../model/bill_pdf_model.dart';


class BillPdfRepository{
  final _apiService = NetworkApiServices();

  // Future<BillPdfModel> getbilldatadataApi() async {
  //   try {
  //     final response = await _apiService.getApiWithToken(AppUrl.billdetails);
  //     print('response: $response');
  //     if (response != null) {
  //       return BillPdfModel.fromJson(response);
  //     } else {
  //       throw Exception('Failed to load Cart data: response is null');
  //     }
  //   } catch (e) {
  //     print('Error fetching Cart data: $e');
  //     rethrow;
  //   }
  // }

  Future<BillPdfModel> getbilldatadataApi({required int pageCount}) async {
    try {
      final response = await _apiService.getApiWithToken("${AppUrl.billdetails}?page=$pageCount&limit=10");
      print('response: $response');
      if (response != null) {
        return BillPdfModel.fromJson(response);
      } else {
        throw Exception('Failed to load Cart data: response is null');
      }
    } catch (e) {
      print('Error fetching Cart data: $e');
      rethrow;
    }
  }

  Future<BillPdfModel> deleteBillById(String id) async {
    try {
      final response = await _apiService.deleteApiWithToken('${AppUrl.billdetails}/$id');
      print('response: $response');
      if (response != null) {
        return BillPdfModel.fromJson(response);
      } else {
        throw Exception('Failed to load Cart data: response is null');
      }
    } catch (e) {
      print('Error fetching Cart data: $e');
      rethrow;
    }
  }

  Future<BillPdfModel> patchbillByIdApi(String id, Map<String, dynamic> updateData) async {
    try {
      final response = await _apiService.patchApiWithToken('${AppUrl.billdetails}/$id', updateData ,);
      print('PATCH Response: $response');
      if (response != null) {
        getbilldatadataApi(pageCount:1);
        return BillPdfModel.fromJson(response);
      } else {
        throw Exception('Failed to update Bill data data: response is null');
      }
    } catch (e) {
      print('Error patching bill  data: $e');
      rethrow;
    }
  }

  Future<BillGetDataByIdModel?> getbillByIdApi(String id) async {
    try {
      final response = await _apiService.getApiWithToken('${AppUrl.billdetails}/$id',);
      print('response: $response');
      if (response != null) {
        return BillGetDataByIdModel.fromJson(response);
      } else {
        throw Exception('Failed to load Cart data: response is null');
      }
    } catch (e) {
      print('Error fetching Cart data: $e');
      rethrow;
    }
  }

  Future<dynamic> billpdfApi(String id) async {
    try {
      final url = "${AppUrl.billPDF}/$id/pdf";
      print("[log] PDF Url => $url");
      SharedPreferences pref = await SharedPreferences.getInstance();
      var token = pref.getString("token");
      print("[log] token => $token");
      final response = await http.get(Uri.parse(url), headers: {
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