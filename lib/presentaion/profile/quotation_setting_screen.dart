import 'package:flutter/material.dart';

import '../../core/widgets/custom_app_bar/ui/customAppBar.dart';
import '../tearms and condition/quotation_tearms_condition/ui/quotation_tearms_condition.dart';

class QuotaionSettingScreen extends StatelessWidget {
  const QuotaionSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Quotation',
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.05,
          vertical: screenHeight * 0.02,
        ),
        children: [
          _buildListItem(
            context,
            "Change Theme",
            "Change Quotation Theme Design",
                (ctx) => changeTheme(ctx),
          ),
          _buildListItem(
            context,
            "Terms & Conditions",
            "Update terms & Condition for quotation",
                (ctx) => termAndCondition(ctx),
          ),
        ],
      ),
    );
  }

  Widget _buildListItem(
      BuildContext context,
      String title,
      String subtitle,
      Function(BuildContext) onTap,
      ) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
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

  void changeTheme(BuildContext context) {
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => UserProfile()),
    // );
  }

  void termAndCondition(BuildContext context) {
     Navigator.push(
       context,
       MaterialPageRoute(builder: (context) => QuotationTearmsCondition()),
     );
  }
}