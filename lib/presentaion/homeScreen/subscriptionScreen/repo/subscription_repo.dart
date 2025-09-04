import '../../../../WebServices/app_url.dart';
import '../../../../WebServices/network/network_api_services.dart';
import '../model/subscription_model.dart';
import '../model/subscription_post_data_model.dart';

class SubscriptionRepository {
  final _apiService = NetworkApiServices();

  Future<SubscriptionModel> getsubscriptionApi() async {
    try {
      final response = await _apiService.getApiWithToken(
          AppUrl.subscriptiondata);
      print('response: $response');

      if (response != null) {
        // Parse the response into ProductsModel
        return SubscriptionModel.fromJson(response);
      } else {
        throw Exception('Failed to load Cart data: response is null');
      }
    } catch (e) {
      print('Error fetching Cart data: $e');
      rethrow;
    }
  }

  Future<SubscriptionPostModel?> postsubscription(var data) async {
    try {
      dynamic response =
      await _apiService. postApiWithToken(data, AppUrl.subscriptionpost);
      return SubscriptionPostModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }

}