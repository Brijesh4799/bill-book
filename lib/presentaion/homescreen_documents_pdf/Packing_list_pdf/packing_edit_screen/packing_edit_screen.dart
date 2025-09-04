import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import '../../../../core/utils/helperFuntions.dart';
import '../../../../core/widgets/custom_Textbutton.dart';
import '../../../../core/widgets/custom_additeam_list/ui/custom_AddItem_list.dart';
import '../../../../core/widgets/custom_app_bar/ui/customAppBar.dart';
import '../../../../core/widgets/custom_input_text_field.dart';
import '../../../homeScreen/home_controller.dart';
import '../provider/pcking_list_pdf_provider.dart';
class PackingEditScreen extends StatefulWidget {
  final String id;
  const PackingEditScreen({Key? key, required this.id}) : super(key: key);
  @override
  _PackingEditScreenState createState() => _PackingEditScreenState();
}
class _PackingEditScreenState extends State<PackingEditScreen> {
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

  void _SaveAllValues() {
    print('--- Item / Particular Details ---');
    print('Items: $particularItemsDetails}');
  }
  @override
  void initState() {
    super.initState();
    String todayDate = HelperFunctions().formatDateToDDMMYYYY(DateTime.now());
    dateController.text = todayDate;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<PackingListPdfProvider>(context, listen: false);
      provider.fetchpackingById(id: widget.id);
    });
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
            child: Consumer<PackingListPdfProvider>(
              builder: (context, packingPdfProvider, child) {
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

                    String userId = widget.id; // This is now userId
                    if (userId.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('User ID not found')),
                      );
                      return;
                    }

                    /// ✅ Correct JSON structure for API
                    Map<String, dynamic> updateData = {
                      "formData": {
                        "customerDetails": {
                          "name": packingPdfProvider.nameController.text,
                          "phone": packingPdfProvider.phoneController.text,
                          "packingNumber": packingPdfProvider.packingNoController.text,
                          "date": packingPdfProvider.dateController.text,
                          "moveFrom": packingPdfProvider.moveFromController.text,
                          "moveTo": packingPdfProvider.moveToController.text,
                          "vehicleNo": packingPdfProvider.vehicalNoController.text,
                        },
                        // send items too if required
                        "itemParticulars": []
                      }
                    };


                    var packingData =
                    await packingPdfProvider.fetchPackingById(userId, updateData);

                    if (packingData == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Update packing data')),
                      );
                      return;
                    }

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
    return Consumer<PackingListPdfProvider>(
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
                inputType: TextInputType.number,
                textEditingController: provider.vehicalNoController,
              ),
            ],
          );

        }
    );
  }




 /* Widget _buildItemDetailsTile() {
    return Consumer<PackingListPdfProvider>(
        builder: (context, provider, child){

          return ListView.builder(
            //itemCount: 3,
            shrinkWrap: true,
            itemBuilder: (context,index) {
              return _expansionTileWrapper(
                title: 'ITEM / PARTICULAR DETAILS (सामान का विवरण)',
                children: [
                  inputTextFields(
                    label: 'ITEM NAME (नाम)',
                    textEditingController: provider.itemNameController,
                  ),
                  Row(
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
                  // Button to add new item

                ],
              );
            }
          );
        }
    );
  }*/

  Widget _buildItemDetailsTile() {
    return Consumer<PackingListPdfProvider>(
      builder: (context, provider, child) {
        return Column(
          children: [
            // List of all items in cards
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: provider.items.length,
              itemBuilder: (context, index) {
                final item = provider.items[index];
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                  child: ListTile(
                    title: Text(
                      item.itemName ?? "No name",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                        "Box: ${item.boxNumber ?? '-'} | Qty: ${item.quantity ?? '-'} | Value: ${item.value ?? '-'}"),
                    trailing: const Icon(Icons.edit, color: Colors.blueAccent),
                    onTap: () {
                      // Fill controllers when tapped
                      provider.loadItemIntoControllers(item);
                    },
                  ),
                );
              },
            ),
            const SizedBox(height: 10),

            // Form for selected item
            _expansionTileWrapper(
              title: 'ITEM / PARTICULAR DETAILS (सामान का विवरण)',
              children: [
                inputTextFields(
                  label: 'ITEM NAME (नाम)',
                  textEditingController: provider.itemNameController,
                ),
                Row(
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
              ],
            ),
          ],
        );
      },
    );
  }


  /*Widget _buildItemDetailsTile() {
    return Consumer<PackingListPdfProvider>(
      builder: (context, provider, child) {
        return Column(
          children: [
            // List of all items
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: provider.items.length,
              itemBuilder: (context, index) {
                final item = provider.items[index];
                return ListTile(
                  title: Text(item.itemName ?? "No name"),
                  subtitle: Text("Box: ${item.boxNumber ?? '-'} | Qty: ${item.quantity ?? '-'}"),
                  onTap: () {
                    //provider.loadItemIntoControllers(item);
                  },
                );
              },
            ),
            const SizedBox(height: 10),

            // Form for selected item
            _expansionTileWrapper(
              title: 'ITEM / PARTICULAR DETAILS (सामान का विवरण)',
              children: [
                inputTextFields(
                  label: 'ITEM NAME (नाम)',
                  textEditingController: provider.itemNameController,
                ),
                Row(
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
              ],
            ),
          ],
        );
      },
    );
  }
*/





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
