

import 'dart:convert';

import '../../../../WebServices/app_url.dart';
import '../../../../WebServices/network/network_api_services.dart';
import '../get_by_id_model/fov_scf_get_byid_model.dart';
import '../model/fov_scf_form_pdf_model.dart';


class FocScfPdfRepository{
  final _apiService = NetworkApiServices();
  Future<FocScfPdfModel> getfocscfdataApi() async {
    try {
      final response = await _apiService.getApiWithToken(AppUrl.fovScf);
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
        getfocscfdataApi();
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


}