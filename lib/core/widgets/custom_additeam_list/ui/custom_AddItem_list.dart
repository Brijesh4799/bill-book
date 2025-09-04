import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../presentaion/homeScreen/surveyScreen/provider/survey_provider.dart';
import '../../custom_Textbutton.dart';
import '../../custom_input_text_field.dart';

class ListItem {
  final String name;
  final String quantity;
  final String value;
  final String remark;
  final String cft;
  final String boxNumber;

  ListItem({
    required this.name,
    required this.quantity,
    required this.value,
    required this.remark,
    required this.cft,
    required this.boxNumber,
  });
}

class ItemEntryListWidget extends StatefulWidget {
  final Function(List<ListItem>) onItemListChanged;
  final String title;
  final bool enableBoxNumber;
  final bool enableCFT;

  const ItemEntryListWidget({
    super.key,
    required this.onItemListChanged,
    this.title = 'ITEM / PARTICULAR DETAILS',
    this.enableBoxNumber = false,
    this.enableCFT = false,
  });

  @override
  State<ItemEntryListWidget> createState() => _ItemEntryListWidgetState();
}

class _ItemEntryListWidgetState extends State<ItemEntryListWidget> {
  List<ListItem> itemList = [];

  void _addItemToList() {
    final provider = Provider.of<SurveyProvider>(context, listen: false);

    if (provider.itemNameController.text.isEmpty ||
        provider.itemQuantityController.text.isEmpty ||
        provider.itemValueController.text.isEmpty ||
        (widget.enableBoxNumber && provider.itemBoxNumberController.text.isEmpty) ||
        (widget.enableCFT && provider.itemCFTController.text.isEmpty)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all required fields')),
      );
      return;
    }

    setState(() {
      final newItem = ListItem(
        name: provider.itemNameController.text,
        quantity: provider.itemQuantityController.text,
        value: provider.itemValueController.text,
        remark: provider.itemRemarkController.text,
        cft: widget.enableCFT ? provider.itemCFTController.text : '',
        boxNumber: widget.enableBoxNumber ? provider.itemBoxNumberController.text : '',
      );

      itemList.add(newItem);
      widget.onItemListChanged(itemList);

      // Clear the provider controllers
      provider.itemNameController.clear();
      provider.itemQuantityController.clear();
      provider.itemValueController.clear();
      provider.itemRemarkController.clear();
      provider.itemBoxNumberController.clear();
      provider.itemCFTController.clear();
    });
  }

  void _deleteItem(int index) {
    setState(() {
      itemList.removeAt(index);
      widget.onItemListChanged(itemList);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SurveyProvider>(
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
                if (widget.enableBoxNumber)
                  Expanded(
                    child: inputTextFields(
                      label: 'BOX NUMBER (बॉक्स संख्या)',
                      textEditingController: provider.itemBoxNumberController,
                      inputType: TextInputType.number,
                    ),
                  ),
                if (widget.enableBoxNumber) const SizedBox(width: 10),
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
                if (widget.enableCFT)
                  Expanded(
                    flex: 1,
                    child: inputTextFields(
                      label: 'CFT (घन फीट)',
                      textEditingController: provider.itemCFTController,
                    ),
                  ),
                if (widget.enableCFT) const SizedBox(width: 10),
                Expanded(
                  flex: widget.enableCFT ? 3 : 1,
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
              icon: const Icon(
                Icons.file_copy_outlined,
                color: Colors.white,
              ),
              onPressed: _addItemToList,
            ),
            const SizedBox(height: 12),
            ...itemList.asMap().entries.map((entry) {
              final index = entry.key;
              final item = entry.value;
              return Card(
                color: Colors.white,
                margin: const EdgeInsets.symmetric(vertical: 6),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                child: ListTile(
                  title: Text(
                    'Item / Particulars: ${item.name} (आइटम / विवरण)',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Qty: ${item.quantity} | Value: ${item.value} (मात्रा | मूल्य)',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      if (widget.enableBoxNumber && item.boxNumber.isNotEmpty)
                        Text(
                          'Box Number: ${item.boxNumber} (बॉक्स संख्या)',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      if (widget.enableCFT && item.cft.isNotEmpty)
                        Text(
                          'CFT: ${item.cft} (घन फीट)',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      if (item.remark.isNotEmpty)
                        Text(
                          'Remark: ${item.remark} (टिप्पणी)',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                    ],
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => _deleteItem(index),
                  ),
                ),
              );
            }),
          ],
        );
      },
    );
  }
}


