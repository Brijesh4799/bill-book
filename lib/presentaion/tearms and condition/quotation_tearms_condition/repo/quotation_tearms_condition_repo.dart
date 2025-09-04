import '../../../../WebServices/app_url.dart';
import '../../../../WebServices/network/network_api_services.dart';
import '../model/quotation_tearms_condition.dart';

class QuotationTearmsConditionRepo {
  final _apiService = NetworkApiServices();

  Future<QuotationTearmsAndConditionModel> gettearmsApi() async {
    try {
      final response = await _apiService.getApiWithToken(AppUrl.cms);
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
}