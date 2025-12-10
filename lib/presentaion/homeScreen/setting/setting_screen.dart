import 'package:BillBook/presentaion/homeScreen/setting/switch_account.dart';
import 'package:flutter/material.dart';
import '../../../core/localStorage/auth_token.dart';
import '../../../core/widgets/custom_app_bar/ui/customAppBar.dart';
import '../../../core/widgets/custom_image_view.dart';
import '../../onboardingScreen/splash_screen.dart';
import 'cms/cms_ui/cms_ui.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CustomAppBar(title: 'Settings',showBackButton: false,),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.05,
          vertical: screenHeight * 0.02,
        ),
        children: [
          _buildListItem(
            context,
            "About Us",
            "About BillBook",
            'assets/images/aboutUs_Icon.png',
                (ctx) => aboutUs(ctx),
          ),
          _buildListItem(
            context,
            "Logout",
            "Logout from your account",
            'assets/images/logOutIcon.png',
                (ctx) => logoutDialog(ctx),
          ),
        ],
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
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: CustomImageView(imagePath: imagePath),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          onTap(context);
        },
      ),
    );
  }
  void aboutUs(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CmsScreen()),
    );
  }
  void switchAccount(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SwitchAccount()),
    );
  }
  void logoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        title: const Text('Confirm Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () async {
              Navigator.of(context).pop();
              final tokenBefore = await AuthTokenProvider().getToken();
              print(" Token before clear: $tokenBefore");
              await AuthTokenProvider().clearToken();
              final tokenAfter = await AuthTokenProvider().getToken();
              print(" Token after clear: $tokenAfter");
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const SplashScreen()),
                    (Route<dynamic> route) => false,
              );
            },
            child: const Text('Yes'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('No'),
          ),
        ],
      ),
    );
  }
}
