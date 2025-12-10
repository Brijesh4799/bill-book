
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/widgets/custom_app_bar/ui/customAppBar.dart';
import '../provider/quotation_tearms_condition_provider.dart'; // make sure the path is correct

class BillTearmsConditionScreen extends StatefulWidget {
  const BillTearmsConditionScreen({super.key});

  @override
  State<BillTearmsConditionScreen> createState() => _BillTearmsConditionScreenState();
}

class _BillTearmsConditionScreenState extends State<BillTearmsConditionScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<QuotationTearmsandCondition>(context, listen: false).billTearmsData();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<QuotationTearmsandCondition>(context);

    return Scaffold(
      appBar: const CustomAppBar(title: 'Bill Terms & Conditions'),
      body: provider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : provider.errorMessage != null
          ? Center(child: Text(provider.errorMessage!))
          : provider.billTearmsCondition == null
          ? const Center(child: Text("No data available"))
          : SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InfoTile(
              title: "Terms & Conditions",
              value: provider.billTearmsCondition?.termAndConditions,
            ),
            InfoTile(
              title: "Privacy Policy",
              value: provider.billTearmsCondition?.privacyPolicy,
            ),
            InfoTile(
              title: "Refund Policy",
              value: provider.billTearmsCondition?.refundPolicy,
            ),
            InfoTile(
              title: "Agreement",
              value: provider.billTearmsCondition?.agreement,
            ),
            InfoTile(
              title: "About Us",
              value: provider.billTearmsCondition?.aboutUs,
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


/*

import 'package:flutter/material.dart';
import '../model/bill_terms_model.dart';
import '../repo/quotation_tearms_condition_repo.dart'; // adjust the path
import '../../../../core/widgets/custom_app_bar/ui/customAppBar.dart'; // adjust the path

class BillTearmsConditionScreen extends StatefulWidget {
  const BillTearmsConditionScreen({super.key});

  @override
  State<BillTearmsConditionScreen> createState() => _BillTearmsConditionScreenState();
}

class _BillTearmsConditionScreenState extends State<BillTearmsConditionScreen> {
  final QuotationTearmsConditionRepo _repo = QuotationTearmsConditionRepo();
  BillTearmsAndConditionModel? _billData;
  bool _isLoading = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    fetchBillTerms();
  }

  Future<void> fetchBillTerms() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      _billData = await _repo.gettearmsbillApi();
      print('Bill Terms Data: $_billData');
    } catch (e) {
      _error = 'Error: ${e.toString()}';
      print(_error);
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Widget buildInfo(String title, String? value) {
    if (value == null || value.trim().isEmpty) {
      return const SizedBox.shrink();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        const SizedBox(height: 5),
        Text(value, style: const TextStyle(fontSize: 16)),
        const Divider(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Bill Terms & Conditions'),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _error != null
          ? Center(child: Text(_error!))
          : _billData == null
          ? const Center(child: Text("No data available"))
          : SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildInfo("Agreement", _billData!.agreement),
            buildInfo("Terms & Conditions", _billData!.termAndConditions),
            buildInfo("Privacy Policy", _billData!.privacyPolicy),
            buildInfo("Refund Policy", _billData!.refundPolicy),
            buildInfo("About Us", _billData!.aboutUs),
          ],
        ),
      ),
    );
  }
}
*/
