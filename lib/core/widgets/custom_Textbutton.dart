import 'package:BillBook/core/widgets/custom_image_view.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color? buttonColor;
  final Color? borderColor; // New nullable border color parameter
  final Color? textColor; // New nullable text color parameter
  final Icon? icon;
  final String? imagePath;

  const CustomButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.buttonColor,
    this.borderColor, // Include border color in the constructor
    this.textColor, // Include text color in the constructor
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
            color: borderColor ?? Colors.transparent, // Use transparent if no border color is provided
            width: 2, // You can adjust the border width as needed
          ),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[
                icon!, // Display the icon if it's provided
                const SizedBox(width: 8), // Add some spacing between icon and text
              ],
              if ( imagePath!= null) ...[
                CustomImageView(imagePath: imagePath,height: screenHeight * 0.05,), // Display the icon if it's provided
                const SizedBox(width: 8), // Add some spacing between icon and text
              ],
              Text(
                label,
                style: TextStyle(
                  color: textColor ?? Colors.white, // Use provided text color or default to white
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