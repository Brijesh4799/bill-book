/*
import 'package:BillBook/core/widgets/custom_app_bar/ui/customAppBar.dart';
import 'package:BillBook/core/widgets/custom_image_view.dart';
import 'package:BillBook/presentaion/homeScreen/staffScreen/staff_list/staff_list_ui/staff_list_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../core/widgets/custom_subscription_dialoge.dart';

class StaffReport extends StatefulWidget {
  const StaffReport({super.key});

  @override
  State<StaffReport> createState() => _StaffReportState();
}

class _StaffReportState extends State<StaffReport> {
  int totalStaff = 0;
  int totalActiveStaff = 0;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

  }



  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar:CustomAppBar(title: 'Staff Report',),
      body:

      SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Center(
              child:
                SizedBox(
                  width:screenWidth  * 0.4 ,
                  child: Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                        children: [
                          const Text('Total Staff', style: TextStyle(fontSize: 16)),
                          const SizedBox(height: 8),
                          Text(
                            '$totalStaff',
                            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            ),
            const SizedBox(height: 24),
            Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    CustomImageView(imagePath: 'assets/images/staffListSticker.png',),
                    const SizedBox(height: 16),
                    const Text(
                      'Add Your Staff Account For manage Staff Account From admin Panel',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                          backgroundColor: const Color(0xFF137DC7),
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () {

                          Navigator.push(context, MaterialPageRoute(builder: (context) => const StaffListScreen()));
                        },
                        child: const Text(
                          'Add new Staff',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/


import 'package:BillBook/core/widgets/custom_app_bar/ui/customAppBar.dart';
import 'package:BillBook/core/widgets/custom_image_view.dart';
import 'package:BillBook/presentaion/homeScreen/staffScreen/staff_list/staff_provider/staff_provider.dart';
import 'package:BillBook/presentaion/homeScreen/staffScreen/staff_list/staff_list_ui/staff_list_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/widgets/custom_subscription_dialoge.dart';

class StaffReport extends StatefulWidget {
  const StaffReport({super.key});

  @override
  State<StaffReport> createState() => _StaffReportState();
}

class _StaffReportState extends State<StaffReport> {
  @override
  void initState() {
    super.initState();
    // Fetch staff data from provider
    Future.microtask(() =>
        Provider.of<StaffListProvider>(context, listen: false).fetchStaffList());
  }

  @override
  Widget build(BuildContext context) {
    final staffProvider = Provider.of<StaffListProvider>(context);

    // Safely get counts
    final totalStaff = staffProvider.staffList?.data?.length ?? 0;

    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: CustomAppBar(title: 'Staff Report'),
      body: staffProvider.loading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Center(
              child: SizedBox(
                width: screenWidth * 0.4,
                child: Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      children: [
                        const Text('Total Staff',
                            style: TextStyle(fontSize: 16)),
                        const SizedBox(height: 8),
                        Text(
                          '$totalStaff',
                          style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    CustomImageView(
                      imagePath: 'assets/images/staffListSticker.png',
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Add Your Staff Account For manage Staff Account From admin Panel',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding:
                          const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          backgroundColor: const Color(0xFF137DC7),
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                 // const StaffListScreen()));
                                  const AddStaffScreen()));
                        },
                        child: const Text(
                          'Add new Staff',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
