import 'dart:convert';

import '../../../../WebServices/app_url.dart';
import '../../../../WebServices/network/network_api_services.dart';
import '../get_by-id_model/payment_get_by_id_model.dart';
import '../model/payment_voucher_pdf_model.dart';


class PaymentPdfRepository{

  final _apiService = NetworkApiServices();
  Future<PaymentVoucherPdfModel> getPaymentData() async {
    try {
      final response = await _apiService.getApiWithToken(AppUrl.paymentvoucher);
      print('response: $response');

      if (response != null) {
        // Parse the response into ProductsModel
        return PaymentVoucherPdfModel.fromJson(response);
      } else {
        throw Exception('Failed to load Cart data: response is null');
      }
    } catch (e) {
      print('Error fetching Cart data: $e');
      rethrow;
    }
  }
  Future<PaymentVoucherPdfModel> deletePaymentById(String id) async {
    try {
      //final response = await _apiService.deleteApiWithToken(AppUrl.surveylist/'$id');
      final response = await _apiService.deleteApiWithToken('${AppUrl.paymentvoucher}/$id');

      print('response: $response');

      if (response != null) {
        // Parse the response into ProductsModel
        return PaymentVoucherPdfModel.fromJson(response);
      } else {
        throw Exception('Failed to load Cart data: response is null');
      }
    } catch (e) {
      print('Error fetching Cart data: $e');
      rethrow;
    }
  }


  Future<PaymentVoucherPdfModel> patchpaymentByIdApi(String id, Map<String, dynamic> updateData) async {
    try {
      final response = await _apiService.patchApiWithToken(
          '${AppUrl.paymentvoucher}/$id',
          updateData,
          //jsonEncode(updateData)
      );

      print('PATCH Response: $response');

      if (response != null) {
        getPaymentData();
        return PaymentVoucherPdfModel.fromJson(response);
      } else {
        throw Exception('Failed to update Bill data data: response is null');
      }
    } catch (e) {
      print('Error patching bill  data: $e');
      rethrow;
    }
  }

  Future<PaymentGetDataModel?> getpaymentByIdApi(String id) async {
    try {
      final response = await _apiService.getApiWithToken(
        '${AppUrl.paymentvoucher}/$id',

      );
      print('response: $response');

      if (response != null) {
        return PaymentGetDataModel.fromJson(response);
      } else {
        throw Exception('Failed to load Cart data: response is null');
      }
    } catch (e) {
      print('Error fetching Cart data: $e');
      rethrow;
    }
  }



}