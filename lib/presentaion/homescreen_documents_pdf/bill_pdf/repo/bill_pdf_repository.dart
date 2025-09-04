import 'dart:convert';

import '../../../../WebServices/app_url.dart';
import '../../../../WebServices/network/network_api_services.dart';
import '../get_byid_model/bill_get_byId_model.dart';
import '../model/bill_pdf_model.dart';


class BillPdfRepository{
  final _apiService = NetworkApiServices();

  Future<BillPdfModel> getbilldatadataApi() async {
    try {
      final response = await _apiService.getApiWithToken(AppUrl.billdetails);
      print('response: $response');

      if (response != null) {
        // Parse the response into ProductsModel
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
      //final response = await _apiService.deleteApiWithToken(AppUrl.surveylist/'$id');
      final response = await _apiService.deleteApiWithToken('${AppUrl.billdetails}/$id');

      print('response: $response');

      if (response != null) {
        // Parse the response into ProductsModel
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
      final response = await _apiService.patchApiWithToken(
          '${AppUrl.billdetails}/$id',
          updateData ,
          //jsonEncode(updateData)
      );

      print('PATCH Response: $response');

      if (response != null) {
        getbilldatadataApi();
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
      final response = await _apiService.getApiWithToken(
        '${AppUrl.billdetails}/$id',

      );
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


}