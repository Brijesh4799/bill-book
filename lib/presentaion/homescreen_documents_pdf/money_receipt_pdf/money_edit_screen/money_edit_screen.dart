import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/helperFuntions.dart';
import '../../../../core/widgets/custom_app_bar/ui/customAppBar.dart';
import '../../../../core/widgets/custom_dropDown.dart';
import '../../../../core/widgets/custom_input_text_field.dart';
import '../../../homeScreen/home_controller.dart';
import '../../../homeScreen/moneyReceiptScreen/provider/money_receipt_provider.dart';
import '../provider/money_receipt_pdf_provider.dart';


class MoneyReceiptEditScreen extends StatefulWidget {
  final String id;
  const MoneyReceiptEditScreen({Key? key, required this.id}) : super(key: key);
  // const MoneyReceiptEditScreen({super.key});

  @override
  _MoneyReceiptEditScreen createState() => _MoneyReceiptEditScreen();
}

class _MoneyReceiptEditScreen extends State<MoneyReceiptEditScreen> {
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
  /*void initState(){
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final moneyProvider = Provider.of<MoneyReceiptPdfProvider>(context, listen: false);
      moneyProvider.fetchmoneyById(id:widget.id );
    });
  }*/
  void initState(){
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final billProvider = Provider.of<MoneyReceiptPdfProvider>(context, listen: false);
      billProvider.fetchmoneyById(id:widget.id );
    });
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

       /* bottomNavigationBar: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Consumer<MoneyReceiptPdfProvider>(
              builder: (context, provider, child) {
                return ElevatedButton(
                  onPressed: () async {
                    final helper = HelperFunctions();

                    // Check internet
                    if (!await helper.isConnected()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('No internet connection')),
                      );
                      return;
                    }

                    try {
                      // Call update API
                      final result = await provider.updatemoneyById(widget.id);

                      if (result != null && result.status == true) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Money Receipt updated successfully'),
                          ),
                        );
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeNavController(),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              result?.message ?? 'update receipt',
                            ),
                          ),
                        );
                      }
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Error: $e')),
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
                  child: const Text(
                    'Update Money Receipt',
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
            child: Consumer<MoneyReceiptPdfProvider>(
              builder: (context, provider, child) {
                return ElevatedButton(
                  onPressed: provider.isLoading
                      ? null
                      : () async {
                    final helper = HelperFunctions();

                    // Check internet
                    if (!await helper.isConnected()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('No internet connection')),
                      );
                      return;
                    }

                    try {
                      // Call update API
                      final result = await provider.updatemoneyById(widget.id);

                      if (result != null && result.status == true) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Money Receipt updated successfully'),
                          ),
                        );

                        // Redirect
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeNavController(),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              result?.message ?? 'Success',
                            ),
                          ),
                        );
                      }
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Error: $e')),
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
                    'Update Money Receipt',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                );
              },
            ),
          ),
        )




      /* bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Consumer<MoneyReceiptPdfProvider>(
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

                  String billId = provider.moneyList?.data?.sId ?? '';

                  if (billId.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('No bill ID found to update')),
                    );
                    return;
                  }

                  // Call update API
                  final result = await provider.updatemoneyById(billId);

                  if (result != null && result.status == true) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Money Receipt updated successfully')),
                    );
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomeNavController()),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(result?.message ?? 'Failed to update receipt')),
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
                child: const Text(
                  'Update Money Receipt',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              );
            },
          ),
        ),
      ),
*/

    );
  }




  Widget _buildMoneyReceiptDetailsTile(){
    return Consumer<MoneyReceiptPdfProvider>(
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
