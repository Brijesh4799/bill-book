import 'package:flutter/material.dart';

class CustomSelectorField extends StatelessWidget {
  final List<String> accessories;
  final Map<String, String> selectedValues;
  final Function(String accessory, String value) onChanged;
  final String? label;
  final String? tableTitle;

  const CustomSelectorField({
    Key? key,
    required this.accessories,
    required this.selectedValues,
    required this.onChanged,
    this.label,
    this.tableTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double fontSize = screenWidth * 0.035;
    Color borderColor = const Color(0xFF137DC7);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenWidth * 0.015),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                label!,
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: borderColor),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Table(
              border: TableBorder.symmetric(
                inside: BorderSide(color: Colors.grey.shade300),
              ),
              columnWidths: const {
                0: FlexColumnWidth(2),
                1: FlexColumnWidth(1),
                2: FlexColumnWidth(1),
              },
              children: [
                TableRow(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                  ),
                  children: [
                    _buildTableHeader(tableTitle??'', fontSize),
                    _buildTableHeader('YES', fontSize),
                    _buildTableHeader('NO', fontSize),
                  ],
                ),
                ...accessories.map((item) {
                  final selected = selectedValues[item] ?? '';
                  return TableRow(
                    children: [
                      _buildAccessoryCell(item, fontSize),
                      _buildRadioCell(
                        groupValue: selected,
                        value: 'YES',
                        onChanged: (val) => onChanged(item, val!),
                        fontSize: fontSize,
                      ),
                      _buildRadioCell(
                        groupValue: selected,
                        value: 'NO',
                        onChanged: (val) => onChanged(item, val!),
                        fontSize: fontSize,
                      ),
                    ],
                  );
                }).toList(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTableHeader(String title, double fontSize) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: fontSize,
        ),
      ),
    );
  }

  Widget _buildAccessoryCell(String text, double fontSize) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(text, style: TextStyle(fontSize: fontSize)),
    );
  }

  Widget _buildRadioCell({
    required String groupValue,
    required String value,
    required ValueChanged<String?> onChanged,
    required double fontSize,
  }) {
    return RadioListTile<String>(
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
      // title: Text(value, style: TextStyle(fontSize: fontSize)),
      dense: true,
      // contentPadding: EdgeInsets.symmetric(horizontal: 8),
      visualDensity: VisualDensity.compact,
    );
  }
}
