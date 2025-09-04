

import 'dart:convert';

import '../../../../WebServices/app_url.dart';
import '../../../../WebServices/network/network_api_services.dart';
import '../get_by_id_model/money_get_by_id_model.dart';
import '../model/money_receipt_pdf_model.dart';
import '../money_recvide_edit_model/money_recvied_edit_model.dart';

class MoneyReceiptPdfRepository{
  final _apiService = NetworkApiServices();
  Future<MoneyReceiptPdf_Model> getpackinglistdataApi() async {
    try {
      final response = await _apiService.getApiWithToken(AppUrl.moneyreceipt);
      print('response: $response');

      if (response != null) {
        // Parse the response into ProductsModel
        return MoneyReceiptPdf_Model.fromJson(response);
      } else {
        throw Exception('Failed to load Cart data: response is null');
      }
    } catch (e) {
      print('Error fetching Cart data: $e');
      rethrow;
    }
  }
  Future<MoneyReceiptPdf_Model> deleteMoneyById(String id) async {
    try {
      //final response = await _apiService.deleteApiWithToken(AppUrl.surveylist/'$id');
      final response = await _apiService.deleteApiWithToken('${AppUrl.moneyreceipt}/$id');

      print('response: $response');

      if (response != null) {
        // Parse the response into ProductsModel
        return MoneyReceiptPdf_Model.fromJson(response);
      } else {
        throw Exception('Failed to load Cart data: response is null');
      }
    } catch (e) {
      print('Error fetching Cart data: $e');
      rethrow;
    }
  }

  Future<MoneyRecvideEditModel> patchbillByIdApi(String id, Map<String, dynamic> updateData) async {
    try {
      final response = await _apiService.patchApiWithToken(
          '${AppUrl.moneyreceipt}/$id',
          updateData,
         // jsonEncode(updateData)
      );
print('apicall>>>>>>>>>>>>>>>>>>>>>1');
      print('PATCH Response: $response');

      if (response != null) {
        getpackinglistdataApi();
        print('objectghrRHR>>>>>>>>>>>>>>>>');
        return MoneyRecvideEditModel.fromJson(response);

      } else {
        throw Exception('Failed to update Money data data: response is null');
      }
    } catch (e) {
      print('apicall>>>>>>>>>>>>>>>>>>>>>2');
      print('Error patching money  data: $e');
      rethrow;
    }
  }
  /*Future<MoneyRecvideEditModel> patchbillByIdApi(String id, Map<String, dynamic> updateData) async {
    try {
      final response = await _apiService.patchApiWithToken(
        '${AppUrl.moneyreceipt}/$id',
        updateData,
      );

      print('PATCH Response: $response');

      if (response != null) {
        return MoneyRecvideEditModel.fromJson(response);
      } else {
        throw Exception('Failed to update Money data: response is null');
      }
    } catch (e) {
      print('Error patching money data: $e');
      rethrow;
    }
  }*/


  Future<MoneyGetDataModel?> getmoneyByIdApi(String id) async {
    try {
      final response = await _apiService.getApiWithToken(
        '${AppUrl.moneyreceipt}/$id',

      );
      print('response: $response');

      if (response != null) {
        return MoneyGetDataModel.fromJson(response);
      } else {
        throw Exception('Failed to load Cart data: response is null');
      }
    } catch (e) {
      print('Error fetching Cart data: $e');
      rethrow;
    }
  }

}