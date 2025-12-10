import '../../../../WebServices/app_url.dart';
import '../../../../WebServices/network/network_api_services.dart';
import '../model/bill_terms_model.dart';
import '../model/quotation_tearms_condition.dart';

class QuotationTearmsConditionRepo {
  final _apiService = NetworkApiServices();

  Future<QuotationTearmsAndConditionModel> gettearmsApi() async {
    try {
      final response = await _apiService.getApiWithToken(AppUrl.cmsquotation);
      print('response: $response');

      if (response != null) {
        // Parse the response into ProductsModel
        return QuotationTearmsAndConditionModel.fromJson(response);
      } else {
        throw Exception('Failed to load Cart data: response is null');
      }
    } catch (e) {
      print('Error fetching Cart data: $e');
      rethrow;
    }
  }

  Future<BillTearmsAndConditionModel> gettearmsbillApi() async {
    try {
      final response = await _apiService.getApiWithToken(AppUrl.cmsbill);
      print('response: $response');

      if (response != null) {
        // Parse the response into ProductsModel
        return BillTearmsAndConditionModel.fromJson(response);
      } else {
        throw Exception('Failed to load Cart data: response is null');
      }
    } catch (e) {
      print('Error fetching Cart data: $e');
      rethrow;
    }
  }
 /* Future<BillTearmsAndConditionModel> gettearmsbillApi() async {
    try {
      final response = await _apiService.getApiWithToken(AppUrl.cmsbill);
      print('response: $response');

      if (response != null && response is Map<String, dynamic>) {
        return BillTearmsAndConditionModel.fromJson(response);
      } else {
        throw Exception('Invalid response format');
      }
    } catch (e) {
      print('Error fetching bill terms: $e');
      rethrow;
    }
  }*/


}