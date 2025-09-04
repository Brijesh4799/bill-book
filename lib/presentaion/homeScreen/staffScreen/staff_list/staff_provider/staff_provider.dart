/*
import 'package:flutter/material.dart';
import '../staff_list_model/staff_list_model.dart';
import '../staff_repo/staff_repo.dart';

class StaffListProvider with ChangeNotifier {
  final StaffListRepository _repository = StaffListRepository();

  bool _loading = false;
  StafeListModel? _staffList;

  bool get loading => _loading;
  StafeListModel? get staffList => _staffList;

  Future<void> fetchStaffList() async {
    _loading = true;
    notifyListeners();

    try {
      _staffList = await _repository.businessapi({});
    } catch (e) {
      print("Error fetching staff list: $e");
    }

    _loading = false;
    notifyListeners();
  }
}
*/


import 'package:flutter/material.dart';
import '../staff_list_model/staff_list_model.dart';
import '../staff_repo/staff_repo.dart';
import '../staff_data_post_model/staff_data_post_model.dart';

class StaffListProvider with ChangeNotifier {
  final StaffListRepository _repository = StaffListRepository();

  bool _loading = false;
  StafeListModel? _staffList;
  StaffListPostModel? _postResponse;

  bool get loading => _loading;
  StafeListModel? get staffList => _staffList;
  StaffListPostModel? get postResponse => _postResponse;

  /// Fetch the staff list (GET API)
  Future<void> fetchStaffList() async {
    _loading = true;
    notifyListeners();

    try {
      _staffList = await _repository.businessapi({});
    } catch (e) {
      print("Error fetching staff list: $e");
    }

    _loading = false;
    notifyListeners();
  }

  /// Add new staff (POST API)
  Future<void> addNewStaff(Map<String, dynamic> data) async {
    _loading = true;
    notifyListeners();

    try {
      _postResponse = await _repository.Poststaff(data);

      // Optionally refresh the staff list after adding
      await fetchStaffList();
    } catch (e) {
      print("Error adding new staff: $e");
    }

    _loading = false;
    notifyListeners();
  }
}
