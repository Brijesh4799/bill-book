import 'dart:convert';

import '../../../../WebServices/app_url.dart';
import '../../../../WebServices/network/network_api_services.dart';
import '../get_by_id_model/lr_bilty_getbyid_model.dart';
import '../model/lr_bilty_pdf_model.dart';

class LrBiltyRepository{
  final _apiService = NetworkApiServices();

  Future<LrBiltyPdfModel> getlrbiltydatadataApi() async {
    try {
      final response = await _apiService.getApiWithToken(AppUrl.lrbill);
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
        getlrbiltydatadataApi();
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


}