import 'package:BillBook/core/widgets/custom_image_view.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color? buttonColor;
  final Color? borderColor;
  final Color? textColor;
  final Icon? icon;
  final String? imagePath;

  const CustomButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.buttonColor,
    this.borderColor,
    this.textColor,
    this.icon,
    this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: screenHeight * 0.07,
        decoration: BoxDecoration(
          color: buttonColor ?? const Color(0xFF137DC7),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: borderColor ?? Colors.transparent,
            width: 2,
          ),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[
                icon!,
                const SizedBox(width: 8),
              ],
              if ( imagePath!= null) ...[
                CustomImageView(imagePath: imagePath,height: screenHeight * 0.05,),
                const SizedBox(width: 8),
              ],
              Text(
                label,
                style: TextStyle(
                  color: textColor ?? Colors.white,
                  fontSize: 20,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}