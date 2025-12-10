import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/utils/helperFuntions.dart';
import '../../../../core/widgets/custom_app_bar/ui/customAppBar.dart';
import '../../../../core/widgets/custom_dropDown.dart';
import '../../../../core/widgets/custom_input_text_field.dart';
import '../../home_controller.dart';
import '../provider/fov_scf_form_provider.dart';

class FovScfFormScreen extends StatefulWidget {
  final String mobileNumber;
  const FovScfFormScreen({Key? key, required this.mobileNumber}) : super(key: key);

  @override
  _FovScfFormScreen createState() => _FovScfFormScreen();
}

class _FovScfFormScreen extends State<FovScfFormScreen> {
  final TextEditingController fovMovingDateController = TextEditingController();
  final TextEditingController fovLrNumberController = TextEditingController();
  final TextEditingController fovNameController = TextEditingController();
  final TextEditingController fovPhoneController = TextEditingController();
  final TextEditingController fovEmailController = TextEditingController();
  final TextEditingController fovMoveFromCityController = TextEditingController();
  final TextEditingController fovMoveToCityController = TextEditingController();
  String? fovMovingTypeValue;
  String? selectedInsuranceChargePercent;
  String? selectedInsuranceType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Fov-Scf Form'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildFOVSCFFormTile(),
            _buildInsuranceDetailsTile(),
            const SizedBox(height: 80),
          ],
        ),
      ),
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Consumer<FovScfFormProvider>(
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
                    await provider.fovscfform(
                      mobileNumber: widget.mobileNumber,
                      context: context,
                    );
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomeNavController()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Save FOV form',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                );
              },
            ),
          ),
        )
    );
  }

  Widget _buildFOVSCFFormTile(){
    return Consumer<FovScfFormProvider>(
        builder: (context, provider, child){
          return  _expansionTileWrapper(
            title: 'FOV– SCF (SPECIAL CONTRACT FORM)',
            children: [
              customDropdown(
                label: 'MOVING TYPE (मूविंग के प्रकार)',
                selectedItem: fovMovingTypeValue,
                items: ['Household Goods', 'Office Items', 'Vehicle', 'Others'],
                onChanged: (val) {
                  setState(() {
                    fovMovingTypeValue = val!;
                  });
                }, controller: null,
              ),
              inputTextFields(
                label: 'DATE (तारीख)',
                textEditingController: provider.fovMovingDateController,
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
                        provider.fovMovingDateController.text = pickedDate.toLocal().toString().split(' ')[0];
                      });
                    }
                  },
                ),
              ),
              inputTextFields(
                label: 'LR NUMBER* (बिल्टी नंबर)',
                inputType: TextInputType.number,
                textEditingController: provider.fovLrNumberController,
              ),
              inputTextFields(
                label: 'NAME* (नाम)',
                textEditingController: provider.fovNameController,
              ),
              Row(
                children: [
                  Expanded(
                    child: inputTextFields(
                      label: 'PHONE* (फोन)',
                      inputType: TextInputType.phone,
                      maxLength: 10,
                      textEditingController: provider.fovPhoneController,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: inputTextFields(
                      label: 'EMAIL (ईमेल)',
                      inputType: TextInputType.emailAddress,
                      textEditingController: provider.fovEmailController,
                    ),
                  ),
                ],
              ),
              inputTextFields(
                label: 'MOVE FROM CITY (शहर जहां से सामान जाएगा)',
                textEditingController: provider.fovMoveFromCityController,
              ),
              inputTextFields(
                label: 'MOVE TO CITY (शहर जहां सामान जाना है)',
                textEditingController: provider.fovMoveToCityController,
              ),
            ],
          );
        }
    );
  }


  Widget _buildInsuranceDetailsTile() => _expansionTileWrapper(
    title: 'Insurance Details (बीमा विवरण)',
    children: [
      customDropdown(
        label: 'INSURANCE RISK TYPE (क्या सामान का बीमा है?)',
        items: ['Yes', 'Not Insured'],
        selectedItem: selectedInsuranceType,
        onChanged: (value) {
          setState(() {
            selectedInsuranceType = value;
          });
        },
        val: (value) {
          if (value == null || value.isEmpty) {
            return 'Please select an option';
          }
          return null;
        }, controller: null,
      ),
      customDropdown(
        label: 'INSURANCE CHARGE @PERCENT(%)',
        items: ['0%', '18%'],
        selectedItem: selectedInsuranceChargePercent,
        onChanged: (value) {
          setState(() {
            selectedInsuranceChargePercent = value;
          });
        },
        val: (value) {
          if (value == null || value.isEmpty) {
            return 'Please select an option';
          }
          return null;
        }, controller: null,
      ),
    ],
  );

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
