import '../../../../WebServices/app_url.dart';
import '../../../../WebServices/network/network_api_services.dart';
import '../model/user_update_input.dart';

class UserProfileInput{
final _apiService = NetworkApiServices();

Future<UserUpdateInput?> userUpdateApi(Map<String, dynamic> data) async {
  try {
    final response = await _apiService.patchApiWithToken(
      AppUrl.updateProfile, // ✅ should be update endpoint, not getprofile
      data,
    );
    return UserUpdateInput.fromJson(response);
  } catch (e) {
    print('Error updating profile: $e');
    rethrow;
  }
}

/*
Future<UserUpdateInput?> userupdateapi() async {
  try {
    dynamic response =
    await _apiService. patchApiWithToken(AppUrl.getprofile );
    //await _apiService. postApiWithToken(data, AppUrl.billdetails);
    return UserUpdateInput.fromJson(response);
  } catch (e) {
    throw e;
  }
}
*/

Future<UserUpdateInput> getuserprofilegetApi() async {
  try {
    final response = await _apiService.getApiWithToken(AppUrl.getprofile);
    print('response: $response');

    if (response != null) {
      // Parse the response into ProductsModel
      return UserUpdateInput.fromJson(response);
    } else {
      throw Exception('Failed to load Cart data: response is null');
    }
  } catch (e) {
    print('Error fetching Cart data: $e');
    rethrow;
  }
}

}