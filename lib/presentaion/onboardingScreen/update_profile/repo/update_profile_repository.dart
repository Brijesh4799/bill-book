import '../../../../WebServices/app_url.dart';
import '../../../../WebServices/network/network_api_services.dart';
import '../update_profile_model/update_profile_model.dart';

class UpdateProfileRepository{
  final _apiService = NetworkApiServices();

  /*Future<UpdateProfileModel?> updateprofileapi() async {
    try {
      dynamic response =
      await _apiService. patchApiWithToken( AppUrl.updateProfile );
      return UpdateProfileModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }*/
  Future<UpdateProfileModel?> updateprofileapi(Map<String, dynamic> data) async {
    try {
      // ✅ Pass both URL and data to patch API
      dynamic response =
      await _apiService.patchApiWithToken(AppUrl.updateProfile, data);

      return UpdateProfileModel.fromJson(response);
    } catch (e) {
      print("Error in updateProfileApi: $e");
      throw e;
    }
  }


}