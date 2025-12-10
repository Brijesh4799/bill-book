import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../WebServices/app_url.dart';
import '../../../../WebServices/network/network_api_services.dart';
import '../get_by-id_model/payment_get_by_id_model.dart';
import '../model/payment_voucher_pdf_model.dart';


class PaymentPdfRepository{

  final _apiService = NetworkApiServices();
  // Future<PaymentVoucherPdfModel> getPaymentData() async {
  //   try {
  //     final response = await _apiService.getApiWithToken(AppUrl.paymentvoucher);
  //     print('response: $response');
  //
  //     if (response != null) {
  //       // Parse the response into ProductsModel
  //       return PaymentVoucherPdfModel.fromJson(response);
  //     } else {
  //       throw Exception('Failed to load Cart data: response is null');
  //     }
  //   } catch (e) {
  //     print('Error fetching Cart data: $e');
  //     rethrow;
  //   }
  // }

  Future<PaymentVoucherPdfModel> getPaymentData({required int pageCount}) async {
    try {
      final response = await _apiService.getApiWithToken("${AppUrl.paymentvoucher}?page=$pageCount&limit=10");
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
        getPaymentData(pageCount:1);
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

  Future<dynamic> paymentpdfApi(String id) async {
    try {
      final url = "${AppUrl.paymentPDF}/$id/pdf";
      print("[log] PDF Url => $url");
      SharedPreferences pref = await SharedPreferences.getInstance();
      var token = pref.getString("token");

      //final token = await _apiService.getToken(); // implement getToken() in your service
      print("[log] token => $token");

      final response = await http.get(
        Uri.parse(url),
        headers: {
          "Authorization": "Bearer $token",
          "Accept": "application/pdf",
        },
      );

      if (response.statusCode == 200) {
        return response.bodyBytes; // ✅ raw PDF bytes
      } else {
        throw Exception("Failed to load PDF. Status: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error fetching PDF: $e");
    }
  }

}