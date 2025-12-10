

import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../WebServices/app_url.dart';
import '../../../../WebServices/network/network_api_services.dart';
import '../get_byid_model/QuotationGetByIdModel.dart';
import '../model/quotation_pdf_model.dart';
import 'package:http/http.dart' as http;

import '../subscription_pdf/subscription_pdf.dart';
class QuotationPdfRepository{

  final _apiService = NetworkApiServices();


  // Future<QuotationPdfModel> getQuotationData() async {
  //   try {
  //     final response = await _apiService.getApiWithToken(AppUrl.quotationdetails);
  //     print('response: $response');
  //
  //     if (response != null) {
  //       return QuotationPdfModel.fromJson(response);
  //     } else {
  //       throw Exception('Failed to load Cart data: response is null');
  //     }
  //   } catch (e) {
  //     print('Error fetching Cart data: $e');
  //     rethrow;
  //   }
  // }

  Future<QuotationPdfModel> getQuotationData({required int pageCount}) async {
    try {
      final response = await _apiService.getApiWithToken("${AppUrl.quotationdetails}?page=$pageCount&limit=10");
      print('response: $response');

      if (response != null) {
        return QuotationPdfModel.fromJson(response);
      } else {
        throw Exception('Failed to load Cart data: response is null');
      }
    } catch (e) {
      print('Error fetching Cart data: $e');
      rethrow;
    }
  }


//========================= subsription pdf ===============================================

  Future<SubscriptionPdf> suscriptionpdf() async {
    try {
      final response = await _apiService.getApiWithToken(AppUrl.subscriptionpdf);
      print('response: $response');

      if (response != null) {
        return SubscriptionPdf.fromJson(response);
      } else {
        throw Exception('Failed to load Cart data: response is null');
      }
    } catch (e) {
      print('Error fetching Cart data: $e');
      rethrow;
    }
  }

  //=============================================================================

  Future<QuotationPdfModel> deletequotationById(String id) async {
    try {
      final response = await _apiService.deleteApiWithToken(
          '${AppUrl.quotationdetails}/$id');

      print('response: $response');
      if (response != null) {
        return QuotationPdfModel.fromJson(response);
      } else {
        throw Exception('Failed to load Cart data: response is null');
      }
    } catch (e) {
      print('Error fetching Cart data: $e');
      rethrow;
    }
  }

  Future<QuotationPdfModel> getQuotationIdData(String id) async {
    try {
      final response = await _apiService.getApiWithToken('${AppUrl.quotationdetails}/$id');
      print('response: $response');

      if (response != null) {
        return QuotationPdfModel.fromJson(response);
      } else {
        throw Exception('Failed to load Cart data: response is null');
      }
    } catch (e) {
      print('Error fetching Cart data: $e');
      rethrow;
    }
  }
  Future<QuotationPdfModel> patchquotationByIdApi(String id, Map<String, dynamic> updateData) async {
    try {
      final response = await _apiService.patchApiWithToken(
        '${AppUrl.quotationdetails}/$id',
        updateData ,
      );

      print('PATCH Response: $response');
      if (response != null) {
        getQuotationData(pageCount:1);
        return QuotationPdfModel.fromJson(response);
      } else {
        throw Exception('Failed to update tws data data: response is null');
      }
    } catch (e) {
      print('Error patching tws  data: $e');
      rethrow;
    }
  }

  Future<QuotationGetDataByIdModel?> getquotationByIdApi(String id) async {
    try {
      final response = await _apiService.getApiWithToken(
        '${AppUrl.quotationdetails}/$id',

      );
      print('response: $response');

      if (response != null) {
        return QuotationGetDataByIdModel.fromJson(response);
      } else {
        throw Exception('Failed to load Cart data: response is null');
      }
    } catch (e) {
      print('Error fetching Cart data: $e');
      rethrow;
    }
  }


  // Future<dynamic> quotationpdfApi(var id) async {
  //   try {
  //     dynamic response =
  //     //await _apiService. patchApiWithToken(data, AppUrl.billdetails);
  //     await _apiService. getApiWithToken("${AppUrl.quotationPDF}/$id/pdf");
  //     return response;
  //   } catch (e) {
  //     throw e;
  //   }
  // }

  Future<dynamic> quotationpdfApi(String id) async {
    try {
      final url = "${AppUrl.quotationPDF}/$id/pdf";
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

  Future<dynamic> quotationSignature(String pdfId, String pdfType) async {
    try {
      final url = "${AppUrl.signature}";
      print("[log] Signature API Url => $url");

      SharedPreferences pref = await SharedPreferences.getInstance();
      var token = pref.getString("token");
      print("[log] token => $token");

      // Request body
      final body = jsonEncode({
        "pdfId": pdfId,
        "pdfType": pdfType,
      });

      // Send POST request
      final response = await http.post(
        Uri.parse(url),
        headers: {
          "Authorization": "Bearer $token",
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
        body: body,
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        if (data['success'] == true && data['link'] != null) {
          return data['link']; // ✅ Return signature link
        } else {
          throw Exception("API returned success=false or missing link");
        }
      } else {
        throw Exception("Failed to fetch signature. Status: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error fetching signature: $e");
    }
  }


}