/*
import 'package:BillBook/presentaion/profile/quotation_setting_screen.dart';
import 'package:BillBook/presentaion/profile/user_profile.dart';
import 'package:BillBook/presentaion/profile/waterMark_screen.dart';
import 'package:flutter/material.dart';

import '../../core/widgets/custom_app_bar/ui/customAppBar.dart';
import '../../core/widgets/custom_image_view.dart';
import '../homeScreen/reportDownloadsScreen/download_report_List.dart';
import 'business_details_screen/ui/bussiness_detaills_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});



    @override
    Widget build(BuildContext context) {
      final String imagePath = 'assets/images/profileImage.png';
      final String name = 'Agree Solutions';
      final String id = 'BSA9876542';
      final double screenWidth = MediaQuery.of(context).size.width;
      final double screenHeight = MediaQuery.of(context).size.height;

      return Scaffold(
        appBar: CustomAppBar(),
        body: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.02,
            vertical: screenHeight * 0.01,
          ),
          children: [
            Card(
              color:Colors.white  ,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 4,
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  CircleAvatar(
                    radius: screenWidth * 0.1,
                    backgroundColor: Colors.yellow[700],
                    child: ClipOval(
                      child: Image.asset(
                        imagePath,
                        fit: BoxFit.cover,
                        width: screenWidth * 0.15,
                        height: screenWidth * 0.15,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: screenWidth * 0.04,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'ID: $id',
                    style: TextStyle(
                      fontSize: screenWidth * 0.025,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Card(
              color:Colors.white  ,
              margin: const EdgeInsets.symmetric(vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  _buildListItem(
                    context,
                    "User  Profile",
                    "Change Login Details",
                    'assets/images/userProfile_Icon.png',
                        (ctx) => userProfile(ctx),
                  ),
                  const Divider(height: 0,),
                  _buildListItem(
                    context,
                    "Business Details",
                    "Change Contact, Address, GST No. Etc",
                    'assets/images/bussinessDetail_Icon.png',
                        (ctx) => businessDetails(ctx),
                  ),
                  const Divider(height: 0,),
                  _buildListItem(
                    context,
                    "Watermark",
                    "Watermark Settings for all Documents",
                    'assets/images/waterMark_Icon.png',
                        (ctx) => watermarkSettings(ctx),
                  ),
                  const Divider(height: 0,),
                  _buildListItem(
                    context,
                    "Quotation",
                    "Change Theme & Form Settings",
                    'assets/images/QuotationIcon.png',
                        (ctx) => quotationSettings(ctx),
                  ),
                  const Divider(height: 0,),
                  _buildListItem(
                    context,
                    "Bill/Invoice",
                    "Change Terms & Conditions Settings",
                    'assets/images/billInvoiceIcon.png',
                        (ctx) => billInvoiceSettings(ctx),
                  ),
                  const Divider(height: 0,),
                  _buildListItem(
                    context,
                    "Download Reports",
                    "Change Contact, Address, GST No. Etc",
                    'assets/images/downloadMenuIcon.png',
                        (ctx) => downloadReports(ctx),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
  }

  Widget _buildListItem(
      BuildContext context,
      String title,
      String subtitle,
      String imagePath,
      Function(BuildContext) onTap,
      ) {
    return ListTile(
      leading: CustomImageView(imagePath:'$imagePath',width: 30,height: 30,),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold,fontSize:14 ),
      ),
      subtitle: Text(subtitle, style: const TextStyle(fontSize:10 ),),
      trailing: const Icon(Icons.arrow_forward_ios, size: 14),
      onTap: () {
        onTap(context);
      },
    );
  }

  void userProfile(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => UserProfile(mobileNumber: '',)),
    );
  }

  void businessDetails(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => BusinessDetailsScreen(mobileNumber: '',)),
    );
  }

  void watermarkSettings(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => WatermarkScreen()),
    );
  }

  void quotationSettings(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => QuotaionSettingScreen()),
    );
  }

  void billInvoiceSettings(BuildContext context) {
    // Implement navigation logic when available
  }

  void downloadReports(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ReportsDownloadListScreen()),
    );
  }


*/


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/widgets/custom_app_bar/provider/profile_provider.dart';
import '../../core/widgets/custom_app_bar/ui/customAppBar.dart';
import '../../core/widgets/custom_image_view.dart';
import '../homeScreen/reportDownloadsScreen/download_report_List.dart';
import '../homescreen_documents_pdf/fov_scf_form_pdf/ui/fov_scf_form_pdf.dart';
import 'bill_invoice_setting_screen.dart';
import 'business_details_screen/ui/bussiness_detaills_screen.dart';
import 'package:BillBook/presentaion/profile/quotation_setting_screen.dart';
import 'package:BillBook/presentaion/profile/user_profile.dart';
import 'package:BillBook/presentaion/profile/waterMark_screen.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  // Helper to generate full image URL from API response
  String getProfileImageUrl(String? path) {
    if (path == null || path.isEmpty) return '';
    final cleanPath = path.replaceAll('\\', '/'); // replace backslashes
    return 'http://167.71.232.245:8970/$cleanPath';
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Fetch profile data on first build
    Future.microtask(() {
      Provider.of<GetProfileProvider>(context, listen: false).profiledataData();
    });

    return Scaffold(
     // appBar: CustomAppBar(),
      body: Consumer<GetProfileProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          final user = provider.profiledata?.user;
          if (user == null) {
            return const Center(child: Text('No user data found'));
          }

          final name = user.name ?? 'No Name';
          final id = user.sId ?? 'N/A';
          final imageUrl = getProfileImageUrl(user.profileImage);

          return ListView(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.02,
              vertical: screenHeight * 0.01,
            ),
            children: [
              SizedBox(height: 35,),


              // Dynamic Profile Card
              /*Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 4,
                child: Column(
                  children: [
                    const SizedBox(height: 16),
                    CircleAvatar(
                      radius: screenWidth * 0.1,
                      backgroundColor: Colors.yellow[700],
                      child: ClipOval(
                        child: imageUrl.isNotEmpty
                            ? Image.network(
                          imageUrl,
                          width: screenWidth * 0.2,
                          height: screenWidth * 0.2,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) =>
                          const Icon(Icons.person, size: 40),
                        )
                            : const Icon(Icons.person, size: 40),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: screenWidth * 0.04,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'ID: $id',
                      style: TextStyle(
                        fontSize: screenWidth * 0.025,
                        color: Colors.grey[600],
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),*/
              Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 4,
                child: Stack(
                  children: [
                    // Main content centered
                   /* Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: screenWidth * 0.1,
                            backgroundColor: Colors.yellow[700],
                            child: ClipOval(
                              child: imageUrl.isNotEmpty
                                  ? Image.network(
                                imageUrl,
                                width: screenWidth * 0.2,
                                height: screenWidth * 0.2,
                                fit: BoxFit.cover,
                                errorBuilder: (_, __, ___) =>
                                const Icon(Icons.person, size: 40),
                              )
                                  : const Icon(Icons.person, size: 40),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            name,
                            style: TextStyle(
                              fontSize: screenWidth * 0.04,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            'ID: $id',
                            style: TextStyle(
                              fontSize: screenWidth * 0.025,
                              color: Colors.grey[600],
                            ),
                          ),
                          const SizedBox(height: 16),
                        ],
                      ),
                    ),*/

                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Center(   // ⬅️ this ensures the column is centered
                        child: Column(
                          mainAxisSize: MainAxisSize.min, // shrink wrap to content
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: screenWidth * 0.1,
                              backgroundColor: Colors.yellow[700],
                              child: ClipOval(
                                child: imageUrl.isNotEmpty
                                    ? Image.network(
                                  imageUrl,
                                  width: screenWidth * 0.2,
                                  height: screenWidth * 0.2,
                                  fit: BoxFit.cover,
                                  errorBuilder: (_, __, ___) =>
                                  const Icon(Icons.person, size: 40),
                                )
                                    : const Icon(Icons.person, size: 40),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              name,
                              style: TextStyle(
                                fontSize: screenWidth * 0.04,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              'ID: $id',
                              style: TextStyle(
                                fontSize: screenWidth * 0.025,
                                color: Colors.grey[600],
                              ),
                            ),
                            const SizedBox(height: 16),
                          ],
                        ),
                      ),
                    ),
                    // Close icon (top-right corner)
                    Positioned(
                      top: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Icon(
                          Icons.close,
                          size: 20,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 18,
                      right: 130,
                      child: GestureDetector(
                        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const BusinessDetailsScreen(mobileNumber: '',)),
          ),
                        child: Icon(
                          Icons.edit,
                          size: 25,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              // Settings List Card
              Card(
                color: Colors.white,
                margin: const EdgeInsets.symmetric(vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    _buildListItem(
                      context,
                      "User Profile",
                      "Change Login Details",
                      'assets/images/userProfile_Icon.png',
                          (ctx) => userProfile(ctx),
                    ),
                    const Divider(height: 0),
                    _buildListItem(
                      context,
                      "Business Details",
                      "Change Contact, Address, GST No. Etc",
                      'assets/images/bussinessDetail_Icon.png',
                          (ctx) => businessDetails(ctx),
                    ),
                    const Divider(height: 0),
                    _buildListItem(
                      context,
                      "Watermark",
                      "Watermark Settings for all Documents",
                      'assets/images/waterMark_Icon.png',
                          (ctx) => watermarkSettings(ctx),
                    ),
                    const Divider(height: 0),
                    _buildListItem(
                      context,
                      "Quotation",
                      "Change Theme & Form Settings",
                      'assets/images/QuotationIcon.png',
                          (ctx) => quotationSettings(ctx),
                    ),
                    const Divider(height: 0),
                    _buildListItem(
                      context,
                      "Bill/Invoice",
                      "Change Terms & Conditions Settings",
                      'assets/images/billInvoiceIcon.png',
                          (ctx) => billInvoiceSettings(ctx),
                    ),
                    const Divider(height: 0),
                    _buildListItem(
                      context,
                      "Download Reports",
                      "Change Contact, Address, GST No. Etc",
                      'assets/images/downloadMenuIcon.png',
                          (ctx) => downloadReports(ctx),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildListItem(
      BuildContext context,
      String title,
      String subtitle,
      String imagePath,
      Function(BuildContext) onTap,
      ) {
    return ListTile(
      leading: CustomImageView(
        imagePath: imagePath,
        width: 30,
        height: 30,
      ),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(fontSize: 10),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 14),
      onTap: () => onTap(context),
    );
  }

  void userProfile(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => UserProfile(
            mobileNumber: '',
          )),
    );
  }

  void businessDetails(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => BusinessDetailsScreen(
            mobileNumber: '',
          )),
    );
  }

  void watermarkSettings(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => WatermarkScreen()),
    );
  }

  void quotationSettings(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => QuotaionSettingScreen()),
    );
  }

  void billInvoiceSettings(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => BillInvoiceSettingScreen()),
    );
  }

  void downloadReports(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ReportsDownloadListScreen()),
    );
  }
}

