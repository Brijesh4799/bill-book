import '../../../../WebServices/app_url.dart';
import '../../../../WebServices/network/network_api_services.dart';
import '../model/payment_voucher_model.dart';

class PaymentVocherRepository {
  final _apiService = NetworkApiServices();

  Future<PaymentVoucherModel?> businessapi(var data) async {
    try {
      dynamic response =
     // await _apiService. patchApiWithToken(data, AppUrl.paymentvoucher);
      await _apiService. postApiWithToken(data, AppUrl.paymentvoucher);
      return PaymentVoucherModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}