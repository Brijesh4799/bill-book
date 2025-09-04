/*

import 'package:flutter/cupertino.dart';
import '../../../../core/widgets/custom_additeam_list/ui/custom_AddItem_list.dart';
import '../get_by_id_model/packing_get_byid_model.dart';
import '../model/packing_list_pdf_model.dart' hide Data, ItemParticulars;
import '../repo/packing_list_pdf_repository.dart';

class PackingListPdfProvider with ChangeNotifier {
  // --- Controllers
  final TextEditingController nameController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController packingNoController = TextEditingController();
  final TextEditingController moveFromController = TextEditingController();
  final TextEditingController moveToController = TextEditingController();
  final TextEditingController vehicalNoController = TextEditingController();
  final TextEditingController itemNameController = TextEditingController();
  final TextEditingController itemBoxNumberController = TextEditingController();
  final TextEditingController itemQuantityController = TextEditingController();
  final TextEditingController itemValueController = TextEditingController();
  final TextEditingController itemCFTController = TextEditingController();
  final TextEditingController itemRemarkController = TextEditingController();

  // Lists of controllers for multiple items
  List<TextEditingController> itemNameControllers = [];
  List<TextEditingController> itemBoxNumberControllers = [];
  List<TextEditingController> itemQuantityControllers = [];
  List<TextEditingController> itemValueControllers = [];
  List<TextEditingController> itemCFTControllers = [];
  List<TextEditingController> itemRemarkControllers = [];

  List<ListItem> particularItemsDetails = [];

  // --- Repository
  final PackingListPdfRepository _packingListPdfRepository =
  PackingListPdfRepository();

  // --- Data models
  PackingListPdfModel? _packingList;
  PackingListPdfModel? get packingList => _packingList;

  PackingGetDataByIdModel? packingGetDataByIdModel;

  // --- Loading & error
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  // --- Search
  String _searchQuery = "";
  String get searchQuery => _searchQuery;

  List<Object> get filteredList {
    if (_searchQuery.isEmpty) {
      return _packingList?.data ?? [];
    }
    return (_packingList?.data ?? []).where((item) {
      final customer = item.formData?.customerDetails;
      final name = customer?.name?.toLowerCase() ?? '';
      final phone = customer?.phone?.toLowerCase() ?? '';
      final moveFrom = customer?.moveFrom?.toLowerCase() ?? '';
      final moveTo = customer?.moveTo?.toLowerCase() ?? '';
      final packingNo = customer?.packingNumber?.toLowerCase() ?? '';
      final vehicleNo = customer?.vehicleNo?.toLowerCase() ?? '';

      return name.contains(_searchQuery.toLowerCase()) ||
          phone.contains(_searchQuery.toLowerCase()) ||
          moveFrom.contains(_searchQuery.toLowerCase()) ||
          moveTo.contains(_searchQuery.toLowerCase()) ||
          packingNo.contains(_searchQuery.toLowerCase()) ||
          vehicleNo.contains(_searchQuery.toLowerCase());
    }).toList();
  }

  void updateSearch(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  // --- Fetch all packing list data
  Future<void> fetchpackingListData() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _packingList = await _packingListPdfRepository.getpackinglistdataApi();
    } catch (e) {
      _errorMessage = 'Failed to load survey list: ${e.toString()}';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<PackingListPdfModel?> fetchPackingById(
      String userId, Map<String, dynamic> updateData) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();
    try {
      final response =
      await _packingListPdfRepository.patchPackingByIdApi(userId, updateData);
      _packingList = response;

      if (_packingList?.data != null && _packingList!.data!.isNotEmpty) {
        final customer = _packingList!.data!.first.formData?.customerDetails;

        if (customer != null) {
          nameController.text = customer.name ?? "";
          phoneController.text = customer.phone ?? "";
          packingNoController.text = customer.packingNumber ?? "";
          dateController.text = customer.date ?? "";
          moveFromController.text = customer.moveFrom ?? "";
          moveToController.text = customer.moveTo ?? "";
          vehicalNoController.text = customer.vehicleNo ?? "";
        }
      }

      _isLoading = false;
      notifyListeners();
      return _packingList;
    } catch (e) {
      _isLoading = false;
      _errorMessage = e.toString();
      notifyListeners();
      return null;
    }
  }

  // --- Delete packing
  Future<bool> deletepacking(String id) async {
    try {
      final result = await _packingListPdfRepository.deleteQuotationById(id);
      if (result.status == true) {
        await fetchpackingListData();
        return true;
      } else {
        print('Delete failed: ${result.message}');
        return false;
      }
    } catch (e) {
      print('Error deleting survey: $e');
      return false;
    }
  }



  List<ItemParticulars> get items =>
      packingGetDataByIdModel?.data?.formData?.itemParticulars ?? [];
 Future<void> fetchpackingById({required String id}) async {
    _errorMessage = null;

    try {
      packingGetDataByIdModel =
      await _packingListPdfRepository.getpackingByIdApi(id);

      if (packingGetDataByIdModel != null &&
          packingGetDataByIdModel!.data != null) {
        final customer = packingGetDataByIdModel!.data!.formData?.customerDetails;

        if (customer != null) {
          nameController.text = customer.name ?? "";
          phoneController.text = customer.phone ?? "";
          dateController.text = customer.date ?? "";
          moveFromController.text = customer.moveFrom ?? "";
          moveToController.text = customer.moveTo ?? "";
          vehicalNoController.text = customer.vehicleNo ?? "";
          packingNoController.text = customer.packingNumber ?? "";
        }
        void loadItemIntoControllers(ItemParticulars item) {
          itemNameController.text = item.itemName ?? "";
          itemBoxNumberController.text = item.boxNumber?.toString() ?? "";
          itemQuantityController.text = item.quantity?.toString() ?? "";
          itemValueController.text = item.value?.toString() ?? "";
          itemCFTController.text = item.cft?.toString() ?? "";
          itemRemarkController.text = item.remark ?? "";
        }


      }
    } catch (e) {
      _errorMessage = 'Failed to load packing data: ${e.toString()}';
      print(_errorMessage);
    }
  }
}
*/


import 'package:flutter/cupertino.dart';
import '../../../../core/widgets/custom_additeam_list/ui/custom_AddItem_list.dart';
import '../get_by_id_model/packing_get_byid_model.dart';
import '../model/packing_list_pdf_model.dart' hide Data, ItemParticulars;
import '../repo/packing_list_pdf_repository.dart';

class PackingListPdfProvider with ChangeNotifier {
  // --- Controllers
  final TextEditingController nameController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController packingNoController = TextEditingController();
  final TextEditingController moveFromController = TextEditingController();
  final TextEditingController moveToController = TextEditingController();
  final TextEditingController vehicalNoController = TextEditingController();
  final TextEditingController itemNameController = TextEditingController();
  final TextEditingController itemBoxNumberController = TextEditingController();
  final TextEditingController itemQuantityController = TextEditingController();
  final TextEditingController itemValueController = TextEditingController();
  final TextEditingController itemCFTController = TextEditingController();
  final TextEditingController itemRemarkController = TextEditingController();

  // Lists of controllers for multiple items
  List<TextEditingController> itemNameControllers = [];
  List<TextEditingController> itemBoxNumberControllers = [];
  List<TextEditingController> itemQuantityControllers = [];
  List<TextEditingController> itemValueControllers = [];
  List<TextEditingController> itemCFTControllers = [];
  List<TextEditingController> itemRemarkControllers = [];

  List<ListItem> particularItemsDetails = [];

  // --- Repository
  final PackingListPdfRepository _packingListPdfRepository =
  PackingListPdfRepository();

  // --- Data models
  PackingListPdfModel? _packingList;
  PackingListPdfModel? get packingList => _packingList;

  PackingGetDataByIdModel? packingGetDataByIdModel;

  // --- Loading & error
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  // --- Search
  String _searchQuery = "";
  String get searchQuery => _searchQuery;

  List<Object> get filteredList {
    if (_searchQuery.isEmpty) {
      return _packingList?.data ?? [];
    }
    return (_packingList?.data ?? []).where((item) {
      final customer = item.formData?.customerDetails;
      final name = customer?.name?.toLowerCase() ?? '';
      final phone = customer?.phone?.toLowerCase() ?? '';
      final moveFrom = customer?.moveFrom?.toLowerCase() ?? '';
      final moveTo = customer?.moveTo?.toLowerCase() ?? '';
      final packingNo = customer?.packingNumber?.toLowerCase() ?? '';
      final vehicleNo = customer?.vehicleNo?.toLowerCase() ?? '';

      return name.contains(_searchQuery.toLowerCase()) ||
          phone.contains(_searchQuery.toLowerCase()) ||
          moveFrom.contains(_searchQuery.toLowerCase()) ||
          moveTo.contains(_searchQuery.toLowerCase()) ||
          packingNo.contains(_searchQuery.toLowerCase()) ||
          vehicleNo.contains(_searchQuery.toLowerCase());
    }).toList();
  }

  void updateSearch(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  // --- Fetch all packing list data
  Future<void> fetchpackingListData() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _packingList = await _packingListPdfRepository.getpackinglistdataApi();
    } catch (e) {
      _errorMessage = 'Failed to load survey list: ${e.toString()}';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<PackingListPdfModel?> fetchPackingById(
      String userId, Map<String, dynamic> updateData) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();
    try {
      final response =
      await _packingListPdfRepository.patchPackingByIdApi(userId, updateData);
      _packingList = response;

      if (_packingList?.data != null && _packingList!.data!.isNotEmpty) {
        final customer = _packingList!.data!.first.formData?.customerDetails;

        if (customer != null) {
          nameController.text = customer.name ?? "";
          phoneController.text = customer.phone ?? "";
          packingNoController.text = customer.packingNumber ?? "";
          dateController.text = customer.date ?? "";
          moveFromController.text = customer.moveFrom ?? "";
          moveToController.text = customer.moveTo ?? "";
          vehicalNoController.text = customer.vehicleNo ?? "";
        }
      }

      _isLoading = false;
      notifyListeners();
      return _packingList;
    } catch (e) {
      _isLoading = false;
      _errorMessage = e.toString();
      notifyListeners();
      return null;
    }
  }

  // --- Delete packing
  Future<bool> deletepacking(String id) async {
    try {
      final result = await _packingListPdfRepository.deleteQuotationById(id);
      if (result.status == true) {
        await fetchpackingListData();
        return true;
      } else {
        print('Delete failed: ${result.message}');
        return false;
      }
    } catch (e) {
      print('Error deleting survey: $e');
      return false;
    }
  }

  List<ItemParticulars> get items =>
      packingGetDataByIdModel?.data?.formData?.itemParticulars ?? [];

  // --- Fetch packing by ID (populate controllers)
  Future<void> fetchpackingById({required String id}) async {
    _errorMessage = null;

    try {
      packingGetDataByIdModel =
      await _packingListPdfRepository.getpackingByIdApi(id);

      if (packingGetDataByIdModel != null &&
          packingGetDataByIdModel!.data != null) {
        final customer = packingGetDataByIdModel!.data!.formData?.customerDetails;

        if (customer != null) {
          nameController.text = customer.name ?? "";
          phoneController.text = customer.phone ?? "";
          dateController.text = customer.date ?? "";
          moveFromController.text = customer.moveFrom ?? "";
          moveToController.text = customer.moveTo ?? "";
          vehicalNoController.text = customer.vehicleNo ?? "";
          packingNoController.text = customer.packingNumber ?? "";
        }

        final items = packingGetDataByIdModel!.data!.formData?.itemParticulars;
        if (items != null && items.isNotEmpty) {
          final item = items.first;
          itemNameController.text = item.itemName ?? "";
          itemBoxNumberController.text = item.boxNumber ?? "";
          itemQuantityController.text = item.quantity?.toString() ?? "";
          itemValueController.text = item.value?.toString() ?? "";
          itemCFTController.text = item.cft?.toString() ?? "";
          itemRemarkController.text = item.remark ?? "";
        }
      }
    } catch (e) {
      _errorMessage = 'Failed to load packing data: ${e.toString()}';
      print(_errorMessage);
    }
  }

  // --- NEW: Load a specific item into controllers (call from UI)
  void loadItemIntoControllers(ItemParticulars item) {
    itemNameController.text = item.itemName ?? "";
    itemBoxNumberController.text = item.boxNumber?.toString() ?? "";
    itemQuantityController.text = item.quantity?.toString() ?? "";
    itemValueController.text = item.value?.toString() ?? "";
    itemCFTController.text = item.cft?.toString() ?? "";
    itemRemarkController.text = item.remark ?? "";
    notifyListeners();
  }
}
