import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget inputTextFields({
  final String? label,
  final String? title,
  final String? hintText,
  final String? Function(String?)? val,
  final Function()? onTap,
  final TextInputType? inputType,
  final Widget? suffix,
  final Widget? prefix,
  final TextInputAction? inputAction,
  final List<TextInputFormatter>? inputFormatter,
  final bool? readOnly,
  final TextEditingController? textEditingController,
  final int? maxLength,
  final int? maxLines,
}) {
  return LayoutBuilder(
    builder: (context, constraints) {
      double screenWidth = MediaQuery.of(context).size.width;
      double fontSize = screenWidth * 0.035;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label != null)
            Padding(
              padding: EdgeInsets.only(bottom: screenWidth * 0.01),
              child: Text(
                label!,
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
            ),
          TextFormField(
            validator: val,
            onTap: onTap,
            textCapitalization: TextCapitalization.words,
            controller: textEditingController,
            keyboardType: inputType ?? TextInputType.text,
            maxLength: maxLength,
            maxLines: maxLines ?? 1,
            textInputAction: inputAction ?? TextInputAction.next,
            readOnly: readOnly ?? false,
            inputFormatters: inputFormatter,
            style: TextStyle(fontSize: fontSize, color: Colors.black),
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
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: Color(0xFF137DC7)),
                borderRadius: BorderRadius.circular(10.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Color(0xFF137DC7)),
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Color(0xFF137DC7)),
                borderRadius: BorderRadius.circular(10.0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red),
                borderRadius: BorderRadius.circular(10.0),
              ),
              counterText: '',
              suffixIcon: suffix,
              prefixIcon: prefix,
              contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
            ),
          ),
          SizedBox(height: screenWidth * 0.03),
        ],
      );
    },
  );
}
