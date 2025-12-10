import 'package:BillBook/core/widgets/custom_input_text_field.dart';
import 'package:BillBook/presentaion/profile/user_profile_input/provider/user_update_input_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/widgets/custom_app_bar/ui/customAppBar.dart';
import '../../core/widgets/custom_Textbutton.dart';

class UserProfile extends StatefulWidget {
  final String mobileNumber;
  const UserProfile({Key? key, required this.mobileNumber}) : super(key: key);
  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<UserUpdateInputProvider>(context, listen: false);
      provider.getUserProfileAndFill();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //ProfileViewModel
      appBar: CustomAppBar(title: 'User Profile'),
      body:  Consumer<UserUpdateInputProvider>(builder: (context, provider, child){
        return  SingleChildScrollView(
        padding: const EdgeInsets.all(12.0),
        child: Container(
        padding: EdgeInsets.all(8.0),
        color: Colors.white,
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        inputTextFields(


        textEditingController:provider.nameController,
        label: 'NAME*'
        ),
        inputTextFields(
        textEditingController:provider.emailController,
        label: 'EMAIL*'
        ),
        inputTextFields(
        textEditingController: provider.phoneController,
        label: 'PHONE*'
        ),
        inputTextFields(
        textEditingController: provider.stateController,
        label: 'STATE'
        ),
        Row(
        children: [
    Expanded(
    child: inputTextFields(
    textEditingController: provider.cityController,
    label: 'CITY'
    ),
    ),
    SizedBox(width: 10),
    Expanded(
    child: inputTextFields(
    textEditingController: provider.pincodeController,
    label: 'PINCODE'
    ),
    ),
    ],
    ),
    inputTextFields(
    textEditingController: provider.addressController,
    label: 'Address'
    ),

          CustomButton(
            label: 'Save Changes',
            onPressed: () async {
              final provider = Provider.of<UserUpdateInputProvider>(context, listen: false);
              bool isUpdated = await provider.userupdateprovider(
                mobileNumber: widget.mobileNumber,
                context: context,
              );

              if (isUpdated) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Profile updated successfully!'),
                    backgroundColor: Colors.green,
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Failed to update profile.'),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
          ),

          /*CustomButton(
    label: 'Save Changes',
    onPressed: () async {
      provider.userupdateprovider( mobileNumber: widget.mobileNumber,context: context);
    },
    ),*/
    ],
    ),
    ),
    );
      }
    ),
    );
  }
}