
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/helperFuntions.dart';
import '../../../../core/widgets/custom_app_bar/ui/customAppBar.dart';
import '../../../../core/widgets/custom_dropDown.dart';
import '../../../../core/widgets/custom_input_text_field.dart';
import '../../../homeScreen/home_controller.dart';
import '../../../homeScreen/paymentVoucherScreen/provider/payment_voucher_provider.dart';
import '../provider/payment_pdf_provider.dart';

class PayementVoucherEditScreen extends StatefulWidget {
  final String  id;
  const PayementVoucherEditScreen({Key? key, required this. id}) : super(key: key);
  //const PayementVoucherEditScreen({super.key});

  @override
  _PayementVoucherEditScreen createState() => _PayementVoucherEditScreen();
}

class _PayementVoucherEditScreen extends State<PayementVoucherEditScreen> {

  final TextEditingController voucherNumberController = TextEditingController();
  final TextEditingController voucherDateController = TextEditingController();
  final TextEditingController receiverNameController = TextEditingController();
  final TextEditingController receiverPhoneController = TextEditingController();
  final TextEditingController voucherAmountController = TextEditingController();
  final TextEditingController transactionNumberController = TextEditingController();
  final TextEditingController payForController = TextEditingController();
  final TextEditingController remarkController = TextEditingController();

  String? paymentTypeValue;
  String? paymentModeValue;


  void _saveAllValues() {

  }
  void initState(){
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final billProvider = Provider.of<PaymentPdfProvider>(context, listen: false);
      billProvider.fetchpaymentById(id:widget.id );
    });
  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: 'Payment Voucher'),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildPaymentVoucherDetailsTile(),
              const SizedBox(height: 80),
            ],
          ),
        ),

       /* bottomNavigationBar: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Consumer<PaymentVoucherProvider>(
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

                    await provider.paymentvoucherprovider(
                      context: context, mobileNumber: '',
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
                    'Save Payment Voucher',
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
          child: Consumer<PaymentPdfProvider>(
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

                  // Get the payment voucher ID from widget or state
                  String paymentId = widget.id ?? ""; // <-- Replace with your actual payment ID

                  if (paymentId.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Payment voucher ID is missing')),
                    );
                    return;
                  }

                  final updatedPayment = await provider.updatepaymntById(paymentId);

                  if (updatedPayment != null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Payment voucher updated successfully!')),
                    );
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomeNavController()),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text(' update payment voucher')),
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
                  'Save Payment Voucher',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              );
            },
          ),
        ),
      ),
    );
  }


  Widget _buildPaymentVoucherDetailsTile(){
    return Consumer<PaymentPdfProvider>(
        builder: (context, provider, child){
          return _expansionTileWrapper(
            title: 'Payment Voucher Details (भुगतान वाउचर का विवरण)',
            children: [
              inputTextFields(
                label: 'VOUCHER NUMBER* (वाउचर नंबर)',
                inputType: TextInputType.number,
                textEditingController: provider.voucherNumberController,
              ),
              inputTextFields(
                label: 'VOUCHER DATE (तारीख)',
                textEditingController: provider.voucherDateController,
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
                        provider.voucherDateController.text = pickedDate.toLocal().toString().split(' ')[0];
                      });
                    }
                  },
                ),
              ),
              inputTextFields(
                label: 'RECEIVER NAME* (नाम) - (PAID TO NAME)',
                textEditingController: provider.receiverNameController,
              ),
              inputTextFields(
                label: 'RECEIVER PHONE* (फोन) - (PAID TO PHONE)',
                inputType: TextInputType.phone,
                maxLength: 10,
                textEditingController: provider.receiverPhoneController,
              ),
              Row(
                children: [
                  Expanded(
                    child: customDropdown(
                      label: 'PAYMENT TYPE (पेमेंट का प्रकार)',
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
                      label: 'VOUCHER AMOUNT* (वाउचर की रकम)',
                      textEditingController: provider.voucherAmountController,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: customDropdown(
                      label: 'PAYMENT MODE (भुगतान का प्रकार)',
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
                      inputType: TextInputType.number,
                      label: 'NUMBER (नंबर)',
                      textEditingController: provider.transactionNumberController,
                    ),
                  ),
                ],
              ),
              inputTextFields(
                label: 'PAY FOR (के लिए भुगतान) (ON ACCOUNT OF)',
                textEditingController: provider.payForController,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Text(
                  '(Ex: Driver, Plumber, Material)',
                  style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
                ),
              ),
              inputTextFields(
                label: 'REMARK (टिप्पणी)',
                textEditingController: provider.remarkController,
                maxLines: 2,
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
