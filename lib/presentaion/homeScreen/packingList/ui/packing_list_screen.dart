import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/utils/helperFuntions.dart';
import '../../../../core/widgets/custom_app_bar/ui/customAppBar.dart';
import '../../../../core/widgets/custom_additeam_list/ui/custom_AddItem_list.dart';
import '../../../../core/widgets/custom_Textbutton.dart';
import '../../../../core/widgets/custom_input_text_field.dart';
import '../../home_controller.dart';
import '../provider/packingProvider.dart';

class PackingScreen extends StatefulWidget {
  final String mobileNumber;
  const PackingScreen({Key? key, required this.mobileNumber}) : super(key: key);
  @override
  _PackingScreenState createState() => _PackingScreenState();
}

class _PackingScreenState extends State<PackingScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController packingNoController = TextEditingController();
  final TextEditingController moveFromController = TextEditingController();
  final TextEditingController moveToController = TextEditingController();
  final TextEditingController vehicalNoController = TextEditingController();
  TextEditingController itemNameController = TextEditingController();
  TextEditingController itemQuantityController = TextEditingController();
  TextEditingController itemValueController = TextEditingController();
  TextEditingController itemRemarkController = TextEditingController();
  TextEditingController itemCFTController = TextEditingController();
  TextEditingController itemBoxNumberController = TextEditingController();
  List<ListItem> particularItemsDetails = [];

  @override
  void initState() {
    super.initState();
    String todayDate = HelperFunctions().formatDateToDDMMYYYY(DateTime.now());
    dateController.text = todayDate;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Packing List'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCustomerDetailsPackingTile(),
            _buildItemDetailsTile(),
            const SizedBox(height: 80),
          ],
        ),
      ),
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Consumer<PackingProvider>(
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
                    await provider.packinglist(
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
                    'Submit Packing List',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                );
              },
            ),
          ),
        )
    );
  }

  Widget _buildCustomerDetailsPackingTile(){
    return Consumer<PackingProvider>(
        builder: (context, provider, child){
          return _expansionTileWrapper(
            title: 'Customer details for Packing List (पैकिंग सूची के लिए ग्राहक विवरण)',
            children: [
              inputTextFields(
                label: 'NAME (नाम)',
                textEditingController: provider.nameController,
              ),
              inputTextFields(
                label: 'PHONE (फ़ोन)',
                inputType: TextInputType.phone,
                maxLength: 10,
                textEditingController: provider.phoneController,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: inputTextFields(
                      label: 'Packing number (पैकिंग संख्या)',
                      inputType: TextInputType.number,
                      textEditingController: provider.packingNoController,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: inputTextFields(
                      label: 'DATE (तिथि)',
                      textEditingController: provider.dateController,
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
                              provider.dateController.text = pickedDate.toLocal().toString().split(' ')[0];
                            });
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
              inputTextFields(
                label: 'MOVE FROM (कहां से स्थानांतरण)',
                textEditingController: provider.moveFromController,
              ),
              inputTextFields(
                label: 'MOVE TO (कहां तक स्थानांतरण)',
                textEditingController: provider.moveToController,
              ),
              inputTextFields(
                label: 'Vehicle No. (वाहन संख्या)',
                textEditingController: provider.vehicalNoController,
              ),
            ],
          );
        }
    );
  }

  Widget _buildItemDetailsTile() {
    return _expansionTileWrapper(
      title: 'ITEM / PARTICULAR DETAILS (सामान का विवरण)',
      children: [
        Consumer<PackingProvider>(
          builder: (context, provider, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                inputTextFields(
                  label: 'ITEM / PARTICULAR NAME (आइटम / वस्तु का नाम)',
                  textEditingController: provider.itemNameController,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: inputTextFields(
                        label: 'BOX NUMBER (बॉक्स संख्या)',
                        textEditingController: provider.itemBoxNumberController,
                        inputType: TextInputType.number,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: inputTextFields(
                        label: 'QUANTITY (मात्रा)',
                        textEditingController: provider.itemQuantityController,
                        inputType: TextInputType.number,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: inputTextFields(
                        label: 'VALUE (मूल्य)',
                        textEditingController: provider.itemValueController,
                        inputType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: inputTextFields(
                        label: 'CFT (घन फीट)',
                        textEditingController: provider.itemCFTController,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      flex: 3,
                      child: inputTextFields(
                        label: 'REMARK (टिप्पणी)',
                        textEditingController: provider.itemRemarkController,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                CustomButton(
                  label: 'ADD ITEM / PARTICULAR',
                  buttonColor: const Color(0xFFFFBA00),
                  icon: const Icon(Icons.add, color: Colors.white),
                  onPressed: () {
                    if (provider.itemNameController.text.isEmpty ||
                        provider.itemQuantityController.text.isEmpty ||
                        provider.itemValueController.text.isEmpty ||
                        provider.itemBoxNumberController.text.isEmpty ||
                        provider.itemCFTController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Please fill all required fields')),
                      );
                      return;
                    }

                    provider.addItem(
                      itemName: provider.itemNameController.text,
                      boxNumber: provider.itemBoxNumberController.text,
                      quantity: provider.itemQuantityController.text,
                      value: provider.itemValueController.text,
                      cft: provider.itemCFTController.text,
                      remark: provider.itemRemarkController.text,
                    );

                    provider.itemNameController.clear();
                    provider.itemQuantityController.clear();
                    provider.itemValueController.clear();
                    provider.itemRemarkController.clear();
                    provider.itemBoxNumberController.clear();
                    provider.itemCFTController.clear();
                  },
                ),
                const SizedBox(height: 12),

                ...provider.itemParticulars.asMap().entries.map((entry) {
                  final index = entry.key;
                  final item = entry.value;
                  return Card(
                    color: Colors.white,
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    child: ListTile(
                      title: Text(
                        'Item: ${item["itemName"]}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Qty: ${item["quantity"]} | Value: ${item["value"]}'),
                          Text('Box: ${item["boxNumber"]} | CFT: ${item["cft"]}'),
                          if (item["remark"].toString().isNotEmpty)
                            Text('Remark: ${item["remark"]}'),
                        ],
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          provider.removeItem(index);
                        },
                      ),
                    ),
                  );
                }),
              ],
            );
          },
        ),
      ],
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
