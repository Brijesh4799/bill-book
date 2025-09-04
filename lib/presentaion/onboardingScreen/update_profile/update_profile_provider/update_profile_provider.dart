import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/widgets/navigation_method.dart';
import '../../../homeScreen/home_controller.dart';
import '../repo/update_profile_repository.dart';
import '../update_profile_model/update_profile_model.dart';

class UpdateProfileProvider with ChangeNotifier{


  TextEditingController nameController = TextEditingController();
 TextEditingController companyNameController = TextEditingController();
   TextEditingController emailController = TextEditingController();
TextEditingController refCodeController = TextEditingController();
TextEditingController idCodeController = TextEditingController();
TextEditingController imageCodeController = TextEditingController();

  TextEditingController phoneController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  TextEditingController addressController = TextEditingController();
 FocusNode updateprofileFocusNode = FocusNode();
  UpdateProfileModel?updateProfileModel;

  Future<void> updateProfile({required String mobileNumber,required BuildContext context}) async{
    final resendupdateProfileRepository = UpdateProfileRepository();
    try{
      var response = await resendupdateProfileRepository.updateprofileapi({
        'mobileNo': mobileNumber,

        'name':nameController.text.trim(),
        'company':companyNameController.text.trim(),
        'email':emailController.text.trim(),
        'referralCode':refCodeController.text.trim(),
        'mobileNo':phoneController.text.trim(),
        'state':stateController.text.trim(),
        'city':cityController.text.trim(),
        'pincode':pincodeController.text.trim(),
        'address':addressController.text.trim(),
        'sId':idCodeController.text.trim(),
        'profileImage':imageCodeController.text.trim(),

      });
       print('hii');
      if (response!.success == true) {
        updateProfileModel=response;



        navPushRemove(context: context, action: HomeNavController());

      } else {
        print("Failed to resend Data.");
      }

    } catch (e) {
      print("Error resending update profile: $e");
    }

    notifyListeners();
  }
  String get name => nameController.text;
  String get company => companyNameController.text;
  String get email => emailController.text;
  String get referralCode => refCodeController.text;
  String get sId => idCodeController.text;
  String get profileImage => imageCodeController.text;

  //get profile => null;

}