import '../../../../WebServices/app_url.dart';
import '../../../../WebServices/network/network_api_services.dart';
import '../get_byid_model/QuotationGetByIdModel.dart';
import '../model/quotation_pdf_model.dart';
class QuotationPdfRepository{

  final _apiService = NetworkApiServices();
  Future<QuotationPdfModel> getQuotationData() async {
    try {
      final response = await _apiService.getApiWithToken(AppUrl.quotationdetails);
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
        getQuotationData();
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



}