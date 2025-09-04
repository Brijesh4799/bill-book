import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/utils/helperFuntions.dart';
import '../../../../core/widgets/custom_app_bar/ui/customAppBar.dart';
import '../../../../core/widgets/custom_Textbutton.dart';
import '../../../../core/widgets/custom_dropDown.dart';
import '../../../../core/widgets/custom_input_text_field.dart';
import '../../home_controller.dart';
import '../provider/nocletter_provider.dart';

class NOCLetterScreen extends StatefulWidget {
  final String mobileNumber;
  const NOCLetterScreen({Key? key, required this.mobileNumber}) : super(key: key);


  @override
  _NOCLetterScreen createState() => _NOCLetterScreen();
}

class _NOCLetterScreen extends State<NOCLetterScreen> {
  String? nocTypeValue;

  final TextEditingController nocDateController = TextEditingController();
  final TextEditingController nocLrNumberController = TextEditingController();
  final TextEditingController nocLrDateController = TextEditingController();
  final TextEditingController nocNameController = TextEditingController();
  final TextEditingController nocPhoneController = TextEditingController();
  final TextEditingController nocEmailController = TextEditingController();
  final TextEditingController nocMoveFromCityController = TextEditingController();
  final TextEditingController nocMoveToCityController = TextEditingController();


  void _saveAllValues() {

  }


  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'NOC Letter'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildNOCLetterTile(),
            _buildNOCFormTile(),
            const SizedBox(height: 80),
          ],
        ),
      ),

        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Consumer<NocLetterProvider>(
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


                    await provider.nocletter(
                      mobileNumber: widget.mobileNumber,
                      context: context,
                    );


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
                    'Save NOC Letter',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                );
              },
            ),
          ),
        )

    );
  }

  Widget _buildNOCLetterTile(){
    return Consumer<NocLetterProvider>(
      builder: (context, provider, child){
        return  _expansionTileWrapper(
          title: 'NOC LETTER FOR',
          children: [
            customDropdown(
              label: 'NOC TYPE (NOC का प्रकार)',
              selectedItem: nocTypeValue,
              items: ['Household Goods', 'Office Items', 'Vehicle', 'Others'],
              onChanged: (val) {
                setState(() {
                  nocTypeValue = val!;
                });
              }, controller: null,
            ),
          ],
        );
      }
    );
  }

  Widget _buildNOCFormTile(){
    return Consumer<NocLetterProvider>(
        builder: (context, provider, child){
          return  _expansionTileWrapper(
            title: 'NOC FORM (No Need Of Trasit Risk)',
            children: [
              inputTextFields(
                label: 'DATE (तारीख)',
                textEditingController: provider.nocDateController,
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
                        provider.nocDateController.text = pickedDate.toLocal().toString().split(' ')[0];
                      });
                    }
                  },
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: inputTextFields(
                      label: 'LR NUMBER* (बिल्टी नंबर)',
                      inputType: TextInputType.number,
                      textEditingController: provider.nocLrNumberController,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: inputTextFields(
                      label: 'LR DATE (तारीख)',
                      textEditingController: provider.nocLrDateController,
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
                              provider.nocLrDateController.text = pickedDate.toLocal().toString().split(' ')[0];
                            });
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
              inputTextFields(
                label: 'NAME* (नाम)',
                textEditingController: provider.nocNameController,
              ),
              Row(
                children: [
                  Expanded(
                    child: inputTextFields(
                      label: 'PHONE* (फोन)',
                      inputType: TextInputType.phone,
                      maxLength: 10,
                      textEditingController: provider.nocPhoneController,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: inputTextFields(
                      label: 'EMAIL (ईमेल)',
                      inputType: TextInputType.emailAddress,
                      textEditingController: provider.nocEmailController,
                    ),
                  ),
                ],
              ),
              inputTextFields(
                label: 'MOVE FROM CITY (शहर जहां से सामान जाएगा)',
                textEditingController: provider.nocMoveFromCityController,
              ),
              inputTextFields(
                label: 'MOVE TO CITY (शहर जहां सामान जाना है)',
                textEditingController: provider.nocMoveToCityController,
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
