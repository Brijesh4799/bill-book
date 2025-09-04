import '../../../../WebServices/app_url.dart';
import '../../../../WebServices/network/network_api_services.dart';
import '../model/quotation_model.dart';

class QuotationRepository{
  final _apiService = NetworkApiServices();

  Future<QuotationModel?> businessapi(var data) async {
    try {
      dynamic response =
      //await _apiService. patchApiWithToken(data, AppUrl.quotationdetails);
      await _apiService. postApiWithToken(data, AppUrl.quotationdetails);
      return QuotationModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}