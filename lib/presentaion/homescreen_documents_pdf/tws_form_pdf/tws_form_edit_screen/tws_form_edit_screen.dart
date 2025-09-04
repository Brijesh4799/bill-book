import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/helperFuntions.dart';
import '../../../../core/widgets/custom_app_bar/ui/customAppBar.dart';
import '../../../../core/widgets/custom_dropDown.dart';
import '../../../../core/widgets/custom_input_text_field.dart';
import '../../../homeScreen/home_controller.dart';
import '../../../homeScreen/twsFormScreen/provider/tws_form_provider.dart';
import '../provider/tws_pdf_provider.dart';

class TwsFormEditScreen extends StatefulWidget {
  final String id;
  //const TwsFormEditScreen({super.key});
  const TwsFormEditScreen({Key? key, required this.id}) : super(key: key);

  @override
  _TwsFormEditScreen createState() => _TwsFormEditScreen();
}

class _TwsFormEditScreen extends State<TwsFormEditScreen> {
  final TextEditingController movingDateController = TextEditingController();
  final TextEditingController lrNumberController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController moveFromCityController = TextEditingController();
  final TextEditingController moveFromAddressController = TextEditingController();
  final TextEditingController moveToCityController = TextEditingController();
  final TextEditingController moveToAddressController = TextEditingController();

  String? movingTypeValue;



  void _saveAllValues() {

  }

  void initState(){
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final billProvider = Provider.of<TwsPdfProvider>(context, listen: false);
      billProvider.fetchtwsById(id:widget.id );
    });
  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: 'Tws Form'),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTWSFormTile(),
              const SizedBox(height: 80),
            ],
          ),
        ),

        /*bottomNavigationBar: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Consumer<TwsFormProvider>(
              builder: (context, provider, child) {
                return ElevatedButton(
                  onPressed: () async {
                    HelperFunctions helper = HelperFunctions();
                    bool isConnected = await helper.isConnected();

                    if (!isConnected) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('No internet connection')),
                      );
                      return;
                    }

                    // Call the provider's method
                    await provider.twsform(
                      //mobileNumber: widget.mobileNumber,
                      context: context, mobileNumber: '',
                    );

                    // Navigate to Home Page
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomeNavController()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50), // Full width button
                    backgroundColor: Colors.blue, // Customize as needed
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'SAVE TWS FORM',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                );
              },
            ),
          ),
        )*/
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Consumer<TwsPdfProvider>(
            builder: (context, provider, child) {
              return ElevatedButton(
                onPressed: () async {
                  HelperFunctions helper = HelperFunctions();
                  bool isConnected = await helper.isConnected();

                  if (!isConnected) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('No internet connection')),
                    );
                    return;
                  }

                  try {
                    // Replace this with your actual TWS ID you want to update
                    String twsId = widget.id ?? "";

                    if (twsId.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("TWS ID is missing")),
                      );
                      return;
                    }

                    // Call update method
                    final updatedData = await provider.updatetwsById(twsId);

                    if (updatedData != null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("TWS form updated successfully")),
                      );

                      // Navigate to Home Page
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomeNavController()),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text(" update TWS form")),
                      );
                    }
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Error: $e")),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: provider.isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text(
                  'SAVE TWS FORM',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              );
            },
          ),
        ),
      ),


    );
  }

  Widget _buildTWSFormTile(){
    return Consumer<TwsPdfProvider>(
        builder: (context, provider, child){
          return   _expansionTileWrapper(
            title: 'TWS Form (To Whomsoever It May Concern)',
            children: [
              customDropdown(
                label: 'MOVING TYPE (मूविंग के प्रकार)',
                selectedItem: movingTypeValue,
                items: ['Household Goods', 'Office Items', 'Vehicle', 'Others'],
                onChanged: (val) {
                  setState(() {
                    movingTypeValue = val!;
                  });
                }, controller: null,
              ),
              inputTextFields(
                label: 'DATE (तारीख)',
                textEditingController: provider.movingDateController,
                readOnly: true,
                suffix: IconButton(
                  icon: Icon(Icons.calendar_today),
                  onPressed: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime(5101),
                    );
                    if (pickedDate != null) {
                      setState(() {
                        provider.movingDateController.text = pickedDate.toLocal().toString().split(' ')[0];
                      });
                    }
                  },
                ),
              ),
              inputTextFields(
                label: 'LR NUMBER* (बिल्टी नंबर)',
                inputType: TextInputType.number,
                textEditingController: provider.lrNumberController,
              ),
              inputTextFields(
                label: 'NAME* (नाम)',
                textEditingController: provider.nameController,
              ),
              Row(
                children: [
                  Expanded(
                    child: inputTextFields(
                      label: 'PHONE* (फोन)',
                      inputType: TextInputType.phone,
                      maxLength: 10,
                      textEditingController: provider.phoneController,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: inputTextFields(
                      label: 'EMAIL (ईमेल)',
                      inputType: TextInputType.emailAddress,
                      textEditingController: provider.emailController,
                    ),
                  ),
                ],
              ),
              inputTextFields(
                label: 'MOVE FROM CITY (शहर जहां से सामान जाएगा)',
                textEditingController: provider.moveFromCityController,
              ),
              inputTextFields(
                label: 'MOVE FROM ADDRESS (पता जहां से सामान जाएगा)',
                textEditingController: provider.moveFromAddressController,
                maxLines: 3,
              ),
              inputTextFields(
                label: 'MOVE TO CITY (शहर जहां सामान जाना है)',
                textEditingController: provider.moveToCityController,
              ),
              inputTextFields(
                label: 'MOVE TO ADDRESS (पता जहां सामान जाना है)',
                textEditingController: provider.moveToAddressController,
                maxLines: 3,
              ),
            ],
          );
        }
    );
  }

  Widget _expansionTileWrapper({required String title, required List<Widget> children}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 4)],
      ),
      child: ExpansionTile(
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        children: [Padding(padding: const EdgeInsets.all(12.0), child: Column(children: children))],
      ),
    );
  }
}
