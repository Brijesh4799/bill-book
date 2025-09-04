import 'dart:convert';

import '../../../../WebServices/app_url.dart';
import '../../../../WebServices/network/network_api_services.dart';
import '../get_by_id_model/packing_get_byid_model.dart';
import '../model/packing_list_pdf_model.dart';

class PackingListPdfRepository{
  final _apiService = NetworkApiServices();
  Future<PackingListPdfModel> getpackinglistdataApi() async {
    try {
      final response = await _apiService.getApiWithToken(AppUrl.packinglist);
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
        getpackinglistdataApi();
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

}