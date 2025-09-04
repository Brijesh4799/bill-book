import '../../../../WebServices/app_url.dart';
import '../../../../WebServices/network/network_api_services.dart';
import '../model/home_page_model.dart';


class HomePageRepogistory{
  final _apiService = NetworkApiServices();

  Future<HomePageModel> gethomepageApi() async {
    try {
      final response = await _apiService.getApiWithToken(AppUrl.homepage);
      print('response: $response');

      if (response != null) {
        // Parse the response into ProductsModel
        return HomePageModel.fromJson(response);
      } else {
        throw Exception('Failed to load Cart data: response is null');
      }
    } catch (e) {
      print('Error fetching Cart data: $e');
      rethrow;
    }
  }
}
