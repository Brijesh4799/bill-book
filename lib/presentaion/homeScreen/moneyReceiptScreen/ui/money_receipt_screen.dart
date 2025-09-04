import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/utils/helperFuntions.dart';
import '../../../../core/widgets/custom_app_bar/ui/customAppBar.dart';
import '../../../../core/widgets/custom_Textbutton.dart';
import '../../../../core/widgets/custom_dropDown.dart';
import '../../../../core/widgets/custom_input_text_field.dart';
import '../../home_controller.dart';
import '../provider/money_receipt_provider.dart';

class MoneyReceiptScreen extends StatefulWidget {
  final String mobileNumber;
  const MoneyReceiptScreen({Key? key, required this.mobileNumber}) : super(key: key);
 // const MoneyReceiptScreen({super.key});

  @override
  _MoneyReceiptScreen createState() => _MoneyReceiptScreen();
}

class _MoneyReceiptScreen extends State<MoneyReceiptScreen> {
// TextEditingControllers
  final TextEditingController receiptNumberController = TextEditingController();
  final TextEditingController receiptDateController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController receiptAgainstNumberController = TextEditingController();
  final TextEditingController billQuotationDateController = TextEditingController();
  final TextEditingController moveFromController = TextEditingController();
  final TextEditingController moveToController = TextEditingController();
  final TextEditingController receiptAmountController = TextEditingController();
  final TextEditingController transactionNumberController = TextEditingController();
  final TextEditingController branchController = TextEditingController();
  final TextEditingController remarkController = TextEditingController();

// Dropdown values
  String receiptAgainstValue = 'Bill'; // or 'Quotation'
  String paymentTypeValue = 'Part';    // or 'Full'
  String paymentModeValue = 'Cash';    // or 'UPI', 'Bank Transfer'



  void _saveAllValues() {

  }


  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'MONEY RECEIPT'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildMoneyReceiptDetailsTile(),
            const SizedBox(height: 80),
          ],
        ),
      ),

        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Consumer<MoneyReceiptProvider>(
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
                    await provider.moneyovider(
                      mobileNumber: widget.mobileNumber,
                      context: context,
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
                    'Save Money Receipt',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                );
              },
            ),
          ),
        )

    );
  }




  Widget _buildMoneyReceiptDetailsTile(){
    return Consumer<MoneyReceiptProvider>(
        builder: (context, provider, child){
          return  _expansionTileWrapper(
            title: 'Money Receipt Details (धन रशीद का विवरण)',
            children: [
              inputTextFields(
                inputType: TextInputType.number,
                label: 'RECEIPT NUMBER* (रसीद नंबर)',
                textEditingController: provider.receiptNumberController,
              ),
              inputTextFields(
                label: 'RECEIPT DATE (तारीख)',
                textEditingController: provider.receiptDateController,
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
                        provider.receiptDateController.text = pickedDate.toLocal().toString().split(' ')[0];
                      });
                    }
                  },
                ),
              ),
              inputTextFields(
                label: 'NAME* (नाम)',
                textEditingController: provider.nameController,
              ),
              inputTextFields(
                label: 'PHONE* (फोन)',
                inputType: TextInputType.phone,
                maxLength: 10,
                textEditingController: provider.phoneController,
              ),
              Row(
                children: [
                  Expanded(
                    child: customDropdown(
                      label: 'RECEIPT AGAINST',
                      selectedItem: receiptAgainstValue,
                      items: ['Bill', 'Quotation'],
                      onChanged: (val) {
                        setState(() {
                          receiptAgainstValue = val!;
                        });
                      }, controller: null,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: inputTextFields(
                      inputType: TextInputType.number,
                      label: 'NUMBER (नंबर)',
                      textEditingController: provider.receiptAgainstNumberController,
                    ),
                  ),
                ],
              ),
              inputTextFields(
                label: 'BILL/QUOTATION DATE (तारीख)',
                textEditingController: provider.billQuotationDateController,
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
                        provider.billQuotationDateController.text = pickedDate.toLocal().toString().split(' ')[0];
                      });
                    }
                  },
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: inputTextFields(
                      label: 'MOVE FROM \n(जहां से सामान जाएगा)',
                      textEditingController: provider.moveFromController,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: inputTextFields(
                      label: 'MOVE TO \n(जहां सामान जाना है)',
                      textEditingController: provider.moveToController,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: customDropdown(
                      label: 'PAYMENT TYPE \n(पेमेंट का प्रकार)',
                      selectedItem: paymentTypeValue,
                      items: ['Part', 'Full'],
                      onChanged: (val) {
                        setState(() {
                          paymentTypeValue = val!;
                        });
                      }, controller: null,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: inputTextFields(
                      inputType: TextInputType.number,
                      label: 'RECEIPT AMOUNT* \n(रसीद की रकम)',
                      textEditingController: provider.receiptAmountController,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: customDropdown(
                      label: 'PAYMENT MODE \n(भुगतान का प्रकार)',
                      selectedItem: paymentModeValue,
                      items: ['Cash', 'UPI', 'Bank Transfer'],
                      onChanged: (val) {
                        setState(() {
                          paymentModeValue = val!;
                        });
                      }, controller: null,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: inputTextFields(
                      label: 'TRANSACTION NUMBER (नंबर)',
                      textEditingController: provider.transactionNumberController,
                    ),
                  ),
                ],
              ),
              inputTextFields(
                label: 'BRANCH (ब्रांच)',
                textEditingController: provider.branchController,
              ),
              inputTextFields(
                label: 'REMARK (टिप्पणी)',
                textEditingController: provider.remarkController,
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
