import '../../../../WebServices/app_url.dart';
import '../../../../WebServices/network/network_api_services.dart';
import '../model/proforma_invoice_model.dart';

class ProformaInvoiceRepository{
  final _apiService = NetworkApiServices();

  Future<ProformaInvoiceModel?> businessapi(var data) async {
    try {
      dynamic response =
      //await _apiService. patchApiWithToken(data, AppUrl.proformainvoice);
      await _apiService. postApiWithToken(data, AppUrl.proformainvoice);
      return ProformaInvoiceModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}