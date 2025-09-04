import 'dart:convert';

import '../../../../WebServices/app_url.dart';
import '../../../../WebServices/network/network_api_services.dart';

import '../get_by_id_model/tws_get_byid_model.dart';
import '../model/tws_pdf_model.dart';

class TWSPdfRepository{
  final _apiService = NetworkApiServices();
  Future<TwsPdfModel> gettwslistdataApi() async {
    try {
      final response = await _apiService.getApiWithToken(AppUrl.twsform);
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
        gettwslistdataApi();
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

}