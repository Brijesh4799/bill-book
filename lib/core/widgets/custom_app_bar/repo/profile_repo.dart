import '../../../../WebServices/app_url.dart';
import '../../../../WebServices/network/network_api_services.dart';

import '../model/profile_model.dart';



class ProfileDataRepository{
  final _apiService = NetworkApiServices();

  Future<GetProfileModel> getprofileApi() async {
    try {
      final response = await _apiService.getApiWithToken(AppUrl.getprofile);
      print('response: $response');

      if (response != null) {
        // Parse the response into ProductsModel
        return GetProfileModel.fromJson(response);
      } else {
        throw Exception('Failed to load Cart data: response is null');
      }
    } catch (e) {
      print('Error fetching Cart data: $e');
      rethrow;
    }
  }

}