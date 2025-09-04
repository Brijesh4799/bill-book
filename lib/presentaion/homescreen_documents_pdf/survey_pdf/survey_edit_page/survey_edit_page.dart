
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/utils/helperFuntions.dart';
import '../../../../core/widgets/custom_Textbutton.dart';
import '../../../../core/widgets/custom_additeam_list/ui/custom_AddItem_list.dart';
import '../../../../core/widgets/custom_app_bar/ui/customAppBar.dart';
import '../../../../core/widgets/custom_input_text_field.dart';
import '../../../homeScreen/home_controller.dart';
import '../provider/survey_pdf_provider.dart';
class SurveyEditScreen extends StatefulWidget {
  final String id;
  const SurveyEditScreen( {
    Key? key,
    required this.id,
  }) : super(key: key);
  @override
  _SurveyEditScreenState createState() => _SurveyEditScreenState();
}
class _SurveyEditScreenState extends State<SurveyEditScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController assessmentSurveyController = TextEditingController();
  final TextEditingController moveFromController = TextEditingController();
  final TextEditingController moveToController = TextEditingController();
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final surveyProvider = Provider.of<SurveyPdfProvider>(context, listen: false);
      surveyProvider.fetchSurveyById(id:widget.id );
    });
  }
  init(){
    //Provider.of<SurveyPdfProvider>(context).fetchSurveyById(id:widget.id );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: 'Survey list'),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildCustomerDetailsSurveyTile(),
              _buildItemDetailsTile(),
              const SizedBox(height: 80),
            ],
          ),
        ),
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Consumer<SurveyPdfProvider>(
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
                    final updateData = {
                      "formData": {
                        "customerDetails": {
                          "name": packingPdfProvider.nameController.text,
                          "phone": packingPdfProvider.phoneController.text,
                          "date": packingPdfProvider.dateController.text,
                          "assessmentSurvey": packingPdfProvider.assessmentSurveyController.text,
                          "moveFrom": packingPdfProvider.moveFromController.text,
                          "moveTo": packingPdfProvider.moveToController.text,
                        },
                        "itemParticulars": [
                          {
                            "itemName": packingPdfProvider.itemNameController.text,
                            "boxNumber": packingPdfProvider.itemBoxNumberController.text,
                            "quantity": packingPdfProvider.itemQuantityController.text,
                            "value": packingPdfProvider.itemValueController.text,
                            "cft": packingPdfProvider.itemCFTController.text,
                            "remark": packingPdfProvider.itemRemarkController.text,
                          }
                        ]
                      }
                    };
                    var packingData = await packingPdfProvider.updateSurveyById(userId, updateData);
                    if (packingData == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('update survey data')),
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
                    'Submit Survey List',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                );
              },
            ),
          ),
        )
    );
  }
  Widget _buildCustomerDetailsSurveyTile(){
    return Consumer<SurveyPdfProvider>(
        builder: (context, provider, child){
          return   _expansionTileWrapper(
            title: 'Customer details for survey List (सर्वेक्षण सूची के लिए ग्राहक विवरण)',
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
                      label: 'ASSESSMENT / SURVEY (मूल्यांकन / सर्वे)',
                      inputType: TextInputType.number,
                      textEditingController: provider.assessmentSurveyController,
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
                label: 'MOVE FROM (जहाँ से सामान जाएगा)',
                textEditingController: provider.moveFromController,
              ),
              inputTextFields(
                label: 'MOVE TO (जहाँ सामान जाना है)',
                textEditingController: provider.moveToController,
              ),
            ],
          );
        }
    );
  }


  /*Widget _buildItemDetailsTile() {
    return Consumer<SurveyPdfProvider>(
      builder: (context, provider, child){
        return _expansionTileWrapper(
          title: 'ITEM / PARTICULAR DETAILS (सामान का विवरण)',
          children: [
            // Input fields to add new item
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
            CustomButton(
              label: 'ADD ITEM',
              buttonColor: const Color(0xFFFFBA00),
              icon: const Icon(Icons.add, color: Colors.white),
              onPressed: () {
                if (itemNameController.text.isEmpty ||
                    itemQuantityController.text.isEmpty ||
                    itemValueController.text.isEmpty ||
                    itemBoxNumberController.text.isEmpty ||
                    itemCFTController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please fill all required fields')),
                  );
                  return;
                }

                setState(() {
                  particularItemsDetails.add(ListItem(
                    name: itemNameController.text,
                    quantity: itemQuantityController.text,
                    value: itemValueController.text,
                    remark: itemRemarkController.text,
                    cft: itemCFTController.text,
                    boxNumber: itemBoxNumberController.text,
                  ));

                  // Clear input fields
                  itemNameController.clear();
                  itemQuantityController.clear();
                  itemValueController.clear();
                  itemRemarkController.clear();
                  itemBoxNumberController.clear();
                  itemCFTController.clear();
                });
              },
            ),
            const SizedBox(height: 12),
            // Display existing items as editable fields
            ...particularItemsDetails.asMap().entries.map((entry) {
              final index = entry.key;
              final item = entry.value;

              // Controllers for each existing item
              final TextEditingController nameCtrl = TextEditingController(text: item.name);
              final TextEditingController boxCtrl = TextEditingController(text: item.boxNumber);
              final TextEditingController qtyCtrl = TextEditingController(text: item.quantity);
              final TextEditingController valueCtrl = TextEditingController(text: item.value);
              final TextEditingController cftCtrl = TextEditingController(text: item.cft);
              final TextEditingController remarkCtrl = TextEditingController(text: item.remark);

              return Card(
                margin: const EdgeInsets.symmetric(vertical: 6),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      inputTextFields(label: 'ITEM NAME', textEditingController: nameCtrl),
                      Row(
                        children: [
                          Expanded(child: inputTextFields(label: 'BOX NUMBER', textEditingController: boxCtrl, inputType: TextInputType.number)),
                          const SizedBox(width: 10),
                          Expanded(child: inputTextFields(label: 'QUANTITY', textEditingController: qtyCtrl, inputType: TextInputType.number)),
                          const SizedBox(width: 10),
                          Expanded(child: inputTextFields(label: 'VALUE', textEditingController: valueCtrl, inputType: TextInputType.number)),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(flex: 1, child: inputTextFields(label: 'CFT', textEditingController: cftCtrl)),
                          const SizedBox(width: 10),
                          Expanded(flex: 3, child: inputTextFields(label: 'REMARK', textEditingController: remarkCtrl)),
                        ],
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            setState(() {
                              particularItemsDetails.removeAt(index);
                            });
                          },
                        ),
                      ),
                      const SizedBox(height: 8),
                      CustomButton(
                        label: 'UPDATE ITEM',
                        buttonColor: Colors.green,
                        icon: const Icon(Icons.save, color: Colors.white),
                        onPressed: () {
                          setState(() {
                            // Update the existing item with new values
                            particularItemsDetails[index] = ListItem(
                              name: nameCtrl.text,
                              boxNumber: boxCtrl.text,
                              quantity: qtyCtrl.text,
                              value: valueCtrl.text,
                              cft: cftCtrl.text,
                              remark: remarkCtrl.text,
                            );
                          });
                        },
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ],
        );
      }
    );
  }*/

  Widget _buildItemDetailsTile() {
    return Consumer<SurveyPdfProvider>(
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




