
import 'package:BillBook/core/widgets/custom_app_bar/ui/customAppBar.dart';
import 'package:BillBook/core/widgets/custom_image_view.dart';
import 'package:BillBook/presentaion/homeScreen/staffScreen/staff_list/staff_list_ui/staff_list_ui.dart';
import 'package:BillBook/presentaion/homeScreen/staffScreen/staff_list/staff_provider/staff_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StaffList extends StatefulWidget {
  const StaffList({super.key});

  @override
  State<StaffList> createState() => _StaffListState();
}

class _StaffListState extends State<StaffList> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      final provider = Provider.of<StaffListProvider>(context, listen: false);
      provider.fetchStaffList();
      provider.fetchactiveStaffList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final staffProvider = Provider.of<StaffListProvider>(context);

    final totalStaff = staffProvider.totalStaffCount;
    final totalActiveStaff = staffProvider.totalActiveStaffCount;

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Staff List',
      ),
      body: staffProvider.loading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
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
                const SizedBox(width: 16),
                Expanded(
                  child: Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                        children: [
                          const Text('Total Active Staff',
                              style: TextStyle(fontSize: 16)),
                          const SizedBox(height: 8),
                          Text(
                            '$totalActiveStaff',
                            style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.green),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
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
