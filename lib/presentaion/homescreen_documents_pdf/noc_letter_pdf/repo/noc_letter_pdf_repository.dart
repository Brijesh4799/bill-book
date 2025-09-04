

import 'dart:convert';

import '../../../../WebServices/app_url.dart';
import '../../../../WebServices/network/network_api_services.dart';
import '../get_by_id_model/noc_get_byid_model.dart';
import '../model/noc_letter_pdf_model.dart';

class NocLetterPdfRepository{
  final _apiService = NetworkApiServices();
  Future<NocLetterPdfModel> getnocletterdataApi() async {
    try {
      final response = await _apiService.getApiWithToken(AppUrl.noc);
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
        getnocletterdataApi();
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


}