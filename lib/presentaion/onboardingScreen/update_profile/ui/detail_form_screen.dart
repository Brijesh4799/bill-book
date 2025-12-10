import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/localStorage/auth_token.dart';
import '../../../../core/utils/helperFuntions.dart';
import '../../../../core/widgets/custom_Textbutton.dart';
import '../../../../core/widgets/custom_image_view.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../../../core/widgets/custom_input_text_field.dart';
import '../../../homeScreen/home_controller.dart';
import '../../../homeScreen/home_screen.dart';
import '../../login_screen/ui/login_screen.dart';
import '../update_profile_provider/update_profile_provider.dart';

class DetailForm extends StatefulWidget {

  final String mobileNumber;
 // const DetailForm({super.key});
  //const DetailForm({super.key});
  const DetailForm({Key? key, required this.mobileNumber}) : super(key: key);


  @override
  State<DetailForm> createState() => _DetailFormState();
}

class _DetailFormState extends State<DetailForm> {
  // TextEditingController nameController = TextEditingController();
  // TextEditingController companyNameController = TextEditingController();
  // TextEditingController emailController = TextEditingController();
  // TextEditingController refCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Consumer<UpdateProfileProvider>(builder: (context, provider, child) {
        return SingleChildScrollView(
          child: Container(
            width: screenWidth,
            height: screenHeight,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/DetailBg.png'),
                fit: BoxFit.fill,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(left:16.0,right: 16,top:screenHeight * 0.2 ,bottom:16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  inputTextFields(
                    title: "Your Name*",
                    inputType: TextInputType.text,
                    textEditingController:provider. nameController,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  inputTextFields(
                    title: "Your Company name*",
                    textEditingController:provider. companyNameController,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  inputTextFields(
                    title: "Your Email*",
                    inputType: TextInputType.emailAddress,
                    textEditingController: provider.emailController,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  inputTextFields(
                    title: "Referral Code",
                    textEditingController:provider. refCodeController,
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  CustomButton(
                    label: 'Finish Setup',
                    onPressed: () async {

                      provider.updateProfile( mobileNumber: widget.mobileNumber,context: context);

                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },),
    );
  }
}