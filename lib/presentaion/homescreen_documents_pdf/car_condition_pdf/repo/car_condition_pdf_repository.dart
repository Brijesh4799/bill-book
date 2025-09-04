

import 'dart:convert';

import '../../../../WebServices/app_url.dart';
import '../../../../WebServices/network/network_api_services.dart';
import '../get_by_id_model/car_condition_get_by_id.dart';
import '../model/car_condition_pdf_model.dart';


class CarConditionPdfRepository{
  final _apiService = NetworkApiServices();
  Future<CarConditionPdfModel> getcarconditiondataApi() async {
    try {
      final response = await _apiService.getApiWithToken(AppUrl.carcondition);
      print('response: $response');

      if (response != null) {
        // Parse the response into ProductsModel
        return CarConditionPdfModel.fromJson(response);
      } else {
        throw Exception('Failed to load Cart data: response is null');
      }
    } catch (e) {
      print('Error fetching Cart data: $e');
      rethrow;
    }
  }
  Future<CarConditionPdfModel> deleteCarConditionById(String id) async {
    try {
      //final response = await _apiService.deleteApiWithToken(AppUrl.surveylist/'$id');
      final response = await _apiService.deleteApiWithToken('${AppUrl.carcondition}/$id');

      print('response: $response');

      if (response != null) {
        // Parse the response into ProductsModel
        return CarConditionPdfModel.fromJson(response);
      } else {
        throw Exception('Failed to load Cart data: response is null');
      }
    } catch (e) {
      print('Error fetching Cart data: $e');
      rethrow;
    }
  }


  Future<CarConditionPdfModel> patchcarByIdApi(String id, Map<String, dynamic> updateData) async {
    try {
      final response = await _apiService.patchApiWithToken(
          '${AppUrl.carcondition}/$id',
          updateData ,
         // jsonEncode(updateData)
      );

      print('PATCH Response: $response');

      if (response != null) {
        getcarconditiondataApi();
        return CarConditionPdfModel.fromJson(response);
      } else {
        throw Exception('Failed to update Bill data data: response is null');
      }
    } catch (e) {
      print('Error patching bill  data: $e');
      rethrow;
    }
  }

  Future<CarConditionGetDataModel?> getcarconditionByIdApi(String id) async {
    try {
      final response = await _apiService.getApiWithToken(
        '${AppUrl.carcondition}/$id',

      );
      print('response: $response');

      if (response != null) {
        return CarConditionGetDataModel.fromJson(response);
      } else {
        throw Exception('Failed to load Cart data: response is null');
      }
    } catch (e) {
      print('Error fetching Cart data: $e');
      rethrow;
    }
  }


}