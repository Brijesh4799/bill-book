import '../../../../WebServices/app_url.dart';
import '../../../../WebServices/network/network_api_services.dart';
import '../notification_model/delete_notififcation.dart';
import '../notification_model/notification_Model.dart';
import '../notification_model/read_notification_model.dart';

class NotificationRepository{
  final _apiService = NetworkApiServices();
  Future<NotificationModel> getnotificationApi() async {
    try {
      final response = await _apiService.getApiWithToken(AppUrl.notification);
      print('response: $response');

      if (response != null) {
        // Parse the response into ProductsModel
        return NotificationModel.fromJson(response);
      } else {
        throw Exception('Notification');
      }
    } catch (e) {
      print('Error fetching Notification data: $e');
      rethrow;
    }
  }



  Future<ReadNotificationModel> notificationred(String id) async {
    try {
      final response = await _apiService.patchApiWithToken('${AppUrl.notificationred}/$id', {});
      print('Notification read response: $response'); // Debugging log

      if (response != null && response.isNotEmpty) {
        return ReadNotificationModel.fromJson(response);
      } else {
        throw Exception('Empty or invalid response');
      }
    } catch (e) {
      print('Error fetching Notification data: $e');
      rethrow;
    }
  }

  Future<NotificationDeleteModel> deletenotification(String id) async {
    try {
      //final response = await _apiService.deleteApiWithToken(AppUrl.surveylist/'$id');
      final response = await _apiService.deleteApiWithToken('${AppUrl.deletenotificaton}/$id');

      print('response: $response');

      if (response != null) {
        // Parse the response into ProductsModel
        return NotificationDeleteModel.fromJson(response);
      } else {
        throw Exception('Failed to load Cart data: response is null');
      }
    } catch (e) {
      print('Error fetching Cart data: $e');
      rethrow;
    }
  }

}