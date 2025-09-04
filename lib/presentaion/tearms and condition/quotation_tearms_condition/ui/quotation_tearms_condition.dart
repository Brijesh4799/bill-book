/*

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/widgets/custom_app_bar/ui/customAppBar.dart';
import '../provider/quotation_tearms_condition_provider.dart'; // Update path accordingly

class QuotationTearmsCondition extends StatefulWidget {
  @override
  _QuotationTearmsConditionState createState() => _QuotationTearmsConditionState();
}

class _QuotationTearmsConditionState extends State<QuotationTearmsCondition> {
  @override
  void initState() {
    super.initState();
    // Fetch data when screen loads
    Provider.of<QuotationTearmsandCondition>(context, listen: false).billListData();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<QuotationTearmsandCondition>(context);

    return Scaffold(
      appBar:
      const CustomAppBar(title: 'Terms & Conditions'),
      body: provider.isLoading
          ? Center(child: CircularProgressIndicator())
          : provider.errorMessage != null
          ? Center(child: Text(provider.errorMessage!))
          : provider.tearmscondition == null
          ? Center(child: Text("No data available"))
          : SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           
            InfoTile(title: "Terms & Conditions", value: provider.tearmscondition!.cmsData?.termAndConditions),

          ],
        ),
      ),
    );
  }
}

class InfoTile extends StatelessWidget {
  final String title;
  final String? value;

  const InfoTile({required this.title, this.value});

  @override
  Widget build(BuildContext context) {
    return value == null || value!.isEmpty
        ? SizedBox.shrink()
        : Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 4),
        Text(
          value!,
          style: TextStyle(fontSize: 16),
        ),
        Divider(),
        SizedBox(height: 10),
      ],
    );
  }
}
*/


import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';
import '../../../../core/widgets/custom_app_bar/ui/customAppBar.dart';
import '../provider/quotation_tearms_condition_provider.dart'; // Update path accordingly

class QuotationTearmsCondition extends StatefulWidget {
  const QuotationTearmsCondition({super.key});

  @override
  State<QuotationTearmsCondition> createState() => _QuotationTearmsConditionState();
}

class _QuotationTearmsConditionState extends State<QuotationTearmsCondition> {
  @override
  void initState() {
    super.initState();
    // Fetch data when screen loads safely
    Future.microtask(() {
      Provider.of<QuotationTearmsandCondition>(context, listen: false).billListData();
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
              value: provider.tearmscondition?.cmsData?.termAndConditions,
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

        /// Render HTML instead of plain text
        Html(
          data: value,
          style: {
            "body": Style(
              fontSize: FontSize(16),
              margin: Margins.zero,
            ),
            "p": Style(
              margin: Margins.only(bottom: 6),
            ),
            "ul": Style(
              margin: Margins.only(left: 16, bottom: 6),
            ),
          },
        ),

        const Divider(),
        const SizedBox(height: 10),
      ],
    );
  }
}


/*class InfoTile extends StatelessWidget {
  final String title;
  final String? value;

  const InfoTile({super.key, required this.title, this.value});

  @override
  Widget build(BuildContext context) {
    if (value == null || value!.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(
          value!,
          style: const TextStyle(fontSize: 16),
        ),
        const Divider(),
        const SizedBox(height: 10),
      ],
    );
  }
}*/
