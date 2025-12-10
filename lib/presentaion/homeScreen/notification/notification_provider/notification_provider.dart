/*


import 'package:flutter/material.dart';
import '../notification_model/notification_Model.dart';
import '../notification_model/read_notification_model.dart';

import '../notification_repo/notifaication_repo.dart';

class NotificationProvider extends ChangeNotifier {
  final NotificationRepository _notificationRepository = NotificationRepository();

  NotificationModel? _notificationModel;
  ReadNotificationModel? _readNotificationModel;
  bool _isLoading = false;
  String? _errorMessage;

  NotificationModel? get notificationModel => _notificationModel;
  ReadNotificationModel? get readNotificationModel => _readNotificationModel;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  // Fetch notification data
  Future<void> fetchNotification() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await _notificationRepository.getnotificationApi();
      _notificationModel = response;
    } catch (e) {
      _errorMessage = 'Failed to load notifications';
      print('NotificationProvider error: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Mark notification as read
  Future<void> redNotification(String id) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await _notificationRepository.notificationred(id);
      _readNotificationModel = response;
      print('Updated notification data: ${_readNotificationModel?.data?.title}');
    } catch (e) {
      _errorMessage = 'Failed to mark as read';
      print('NotificationProvider error: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // ✅ Delete notification logic
  Future<bool> deleteNotification(String id) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await _notificationRepository.deletenotification(id);
      if (response.success == true) {
        // Optionally remove the deleted notification from the local list
        _notificationModel?.data?.removeWhere((item) => item.sId == id);
        notifyListeners();
        print('Notification deleted successfully: ${response.message}');
        return true;
      } else {
        _errorMessage = response.message ?? 'Failed to delete notification';
        print('Delete failed: ${_errorMessage}');
        return false;
      }
    } catch (e) {
      _errorMessage = 'Error deleting notification';
      print('NotificationProvider error: $e');
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
*/


import 'package:flutter/material.dart';
import '../notification_model/notification_Model.dart';
import '../notification_model/read_notification_model.dart';

import '../notification_repo/notifaication_repo.dart';

class NotificationProvider extends ChangeNotifier {
  final NotificationRepository _notificationRepository = NotificationRepository();

  NotificationModel? _notificationModel;
  ReadNotificationModel? _readNotificationModel;
  bool _isLoading = false;
  String? _errorMessage;

  NotificationModel? get notificationModel => _notificationModel;
  ReadNotificationModel? get readNotificationModel => _readNotificationModel;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  // Fetch notification data
  Future<void> fetchNotification() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await _notificationRepository.getnotificationApi();
      _notificationModel = response;
    } catch (e) {
      _errorMessage = 'Failed to load notifications';
      print('NotificationProvider error: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Mark notification as read
  Future<void> redNotification(String id) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await _notificationRepository.notificationred(id);
      _readNotificationModel = response;
      print('Updated notification data: ${_readNotificationModel?.data?.title}');
    } catch (e) {
      _errorMessage = 'Failed to mark as read';
      print('NotificationProvider error: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Delete notification
  Future<bool> deleteNotification(String id) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await _notificationRepository.deletenotification(id);
      if (response.success == true) {
        _notificationModel?.data?.removeWhere((item) => item.sId == id);
        notifyListeners();
        print('Notification deleted successfully: ${response.message}');
        return true;
      } else {
        _errorMessage = response.message ?? 'Failed to delete notification';
        print('Delete failed: ${_errorMessage}');
        return false;
      }
    } catch (e) {
      _errorMessage = 'Error deleting notification';
      print('NotificationProvider error: $e');
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
