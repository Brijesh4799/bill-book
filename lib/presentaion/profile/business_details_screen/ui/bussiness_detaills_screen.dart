/*

import 'dart:io';
import 'dart:typed_data';

import 'package:BillBook/core/widgets/custom_dropDown.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:signature/signature.dart';

import '../../../../core/utils/helperFuntions.dart';
import '../../../../core/widgets/custom_app_bar/ui/customAppBar.dart';
import '../../../../core/widgets/custom_Textbutton.dart';
import '../../../../core/widgets/custom_input_text_field.dart';
import '../../../homeScreen/home_controller.dart';
import '../provider/business_provider.dart';

class BusinessDetailsScreen extends StatefulWidget {
  final String mobileNumber;
  const BusinessDetailsScreen({Key? key, required this.mobileNumber})
      : super(key: key);
  @override
  State<BusinessDetailsScreen> createState() => _BusinessDetailsScreenState();
}

class _BusinessDetailsScreenState extends State<BusinessDetailsScreen> {
  File? signatureImage;
  File? stampImage;

  final ImagePicker _picker = ImagePicker();

  /// For manual signature
  final SignatureController _signatureController = SignatureController(
    penStrokeWidth: 3,
    penColor: Colors.black,
    exportBackgroundColor: Colors.white,
  );

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

  final String imagePath = 'assets/images/profileImage.png';
  File? _selectedImage;

  Future<void> _pickImage() async {
    final XFile? pickedImage =
    await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _selectedImage = File(pickedImage.path);
      });
    }
  }

  @override
  void dispose() {
    _signatureController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: CustomAppBar(title: 'Business Details'),

      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Consumer<BusinessProvider>(
            builder: (context, provider, child) {
              return ElevatedButton(
                onPressed: () async {
                  HelperFunctions helper = HelperFunctions();
                  bool isConnected = await helper.isConnected();

                  if (!isConnected) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('No internet connection')),
                    );
                    return;
                  }

                  await provider.uploadBusinessDocuments(
                    logo: _selectedImage,
                    sign: signatureImage,
                    stamp: stampImage,
                    context: context,
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Save Business Details',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              );
            },
          ),
        ),
      ),

      body: Consumer<BusinessProvider>(builder: (context, provider, child) {
        return SingleChildScrollView(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              /// =================== Business Logo ===================
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        'Business Logo',
                        style: TextStyle(
                          fontSize: screenWidth * 0.045,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      CircleAvatar(
                        radius: screenWidth * 0.15,
                        backgroundColor: Colors.yellow[700],
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            ClipOval(
                              child: _selectedImage != null
                                  ? Image.file(
                                _selectedImage!,
                                fit: BoxFit.cover,
                                width: screenWidth * 0.3,
                                height: screenWidth * 0.3,
                              )
                                  : Image.asset(
                                imagePath, // default image
                                fit: BoxFit.cover,
                                width: screenWidth * 0.3,
                                height: screenWidth * 0.3,
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: GestureDetector(
                                onTap: _pickImage,
                                child: Container(
                                  padding: const EdgeInsets.all(6),
                                  child: Icon(
                                    Icons.camera_alt,
                                    size: screenWidth * 0.07,
                                    color: Colors.black54,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Click on Image to change Logo',
                        style: TextStyle(
                          fontSize: screenWidth * 0.035,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),

              /// =================== Signature / Stamp ===================
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
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

                      /// Manual Signature Canvas
                      Container(
                        height: 150,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Signature(
                          controller: _signatureController,
                          backgroundColor: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 12),

                      /// Save / Clear Buttons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () async {
                              if (_signatureController.isNotEmpty) {
                                Uint8List? data =
                                await _signatureController.toPngBytes();
                                if (data != null) {
                                  final tempDir = Directory.systemTemp.path;
                                  final file = File(
                                      '$tempDir/signature_${DateTime.now().millisecondsSinceEpoch}.png');
                                  await file.writeAsBytes(data);
                                  setState(() {
                                    signatureImage = file;
                                  });
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Signature Saved!')),
                                  );
                                }
                              }
                            },
                            child: const Text("Save"),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              _signatureController.clear();
                              setState(() {
                                signatureImage = null;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red),
                            child: const Text("Clear"),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),

                      /// Signature + Stamp Preview
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
                                      ? Image.file(signatureImage!,
                                      fit: BoxFit.cover)
                                      : const Center(
                                    child: Text(
                                      "No Signature Saved",
                                      style:
                                      TextStyle(color: Colors.grey),
                                    ),
                                  ),
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
                                      ? Image.file(stampImage!,
                                      fit: BoxFit.cover)
                                      : GestureDetector(
                                    onTap: () => pickImage(false),
                                    child: Image.asset(
                                      'assets/images/stamp.jpg',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),

              /// =================== Business Details Form ===================
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Business Details',
                        style: TextStyle(
                          fontSize: screenWidth * 0.045,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),

                      /// 👉 KEEPING ALL YOUR ORIGINAL INPUT FIELDS
                      inputTextFields(
                          textEditingController: provider.companyController,
                          label: 'COMPANY NAME (कंपनी का नाम)'),
                      inputTextFields(
                          textEditingController: provider.taglineController,
                          label: 'TAG LINE/SLOGAN (टैग लाइन/नारा)'),
                      inputTextFields(
                          textEditingController: provider.whatsappnoController,
                          label: 'WHATSAPP NUMBER (WHATSAPP नंबर) *'),
                      Row(
                        children: [
                          Expanded(
                            child: inputTextFields(
                                textEditingController:
                                provider.number1Controller,
                                label: 'CONTACT NO. 1 (मोबाइल नंबर 1)'),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: inputTextFields(
                                textEditingController:
                                provider.number2Controller,
                                label: 'CONTACT NO. 2 (मोबाइल नंबर 2)'),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: inputTextFields(
                              label: 'CONTACT NO. 3 (मोबाइल नंबर 3)',
                              textEditingController:
                              provider.number3Controller,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: inputTextFields(
                                textEditingController:
                                provider.number4Controller,
                                label: 'CONTACT NO. 4 (मोबाइल नंबर 4)'),
                          ),
                        ],
                      ),
                      inputTextFields(
                          textEditingController: provider.landlineController,
                          label: 'LANDLINE NO. (लैंडलाइन नंबर)'),
                      inputTextFields(
                          textEditingController: provider.tollfreeController,
                          label: 'TOLL FREE NO. (टोल फ्री नंबर)'),
                      inputTextFields(
                          textEditingController: provider.companyemailController,
                          label: 'COMPANY EMAIL (कंपनी ईमेल)'),
                      inputTextFields(
                          textEditingController: provider.websideController,
                          label: 'WEBSITE (वेबसाइट)'),
                      Row(
                        children: [
                          Expanded(
                            child: inputTextFields(
                                textEditingController: provider.gstnoController,
                                label: 'GST NUMBER \n(जीएसटी नंबर)'),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: inputTextFields(
                                textEditingController: provider.pannoController,
                                label: 'PAN NUMBER \n(पैन नंबर)'),
                          ),
                        ],
                      ),
                      inputTextFields(
                          textEditingController: provider.addressController,
                          label: 'ADDRESS (पता)',
                          maxLines: 2),
                      Row(
                        children: [
                          Expanded(
                            child: customDropdown(
                                label: 'STATE (राज्य) *',
                                items: ['State 1', 'State 2']),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: inputTextFields(
                                textEditingController: provider.cityController,
                                label: 'CITY (शहर) *'),
                          ),
                        ],
                      ),
                      inputTextFields(
                          textEditingController: provider.jurisdictionController,
                          label: 'JURISDICTION (क्षेत्राधिकार)'),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),

              /// =================== Bank Details ===================
              _buildExpandableSection(title: 'Bank Details (बैंक विवरण)', children: [
                Row(
                  children: [
                    Expanded(
                        child: inputTextFields(
                            textEditingController:
                            provider.baneficiaryController,
                            label: 'BENEFICIARY NAME (नाम)')),
                    const SizedBox(width: 10),
                    Expanded(
                        child: inputTextFields(
                            textEditingController: provider.banknameController,
                            label: 'BANK NAME (बैंक का नाम)')),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        child: inputTextFields(
                            textEditingController: provider.accountnoController,
                            label: 'ACCOUNT NO. \n(खाता नंबर)')),
                    const SizedBox(width: 10),
                    Expanded(
                        child: inputTextFields(
                            textEditingController: provider.ifsccodeController,
                            label: 'IFSC CODE \n(IFSC कोड)')),
                  ],
                ),
                inputTextFields(
                    textEditingController: provider.branchController,
                    label: 'BRANCH (शाखा)'),
              ]),

              /// =================== UPI Details ===================
              _buildExpandableSection(title: 'UPI Details (UPI विवरण)', children: [
                inputTextFields(
                    textEditingController: provider.upiId1Controller,
                    label: 'UPI ID 1'),
                inputTextFields(
                    textEditingController: provider.upiId2Controller,
                    label: 'UPI ID 2'),
                Row(
                  children: [
                    Expanded(
                        child: inputTextFields(
                            textEditingController: provider.phonePeController,
                            label: 'PHONEPE NUMBER')),
                    const SizedBox(width: 10),
                    Expanded(
                        child: inputTextFields(
                            textEditingController: provider.googlePeController,
                            label: 'GOOGLE PAY NUMBER')),
                  ],
                ),
              ]),

              /// =================== Other Details ===================
              _buildExpandableSection(
                  title: 'Other Details (अन्य विवरण)',
                  children: [
                    inputTextFields(
                        textEditingController: provider.affiliatedController,
                        label: 'AFFILIATED BY'),
                    inputTextFields(
                        textEditingController: provider.isoController,
                        label: 'ISO CERTIFICATE DETAILS'),
                    inputTextFields(
                        textEditingController: provider.anynoController,
                        label:
                        'ANY GOVERNMENT REGISTRATION NUMBER (EX. MSME - 1234567890)'),
                  ]),

              const SizedBox(height: 24),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildExpandableSection(
      {required String title, required List<Widget> children}) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ExpansionTile(
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        children: children
            .map((child) => Padding(
          padding:
          const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: child,
        ))
            .toList(),
      ),
    );
  }
}
*/


import 'dart:io';
import 'dart:typed_data';

import 'package:BillBook/core/widgets/custom_dropDown.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:signature/signature.dart';

import '../../../../core/utils/helperFuntions.dart';
import '../../../../core/widgets/custom_app_bar/ui/customAppBar.dart';
import '../../../../core/widgets/custom_Textbutton.dart';
import '../../../../core/widgets/custom_input_text_field.dart';
import '../../../homeScreen/home_controller.dart';
import '../provider/business_provider.dart';

class BusinessDetailsScreen extends StatefulWidget {
  final String mobileNumber;
  const BusinessDetailsScreen({Key? key, required this.mobileNumber})
      : super(key: key);

  @override
  State<BusinessDetailsScreen> createState() => _BusinessDetailsScreenState();
}

class _BusinessDetailsScreenState extends State<BusinessDetailsScreen> {
  final ImagePicker _picker = ImagePicker();

  /// For manual signature
  final SignatureController _signatureController = SignatureController(
    penStrokeWidth: 3,
    penColor: Colors.black,
    exportBackgroundColor: Colors.white,
  );

  final String imagePath = 'assets/images/profileImage.png';

  @override
  void dispose() {
    _signatureController.dispose();
    super.dispose();
  }

  /// Pick logo or stamp image
  Future<void> pickImage(bool isLogo, BusinessProvider provider) async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final file = File(pickedFile.path);
      if (isLogo) {
        provider.setLogo(file);
      } else {
        provider.setStamp(file);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: CustomAppBar(title: 'Business Details'),

      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Consumer<BusinessProvider>(
            builder: (context, provider, child) {
              return ElevatedButton(
                onPressed: () async {
                  HelperFunctions helper = HelperFunctions();
                  bool isConnected = await helper.isConnected();

                  if (!isConnected) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('No internet connection')),
                    );
                    return;
                  }

                  await provider.uploadBusinessDocuments(
                    logo: provider.logoImage,
                    sign: provider.signatureImage,
                    stamp: provider.stampImage,
                    context: context,
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Save Business Details',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              );
            },
          ),
        ),
      ),

      body: Consumer<BusinessProvider>(builder: (context, provider, child) {
        return SingleChildScrollView(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              /// =================== Business Logo ===================
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        'Business Logo',
                        style: TextStyle(
                          fontSize: screenWidth * 0.045,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      CircleAvatar(
                        radius: screenWidth * 0.15,
                        backgroundColor: Colors.yellow[700],
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            ClipOval(
                              child: provider.logoImage != null
                                  ? Image.file(
                                provider.logoImage!,
                                fit: BoxFit.cover,
                                width: screenWidth * 0.3,
                                height: screenWidth * 0.3,
                              )
                                  : Image.asset(
                                imagePath,
                                fit: BoxFit.cover,
                                width: screenWidth * 0.3,
                                height: screenWidth * 0.3,
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: GestureDetector(
                                onTap: () => pickImage(true, provider),
                                child: Container(
                                  padding: const EdgeInsets.all(6),
                                  child: Icon(
                                    Icons.camera_alt,
                                    size: screenWidth * 0.07,
                                    color: Colors.black54,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Click on Image to change Logo',
                        style: TextStyle(
                          fontSize: screenWidth * 0.035,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),

              /// =================== Signature / Stamp ===================
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
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

                      /// Manual Signature Canvas
                      Container(
                        height: 150,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Signature(
                          controller: _signatureController,
                          backgroundColor: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 12),

                      /// Save / Clear Buttons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () async {
                              if (_signatureController.isNotEmpty) {
                                Uint8List? data =
                                await _signatureController.toPngBytes();
                                if (data != null) {
                                  final file = File(
                                      '${Directory.systemTemp.path}/signature_${DateTime.now().millisecondsSinceEpoch}.png');
                                  await file.writeAsBytes(data);
                                  provider.setSignature(file);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Signature Saved!')),
                                  );
                                }
                              }
                            },
                            child: const Text("Save"),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              _signatureController.clear();
                              provider.setSignature(null);
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red),
                            child: const Text("Clear"),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),

                      /// Signature + Stamp Preview
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
                                  child: provider.signatureImage != null
                                      ? Image.file(provider.signatureImage!,
                                      fit: BoxFit.cover)
                                      : const Center(
                                      child: Text(
                                        "No Signature Saved",
                                        style: TextStyle(color: Colors.grey),
                                      )),
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
                                  child: provider.stampImage != null
                                      ? Image.file(provider.stampImage!,
                                      fit: BoxFit.cover)
                                      : GestureDetector(
                                    onTap: () => pickImage(false, provider),
                                    child: Image.asset(
                                      'assets/images/stamp.jpg',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),

              /// =================== Business Details Form ===================
              _buildBusinessDetailsForm(provider, screenWidth),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildBusinessDetailsForm(BusinessProvider provider, double screenWidth) {
    return Column(
      children: [
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Business Details',
                  style: TextStyle(
                    fontSize: screenWidth * 0.045,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),

                /// 👉 KEEPING ALL YOUR ORIGINAL INPUT FIELDS
                inputTextFields(
                    textEditingController: provider.companyController,
                    label: 'COMPANY NAME (कंपनी का नाम)'),
                inputTextFields(
                    textEditingController: provider.taglineController,
                    label: 'TAG LINE/SLOGAN (टैग लाइन/नारा)'),
                inputTextFields(
                    textEditingController: provider.whatsappnoController,
                    label: 'WHATSAPP NUMBER (WHATSAPP नंबर) *'),
                Row(
                  children: [
                    Expanded(
                      child: inputTextFields(
                          textEditingController: provider.number1Controller,
                          label: 'CONTACT NO. 1 (मोबाइल नंबर 1)'),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: inputTextFields(
                          textEditingController: provider.number2Controller,
                          label: 'CONTACT NO. 2 (मोबाइल नंबर 2)'),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: inputTextFields(
                        label: 'CONTACT NO. 3 (मोबाइल नंबर 3)',
                        textEditingController: provider.number3Controller,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: inputTextFields(
                          textEditingController: provider.number4Controller,
                          label: 'CONTACT NO. 4 (मोबाइल नंबर 4)'),
                    ),
                  ],
                ),
                inputTextFields(
                    textEditingController: provider.landlineController,
                    label: 'LANDLINE NO. (लैंडलाइन नंबर)'),
                inputTextFields(
                    textEditingController: provider.tollfreeController,
                    label: 'TOLL FREE NO. (टोल फ्री नंबर)'),
                inputTextFields(
                    textEditingController: provider.companyemailController,
                    label: 'COMPANY EMAIL (कंपनी ईमेल)'),
                inputTextFields(
                    textEditingController: provider.websideController,
                    label: 'WEBSITE (वेबसाइट)'),
                Row(
                  children: [
                    Expanded(
                      child: inputTextFields(
                          textEditingController: provider.gstnoController,
                          label: 'GST NUMBER \n(जीएसटी नंबर)'),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: inputTextFields(
                          textEditingController: provider.pannoController,
                          label: 'PAN NUMBER \n(पैन नंबर)'),
                    ),
                  ],
                ),
                inputTextFields(
                    textEditingController: provider.addressController,
                    label: 'ADDRESS (पता)',
                    maxLines: 2),
                Row(
                  children: [
                    Expanded(
                      child: customDropdown(
                          label: 'STATE (राज्य) *', items: ['State 1', 'State 2'], controller: null),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: inputTextFields(
                          textEditingController: provider.cityController,
                          label: 'CITY (शहर) *'),
                    ),
                  ],
                ),
                inputTextFields(
                    textEditingController: provider.jurisdictionController,
                    label: 'JURISDICTION (क्षेत्राधिकार)'),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        /// =================== Bank Details ===================
        _buildExpandableSection(
            title: 'Bank Details (बैंक विवरण)',
            children: [
              Row(
                children: [
                  Expanded(
                      child: inputTextFields(
                          textEditingController: provider.baneficiaryController,
                          label: 'BENEFICIARY NAME (नाम)')),
                  const SizedBox(width: 10),
                  Expanded(
                      child: inputTextFields(
                          textEditingController: provider.banknameController,
                          label: 'BANK NAME (बैंक का नाम)')),
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: inputTextFields(
                          textEditingController: provider.accountnoController,
                          label: 'ACCOUNT NO. \n(खाता नंबर)')),
                  const SizedBox(width: 10),
                  Expanded(
                      child: inputTextFields(
                          textEditingController: provider.ifsccodeController,
                          label: 'IFSC CODE \n(IFSC कोड)')),
                ],
              ),
              inputTextFields(
                  textEditingController: provider.branchController,
                  label: 'BRANCH (शाखा)'),
            ]),
        /// =================== UPI Details ===================
        _buildExpandableSection(title: 'UPI Details (UPI विवरण)', children: [
          inputTextFields(
              textEditingController: provider.upiId1Controller, label: 'UPI ID 1'),
          inputTextFields(
              textEditingController: provider.upiId2Controller, label: 'UPI ID 2'),
          Row(
            children: [
              Expanded(
                  child: inputTextFields(
                      textEditingController: provider.phonePeController,
                      label: 'PHONEPE NUMBER')),
              const SizedBox(width: 10),
              Expanded(
                  child: inputTextFields(
                      textEditingController: provider.googlePeController,
                      label: 'GOOGLE PAY NUMBER')),
            ],
          ),
        ]),
        /// =================== Other Details ===================
        _buildExpandableSection(title: 'Other Details (अन्य विवरण)', children: [
          inputTextFields(
              textEditingController: provider.affiliatedController,
              label: 'AFFILIATED BY'),
          inputTextFields(
              textEditingController: provider.isoController,
              label: 'ISO CERTIFICATE DETAILS'),
          inputTextFields(
              textEditingController: provider.anynoController,
              label:
              'ANY GOVERNMENT REGISTRATION NUMBER (EX. MSME - 1234567890)'),
        ]),
        const SizedBox(height: 24),
      ],
    );
  }

  Widget _buildExpandableSection(
      {required String title, required List<Widget> children}) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ExpansionTile(
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        children: children
            .map((child) => Padding(
          padding:
          const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: child,
        ))
            .toList(),
      ),
    );
  }
}
