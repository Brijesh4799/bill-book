class AppUrl {
  //local
  //static const String baseUrl = 'http://192.168.1.6:5050';
  //live
  //static const String baseUrl = 'http://192.168.1.26:5050';
  //static const String baseUrl = 'http://167.71.232.245:8970';
  static const String baseUrl = 'http://159.89.146.245:8970';
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
  static const String stafflist = '$baseUrl/api/user/staff/list';
  //static const String stafflist = '$baseUrl/api/admin/staff/list';
  static const String poststafflist = '$baseUrl/api/admin/create';
  static const String watermark = '$baseUrl/api/user/watermark/toggle';
  static const String updateProfile = '$baseUrl/api/user/profile';
  static const String activestafflist = '$baseUrl/api/user/staff/list/active';
  static const String razorpay = '$baseUrl/api/user/create-razorpayOrderId';
  static const String notification = '$baseUrl/api/user/notification/list?filter=all';
  static const String notificationred = '$baseUrl/api/user/notification/read';
  static const String deletenotificaton = '$baseUrl/api/user/delete/notification';
  static const String cmsquotation = '$baseUrl/api/user/cms/list/quotation';
  static const String cmsbill = '$baseUrl/api/user/cms/list/bill';



  static const String signature = '$baseUrl/api/user/create/signature';
  static const String subscriptionpdf = '$baseUrl/api/user/subcribe/user/list';


  static const String quotationPDF = '$baseUrl/api/user/quotation';
  static const String surveyPDF = '$baseUrl/api/user/survey';
  static const String packagePDF = '$baseUrl/api/user/packing';
  static const String lrbiltyPDF = '$baseUrl/api/user/lrbilty';
  static const String proformaPDF = '$baseUrl/api/user/proforma';
  static const String billPDF = '$baseUrl/api/user/bill';
  static const String moneyPDF = '$baseUrl/api/user/money';
  static const String carPDF = '$baseUrl/api/user/carCondition';
  static const String paymentPDF = '$baseUrl/api/user/paymentVoucher';
  static const String twsPDF = '$baseUrl/api/user/tws';
  static const String fovscfPDF = '$baseUrl/api/user/fovScf';
  static const String nocPDF = '$baseUrl/api/user/noc';

  //static const String ifsc = ;



}
