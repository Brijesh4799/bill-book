import 'package:flutter/material.dart';

Widget customDropdown({
  final String? title,
  final String? label,
  final String? hintText,
  final String? Function(String?)? val,
  final Function(String?)? onChanged,
  final List<String>? items,
  final String? selectedItem,
  final bool? readOnly,
  final TextStyle? textStyle,
  final Color? borderColor, required controller,
}) {
  return LayoutBuilder(
    builder: (context, constraints) {
      double screenWidth = MediaQuery.of(context).size.width;
      double fontSize = screenWidth * 0.035;

      // Determine the effective selected item
      String? effectiveSelectedItem = selectedItem ?? (items != null && items.isNotEmpty ? items[0] : null);

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label != null && label.trim().isNotEmpty)
            Padding(
              padding: EdgeInsets.only(bottom: screenWidth * 0.01),
              child: Text(
                label,
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
            ),
          DropdownButtonFormField<String>(
            validator: val,
            onChanged: readOnly == true ? null : onChanged,
            value: effectiveSelectedItem,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(
                color: Colors.grey,
                fontSize: fontSize,
              ),
              labelText: title ?? hintText,
              labelStyle: TextStyle(
                color: Colors.grey,
                fontSize: fontSize,
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.04,
                vertical: screenWidth * 0.035,
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: borderColor ?? const Color(0xFF137DC7)),
                borderRadius: BorderRadius.circular(10.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: borderColor ?? const Color(0xFF137DC7)),
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: borderColor ?? const Color(0xFF137DC7)),
                borderRadius: BorderRadius.circular(10.0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            items: items?.map((String item) {
              return DropdownMenuItem<String>(

                value: item,
                child: Text(
                  item,
                  style: textStyle ?? TextStyle(fontSize: fontSize, color: Colors.black),
                ),
              );
            }).toList() ?? [], // Ensure items is never null
          ),
          SizedBox(height: screenWidth * 0.03),
        ],
      );
    },
  );
}