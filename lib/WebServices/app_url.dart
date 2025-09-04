class AppUrl {
  //local
 // static const String baseUrl = 'http://192.168.1.9:5001';
  //live
 // static const String baseUrl = 'http://192.168.1.34:5050';
  static const String baseUrl = 'http://167.71.232.245:8970';
  static const String login = '$baseUrl/api/user/send-otp';
  static const String verifyOtp = '$baseUrl/api/user/verify-otp';
  static const String businessdetails = '$baseUrl/api/user/company';
  static const String quotationdetails = '$baseUrl/api/user/quotation';
  static const String surveylist = '$baseUrl/api/user/survey';
  static const String packinglist = '$baseUrl/api/user/packing';
  static const String proformainvoice = '$baseUrl/api/user/proforma';
  static const String billdetails = '$baseUrl/api/user/bill';
  static const String moneyreceipt = '$baseUrl/api/user/money';
  static const String carcondition = '$baseUrl/api/user/carCondition';
  static const String paymentvoucher = '$baseUrl/api/user/paymentVoucher';
  static const String twsform = '$baseUrl/api/user/tws';
  static const String fovScf = '$baseUrl/api/user/fovScf';
  static const String noc = '$baseUrl/api/user/noc';
  static const String lrbill = '$baseUrl/api/user/lrbilty';
  static const String getprofile = '$baseUrl/api/user/profile';
  static const String homepage = '$baseUrl/api/user/home';
  static const String cms = '$baseUrl/api/user/cms';
  static const String subscriptiondata = '$baseUrl/api/user/subscription';
  static const String subscriptionpost = '$baseUrl/api/user/take/subscription';
  static const String stafflist = '$baseUrl/api/admin/staff/list';
  static const String poststafflist = '$baseUrl/api/admin/create';
  static const String watermark = '$baseUrl/api/user/watermark/toggle';





  static const String register = '$baseUrl/api/vendor/register';
  static const String allOrder = '$baseUrl/api/vendor/order/list';
  static const String todayOrder = '$baseUrl/api/vendor/order/today';
  static const String singleOrderId = '$baseUrl/api/vendor/order/';
  static const String serviceList = '$baseUrl/api/vendor/service/list';
  static const String agreement = '$baseUrl/api/vendor/term-and-condition';
  static const String createProduct = '$baseUrl/api/vendor/product/create';
  static const String productList = '$baseUrl/api/vendor/product/list';
  static const String productDetail = '$baseUrl/api/vendor/product';
  static const String categoryList = '$baseUrl/api/vendor/category/list';
  static const String subcategoryList = '$baseUrl/api/vendor/subcategory/list';
  static const String updateProfile = '$baseUrl/api/user/profile';
  static const String getProfile = '$baseUrl/api/user/profile';
  static const String deleteBulkProduct = '$baseUrl/api/vendor/product/delete/bulk';
  static const String deleteSingleProduct = '$baseUrl/api/vendor/product/delete';
  static const String statusProduct = '$baseUrl/api/vendor/product/status';

  static const String createShop= '$baseUrl/api/vendor/shop/create';
  static const String shopList = '$baseUrl/api/vendor/shop/list';
  static const String shopDetails = '$baseUrl/api/vendor/shop/details';
  static const String productAll = '$baseUrl/api/vendor/copy/product/all';
  static const String bulkCreate = '$baseUrl/api/vendor/copy/product/bulk/create';
  static const String shopByproduct = '$baseUrl/api/vendor/shop/product';
  static const String totalWalletAmt = '$baseUrl/api/vendor/wallet';
  static const String withdrawalAmt = '$baseUrl/api/vendor/wallet/request';
  static const String transactionHistory = '$baseUrl/api/vendor/wallet/history';
  static const String requestWithdrawal = '$baseUrl/api/vendor/wallet/request';
  //static const String ifsc = ;



}
