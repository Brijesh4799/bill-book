
import 'package:flutter/cupertino.dart';

import '../repo/user_profile_input.dart';

class UserUpdateInputProvider with ChangeNotifier{

  //Invoice Details

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  Future<void> getUserProfileAndFill() async {
    final billRepository = UserProfileInput();

    try {
      final response = await billRepository.getuserprofilegetApi();

      if (response.user != null) {
        nameController.text = response.user?.name ?? '';
        emailController.text = response.user?.email ?? '';
        phoneController.text = response.user?.mobileNo ?? '';
        stateController.text = response.user?.state ?? '';
        cityController.text = response.user?.city ?? '';
        //pincodeController.text = response.user?.pincode ?? '';
        pincodeController.text = response.user?.pincode?.toString() ?? '';
        addressController.text = response.user?.address ?? '';
      }
    } catch (e) {
      print('Error fetching and filling profile data: $e');
    }

    notifyListeners();
  }

  Future<bool> userupdateprovider({
    required String mobileNumber,
    required BuildContext context,
  }) async {
    final billRepository = UserProfileInput();
    try {
      var response = await billRepository.userUpdateApi({
        'name': nameController.text.trim(),
        'email': emailController.text.trim(),
        'mobileNo': phoneController.text.trim(),
        'state': stateController.text.trim(),
        'city': cityController.text.trim(),
        'pincode': pincodeController.text.trim(),
        'address': addressController.text.trim(),
      });

      if (response != null && response.user != null) {
        print("Profile updated successfully: ${response.user?.name}");
        return true;
      } else {
        print("Failed to parse response.");
        return false;
      }
    } catch (e) {
      print('Update error: $e');
      return false;
    }
  }


/*Future<void> userupdateprovider({
    required String mobileNumber, // you may remove if not needed
    required BuildContext context,
  }) async {
    final billRepository = UserProfileInput();
    try {
      var response = await billRepository.userUpdateApi({
        'name': nameController.text.trim(),
        'email': emailController.text.trim(),
        'mobileNo': phoneController.text.trim(),
        'state': stateController.text.trim(),
        'city': cityController.text.trim(),
        'pincode': pincodeController.text.trim(),
        'address': addressController.text.trim(),
        // 'company': optionalCompanyController.text.trim(), // optional
      });

      if (response != null) {
        print(" Profile updated successfully: ${response.user?.name}");
      } else {
        print(" Failed to parse response.");
      }
    } catch (e) {
      print( 'Update error: $e');
    }
    notifyListeners();
  }*/

}

