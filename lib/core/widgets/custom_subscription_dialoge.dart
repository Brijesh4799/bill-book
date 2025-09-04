import 'package:BillBook/core/widgets/custom_image_view.dart';
import 'package:flutter/material.dart';

class ImageSubscriptionDialog extends StatelessWidget {
  final String imagePath;
  final double? width;
  final double? height;

  const ImageSubscriptionDialog({
    Key? key,
    required this.imagePath,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: CustomImageView(
          imagePath: imagePath,
          height: height,
          width: width ?? MediaQuery.of(context).size.width * 0.8,
        )
      ),
    );
  }
}
