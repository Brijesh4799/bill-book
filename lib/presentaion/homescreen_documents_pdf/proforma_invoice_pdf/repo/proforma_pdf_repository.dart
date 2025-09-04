import 'dart:convert';

import '../../../../WebServices/app_url.dart';
import '../../../../WebServices/network/network_api_services.dart';
import '../get_byid_model/proforma_getbyid_model.dart';
import '../model/proforma_pdf_model.dart';

class ProformaPdfRepository{

  final _apiService = NetworkApiServices();
  Future<PeoformaPdfModel> getProformaData() async {
    try {
      final response = await _apiService.getApiWithToken(AppUrl.proformainvoice);
      print('response: $response');

      if (response != null) {
        // Parse the response into ProductsModel
        return PeoformaPdfModel.fromJson(response);
      } else {
        throw Exception('Failed to load Cart data: response is null');
      }
    } catch (e) {
      print('Error fetching Cart data: $e');
      rethrow;
    }
  }
  Future<PeoformaPdfModel> deleteproformaById(String id) async {
    try {
      //final response = await _apiService.deleteApiWithToken(AppUrl.surveylist/'$id');
      final response = await _apiService.deleteApiWithToken('${AppUrl.proformainvoice}/$id');

      print('response: $response');

      if (response != null) {
        // Parse the response into ProductsModel
        return PeoformaPdfModel.fromJson(response);
      } else {
        throw Exception('Failed to load Cart data: response is null');
      }
    } catch (e) {
      print('Error fetching Cart data: $e');
      rethrow;
    }
  }

  Future<PeoformaPdfModel> patchproformaByIdApi(String id, Map<String, dynamic> updateData) async {
    try {
      final response = await _apiService.patchApiWithToken(
          '${AppUrl.proformainvoice}/$id',
          updateData ,
          //jsonEncode(updateData)
      );

      print('PATCH Response: $response');

      if (response != null) {
        getProformaData();
        return PeoformaPdfModel.fromJson(response);
      } else {
        throw Exception('Failed to update packing data: response is null');
      }
    } catch (e) {
      print('Error patching packing data: $e');
      rethrow;
    }
  }

  Future<ProformaGetDataByIdModel?> getproformaByIdApi(String id) async {
    try {
      print('api response1>>>>>>>>>>>>>');
      final response = await _apiService.getApiWithToken(
        '${AppUrl.proformainvoice}/$id',

      );
      print('response: $response');
      print('api response2>>>>>>>>>>>>>>>>>>>>>>');

      if (response != null) {
        return ProformaGetDataByIdModel.fromJson(response);
      } else {
        throw Exception('Failed to load Cart data: response is null');
      }
    } catch (e) {
      print('Error fetching Cart data: $e');
      rethrow;
    }
  }

}