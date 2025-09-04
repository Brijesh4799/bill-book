import 'package:flutter/material.dart';

Widget customCheckbox({
  required bool isChecked,
  required String label,
   Color? labelColor,
   Color? activeColor,
  required Function(bool?) onChanged,
}) {
  return LayoutBuilder(
    builder: (context, constraints) {
      double screenWidth = MediaQuery.of(context).size.width;
      double fontSize = screenWidth * 0.035;

      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Checkbox(
            value: isChecked,
            onChanged: onChanged,
            activeColor: activeColor?? Colors.green,
          ),
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: labelColor ?? Colors.green,
              ),
            ),
          ),
        ],
      );
    },
  );
}