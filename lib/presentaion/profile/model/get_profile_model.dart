import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SignatureStampCard extends StatefulWidget {
  @override
  _SignatureStampCardState createState() => _SignatureStampCardState();
}

class _SignatureStampCardState extends State<SignatureStampCard> {
  File? signatureImage;
  File? stampImage;

  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage(bool isSignature) async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        if (isSignature) {
          signatureImage = File(pickedFile.path);
        } else {
          stampImage = File(pickedFile.path);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return
      Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Upload Signature/Stamp (हस्ताक्षर/मोहर)',
              style: TextStyle(
                fontSize: screenWidth * 0.045,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),

            /// Buttons
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () => pickImage(true), // Signature
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Create Signature'),
                  ),
                ),
                const SizedBox(width: 10),
                const Text('OR', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(width: 10),
                Expanded(
                  child: TextButton(
                    onPressed: () => pickImage(false), // Stamp
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Upload Stamp'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            /// Show images
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      const Text("Signature"),
                      const SizedBox(height: 8),
                      Container(
                        height: 100,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                        ),
                        child: signatureImage != null
                            ? Image.file(signatureImage!, fit: BoxFit.cover)
                            : Image.asset('assets/images/default_signature.png', fit: BoxFit.cover),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    children: [
                      const Text("Stamp"),
                      const SizedBox(height: 8),
                      Container(
                        height: 100,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                        ),
                        child: stampImage != null
                            ? Image.file(stampImage!, fit: BoxFit.cover)
                            : Image.asset('assets/images/default_stamp.png', fit: BoxFit.cover),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
