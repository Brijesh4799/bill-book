import 'package:flutter/material.dart';


import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  final TextEditingController? controller; // ✅ optional now
  final String label;
  final List<String> items;
  final String? selectedItem;
  final Function(String?)? onChanged;
  final String? Function(String?)? val;

  const CustomDropdown({
    Key? key,
    this.controller, // ✅ not required anymore
    required this.label,
    required this.items,
    this.selectedItem,
    this.onChanged,
    this.val,
  }) : super(key: key);

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? selectedValue;

  @override
  void initState() {
    super.initState();

    // ✅ if controller has a value, sync with dropdown
    if (widget.controller != null && widget.controller!.text.isNotEmpty) {
      selectedValue = widget.controller!.text;
    } else {
      selectedValue = widget.selectedItem;
      if (widget.controller != null) {
        widget.controller!.text = widget.selectedItem ?? "";
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: selectedValue?.isNotEmpty == true ? selectedValue : null,
      validator: widget.val,
      decoration: InputDecoration(
        labelText: widget.label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      items: widget.items.map((item) {
        return DropdownMenuItem(
          value: item,
          child: Text(item),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          selectedValue = value;

          // ✅ update controller only if passed
          if (widget.controller != null) {
            widget.controller!.text = value ?? "";
          }
        });

        if (widget.onChanged != null) {
          widget.onChanged!(value);
        }
      },
    );
  }
}

/*class CustomDropdown extends StatefulWidget {
  final TextEditingController controller; // ✅ store value here
  final String label;
  final List<String> items;
  final String? selectedItem;
  final Function(String?)? onChanged;
  final String? Function(String?)? val;

  const CustomDropdown({
    Key? key,
    required this.controller,
    required this.label,
    required this.items,
    this.selectedItem,
    this.onChanged,
    this.val,
  }) : super(key: key);

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.selectedItem;
    widget.controller.text = widget.selectedItem ?? ""; // ✅ sync initial
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: selectedValue,
      validator: widget.val,
      decoration: InputDecoration(
        labelText: widget.label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      items: widget.items.map((item) {
        return DropdownMenuItem(
          value: item,
          child: Text(item),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          selectedValue = value;
          widget.controller.text = value ?? ""; // ✅ update controller
        });
        if (widget.onChanged != null) {
          widget.onChanged!(value);
        }
      },
    );
  }
}*/


class DropdownWithInputField2 extends StatelessWidget {
  final String? dropdownValue;
  final String? dropDownhint;
  final Function(String?)? onDropdownChanged;
  final List<String> dropdownItems;
  final String? labelText;
  final bool readOnly;
  final Color? borderColor;  final String? dropdownValue2;
  final String? dropDownhint2;
  final Function(String?)? onDropdownChanged2;
  final List<String> dropdownItems2;
  final String? labelText2;
  final bool readOnly2;
  final Color? borderColor2;

  const DropdownWithInputField2({
    Key? key,
    required this.dropdownValue,
    required this.onDropdownChanged,
    required this.dropdownItems,

    this.labelText,
    this.dropDownhint,
    this.readOnly = false,
    this.borderColor,required this.dropdownValue2,
    required this.onDropdownChanged2,
    required this.dropdownItems2,

    this.labelText2,
    this.dropDownhint2,
    this.readOnly2 = false,
    this.borderColor2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double fontSize = screenWidth * 0.034;
    final Color effectiveBorderColor = borderColor ?? const Color(0xFF137DC7);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenWidth * 0.015),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (labelText != null && labelText!.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(bottom: 6.0),
              child: Text(
                labelText!,
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: fontSize,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: effectiveBorderColor),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: DropdownButtonFormField<String>(
                    value: dropdownValue,
                    items: dropdownItems.map((e) {
                      return DropdownMenuItem(
                        value: e,
                        child: Text(e, style: TextStyle(fontSize: fontSize, color: Colors.black)),
                      );
                    }).toList(),
                    onChanged: readOnly ? null : onDropdownChanged,
                    decoration: InputDecoration(
                      hintText: dropDownhint??'Select',
                      hintStyle: TextStyle(color: Colors.grey, fontSize: fontSize),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: screenWidth * 0.035),
                    ),
                  ),
                ),

                Container(
                  height: 48,
                  width: 1,
                  color: effectiveBorderColor,
                ),
                Expanded(
                  flex: 2,
                  child: DropdownButtonFormField<String>(
                    value: dropdownValue2,
                    items: dropdownItems2.map((e) {
                      return DropdownMenuItem(
                        value: e,
                        child: Text(e, style: TextStyle(fontSize: fontSize, color: Colors.black)),
                      );
                    }).toList(),
                    onChanged: readOnly2 ? null : onDropdownChanged2,
                    decoration: InputDecoration(
                      hintText: dropDownhint2??'Select',
                      hintStyle: TextStyle(color: Colors.grey, fontSize: fontSize),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: screenWidth * 0.035),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DropdownWithInputField extends StatelessWidget {
  final String? dropdownValue;
  final String? dropDownhint;
  final Function(String?)? onDropdownChanged;
  final List<String> dropdownItems;
  final TextEditingController controller;
  final String? hintText;
  final String? labelText;
  final bool readOnly;
  final Color? borderColor;

  const DropdownWithInputField({
    Key? key,
    required this.dropdownValue,
    required this.onDropdownChanged,
    required this.dropdownItems,
    required this.controller,
    this.hintText,
    this.labelText,
    this.dropDownhint,
    this.readOnly = false,
    this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double fontSize = screenWidth * 0.035;
    final Color effectiveBorderColor = borderColor ?? const Color(0xFF137DC7);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenWidth * 0.015),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (labelText != null && labelText!.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(bottom: 6.0),
              child: Text(
                labelText!,
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: fontSize,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: effectiveBorderColor),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: DropdownButtonFormField<String>(
                    value: dropdownValue,
                    items: dropdownItems.map((e) {
                      return DropdownMenuItem(
                        value: e,
                        child: Text(e, style: TextStyle(fontSize: fontSize, color: Colors.black)),
                      );
                    }).toList(),
                    onChanged: readOnly ? null : onDropdownChanged,
                    decoration: InputDecoration(
                      hintText: dropDownhint??'Select',
                      hintStyle: TextStyle(color: Colors.grey, fontSize: fontSize),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: screenWidth * 0.035),
                    ),
                  ),
                ),
                Container(
                  height: 48,
                  width: 1,
                  color: effectiveBorderColor,
                ),
                Expanded(
                  flex: 1,
                  child: TextFormField(
                    readOnly: readOnly,
                    controller: controller,
                    keyboardType: TextInputType.number,
                    style: TextStyle(fontSize: fontSize),
                    decoration: InputDecoration(
                      hintText: hintText ?? '',
                      hintStyle: TextStyle(color: Colors.grey, fontSize: fontSize),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: screenWidth * 0.035),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


/*
import 'package:flutter/material.dart';

class DropdownWithInputField extends StatelessWidget {
  final String? dropdownValue;
  final String? dropDownhint;
  final Function(String?)? onDropdownChanged;
  final List<String> dropdownItems;
  final TextEditingController controller;
  final String? hintText;
  final String? labelText;
  final bool readOnly;
  final Color? borderColor;

  const DropdownWithInputField({
    Key? key,
    required this.dropdownValue,
    required this.onDropdownChanged,
    required this.dropdownItems,
    required this.controller,
    this.hintText,
    this.labelText,
    this.dropDownhint,
    this.readOnly = false,
    this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double fontSize = screenWidth * 0.035;
    final Color effectiveBorderColor = borderColor ?? const Color(0xFF137DC7);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenWidth * 0.015),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (labelText != null && labelText!.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(bottom: 6.0),
              child: Text(
                labelText!,
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: fontSize,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: effectiveBorderColor),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: DropdownButtonFormField<String>(
                    value: dropdownValue,
                    items: dropdownItems.map((e) {
                      return DropdownMenuItem(
                        value: e,
                        child: Text(e, style: TextStyle(fontSize: fontSize, color: Colors.black)),
                      );
                    }).toList(),
                    onChanged: readOnly ? null : onDropdownChanged,
                    decoration: InputDecoration(
                      hintText: dropDownhint??'Select',
                      hintStyle: TextStyle(color: Colors.grey, fontSize: fontSize),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: screenWidth * 0.035),
                    ),
                  ),
                ),
                Container(
                  height: 48,
                  width: 1,
                  color: effectiveBorderColor,
                ),
                Expanded(
                  flex: 1,
                  child: TextFormField(
                    readOnly: readOnly,
                    controller: controller,
                    keyboardType: TextInputType.number,
                    style: TextStyle(fontSize: fontSize),
                    decoration: InputDecoration(
                      hintText: hintText ?? '',
                      hintStyle: TextStyle(color: Colors.grey, fontSize: fontSize),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: screenWidth * 0.035),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class DropdownWithInputField2 extends StatelessWidget {
  final String? dropdownValue;
  final String? dropDownhint;
  final Function(String?)? onDropdownChanged;
  final List<String> dropdownItems;
  final String? labelText;
  final bool readOnly;
  final Color? borderColor;  final String? dropdownValue2;
  final String? dropDownhint2;
  final Function(String?)? onDropdownChanged2;
  final List<String> dropdownItems2;
  final String? labelText2;
  final bool readOnly2;
  final Color? borderColor2;

  const DropdownWithInputField2({
    Key? key,
    required this.dropdownValue,
    required this.onDropdownChanged,
    required this.dropdownItems,

   this.labelText,
    this.dropDownhint,
    this.readOnly = false,
    this.borderColor,required this.dropdownValue2,
    required this.onDropdownChanged2,
    required this.dropdownItems2,

   this.labelText2,
    this.dropDownhint2,
    this.readOnly2 = false,
    this.borderColor2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double fontSize = screenWidth * 0.034;
    final Color effectiveBorderColor = borderColor ?? const Color(0xFF137DC7);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenWidth * 0.015),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (labelText != null && labelText!.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(bottom: 6.0),
              child: Text(
                labelText!,
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: fontSize,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: effectiveBorderColor),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: DropdownButtonFormField<String>(
                    value: dropdownValue,
                    items: dropdownItems.map((e) {
                      return DropdownMenuItem(
                        value: e,
                        child: Text(e, style: TextStyle(fontSize: fontSize, color: Colors.black)),
                      );
                    }).toList(),
                    onChanged: readOnly ? null : onDropdownChanged,
                    decoration: InputDecoration(
                      hintText: dropDownhint??'Select',
                      hintStyle: TextStyle(color: Colors.grey, fontSize: fontSize),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: screenWidth * 0.035),
                    ),
                  ),
                ),

                Container(
                  height: 48,
                  width: 1,
                  color: effectiveBorderColor,
                ),
                Expanded(
                  flex: 2,
                  child: DropdownButtonFormField<String>(
                    value: dropdownValue2,
                    items: dropdownItems2.map((e) {
                      return DropdownMenuItem(
                        value: e,
                        child: Text(e, style: TextStyle(fontSize: fontSize, color: Colors.black)),
                      );
                    }).toList(),
                    onChanged: readOnly2 ? null : onDropdownChanged2,
                    decoration: InputDecoration(
                      hintText: dropDownhint2??'Select',
                      hintStyle: TextStyle(color: Colors.grey, fontSize: fontSize),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: screenWidth * 0.035),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
*/
