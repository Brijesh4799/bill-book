
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/widgets/custom_app_bar/ui/customAppBar.dart';
import '../provider/quotation_tearms_condition_provider.dart';

class QuotationTearmsCondition extends StatefulWidget {
  const QuotationTearmsCondition({super.key});

  @override
  State<QuotationTearmsCondition> createState() =>
      _QuotationTearmsConditionState();
}

class _QuotationTearmsConditionState extends State<QuotationTearmsCondition> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<QuotationTearmsandCondition>(context, listen: false)
          .billListData();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<QuotationTearmsandCondition>(context);

    return Scaffold(
      appBar: const CustomAppBar(title: 'Terms & Conditions'),
      body: provider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : provider.errorMessage != null
          ? Center(child: Text(provider.errorMessage!))
          : provider.tearmscondition == null
          ? const Center(child: Text("No data available"))
          : SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InfoTile(
              title: "Terms & Conditions",
              value: provider.tearmscondition?.termAndConditions,
            ),
            InfoTile(
              title: "Privacy Policy",
              value: provider.tearmscondition?.privacyPolicy,
            ),
            InfoTile(
              title: "Refund Policy",
              value: provider.tearmscondition?.refundPolicy,
            ),
            InfoTile(
              title: "Agreement",
              value: provider.tearmscondition?.agreement,
            ),
            InfoTile(
              title: "About Us",
              value: provider.tearmscondition?.aboutUs,
            ),
          ],
        ),
      ),
    );
  }
}

class InfoTile extends StatelessWidget {
  final String title;
  final String? value;

  const InfoTile({super.key, required this.title, this.value});

  @override
  Widget build(BuildContext context) {
    if (value == null || value!.trim().isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          value!,
          style: const TextStyle(fontSize: 16),
        ),
        const Divider(),
        const SizedBox(height: 10),
      ],
    );
  }
}
