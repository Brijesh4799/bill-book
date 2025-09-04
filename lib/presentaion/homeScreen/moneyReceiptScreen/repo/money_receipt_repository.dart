import '../../../../WebServices/app_url.dart';
import '../../../../WebServices/network/network_api_services.dart';
import '../model/money_receipt_model.dart';

class MoneyReceiptRepository{
  final _apiService = NetworkApiServices();

  Future<MoneyReceiptModel?> businessapi(var data) async {
    try {
      dynamic response =
     // await _apiService. patchApiWithToken(data, AppUrl.moneyreceipt);
      await _apiService. postApiWithToken(data, AppUrl.moneyreceipt);
      return MoneyReceiptModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}