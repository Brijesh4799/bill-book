import 'package:connectivity_plus/connectivity_plus.dart';

class HelperFunctions {
  Future<bool> isConnected() async {
    final List<ConnectivityResult> connectivityResults = await Connectivity().checkConnectivity();
    for (var result in connectivityResults) {
      if (result == ConnectivityResult.wifi || result == ConnectivityResult.mobile) {
        print('connected to internet');
        return true;
      }
    }
    return false;
  }

  String formatDateToDDMMYYYY(DateTime date) {
    final day = date.day.toString().padLeft(2, '0');
    final month = date.month.toString().padLeft(2, '0');
    final year = date.year.toString();
    return '$day/$month/$year';
  }

}