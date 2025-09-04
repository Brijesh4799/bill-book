import 'package:flutter/material.dart';

class BannerWidget extends StatelessWidget {
  final List<String> imagePaths;

  const BannerWidget({super.key, required this.imagePaths});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: PageView.builder(
        itemCount: imagePaths.length,
        itemBuilder: (context, index) {
          final imagePath = imagePaths[index];
          return imagePath.startsWith("http")
              ? Image.network(
            imagePath,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) =>
            const Icon(Icons.broken_image, size: 50),
          )
              : Image.asset(
            imagePath,
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }
}
