import '../../../../WebServices/app_url.dart';
import '../../../../WebServices/network/network_api_services.dart';
import '../model/payment_report_model.dart';


class PaymentVoucherReportRepogistory {
  final _apiService = NetworkApiServices();

  Future<PaymentVoucherReportModel> getpaymentApi(String startDate, String endDate) async {
    try {
      final url = '${AppUrl.paymentvoucher}?startDate=$startDate&endDate=$endDate';
      final response = await _apiService.getApiWithToken(url);
      print('Response: $response');

      if (response != null) {
        return PaymentVoucherReportModel.fromJson(response);
      } else {
        throw Exception('Failed to load data: Response is null');
      }
    } catch (e) {
      print('Error fetching packing report: $e');
      rethrow;
    }
  }
}



