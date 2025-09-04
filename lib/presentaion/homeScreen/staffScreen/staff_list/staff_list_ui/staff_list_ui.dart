/*
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../core/widgets/custom_app_bar/ui/customAppBar.dart';
import '../staff_provider/staff_provider.dart';

class StaffListScreen extends StatefulWidget {
  const StaffListScreen({super.key});

  @override
  State<StaffListScreen> createState() => _StaffListScreenState();
}

class _StaffListScreenState extends State<StaffListScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch staff data when screen loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<StaffListProvider>(context, listen: false).fetchStaffList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final staffProvider = Provider.of<StaffListProvider>(context);

    return Scaffold(
      appBar:CustomAppBar(title: 'Staff List',),
      body: staffProvider.loading
          ? const Center(child: CircularProgressIndicator())
          : staffProvider.staffList == null ||
          staffProvider.staffList!.data == null ||
          staffProvider.staffList!.data!.isEmpty
          ? const Center(child: Text("No Staff Found"))
          : Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              "Total Staff: ${staffProvider.staffList!.data!.length}",
              style: const TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: staffProvider.staffList!.data!.length,
              itemBuilder: (context, index) {
                final staff = staffProvider.staffList!.data![index];
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Avatar
                      CircleAvatar(
                        radius: 25,
                        backgroundImage: staff.image != null
                            ? NetworkImage(staff.image!)
                            : null,
                        child: staff.image == null
                            ? const Icon(Icons.person, size: 30)
                            : null,
                      ),
                      const SizedBox(width: 12),

                      // Staff info in column
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              staff.name ?? "-",
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text("Email: ${staff.email ?? "-"}"),
                            Text("Phone: ${staff.phone ?? "-"}"),
                            Text("Address: ${staff.address ?? "-"}"),
                          ],
                        ),
                      ),

                      // Index count
                      Text(
                        "${index + 1}",
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                );
              },
            ),
          )

        ],
      ),
    );
  }
}

*/


import 'dart:io';

import 'package:BillBook/core/widgets/custom_app_bar/ui/customAppBar.dart';
import 'package:BillBook/presentaion/homeScreen/staffScreen/staff_list/staff_provider/staff_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddStaffScreen extends StatefulWidget {
  const AddStaffScreen({super.key});

  @override
  State<AddStaffScreen> createState() => _AddStaffScreenState();
}

class _AddStaffScreenState extends State<AddStaffScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  File? selectedImage;
  final ImagePicker _picker = ImagePicker();

  bool isLoading = false;

  Future<void> pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        selectedImage = File(image.path);
      });
    }
  }

  Future<void> submitStaff() async {
    if (!_formKey.currentState!.validate()) return;

    if (selectedImage == null) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Please select an image")));
      return;
    }

    setState(() {
      isLoading = true;
    });

    // Prepare data for POST API
    Map<String, dynamic> newStaffData = {
      "name": nameController.text.trim(),
      "email": emailController.text.trim(),
      "phone": phoneController.text.trim(),
      "address": addressController.text.trim(),
      "image": selectedImage!.path, // You can upload as multipart if backend supports
    };

    try {
      final provider =
      Provider.of<StaffListProvider>(context, listen: false);
      await provider.addNewStaff(newStaffData);

      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Staff added successfully")));
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Error: $e")));
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: const Text("Add New Staff")),
      appBar: CustomAppBar(title: 'Add New Staff',),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Name
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(labelText: "Name"),
                validator: (value) =>
                value!.isEmpty ? "Please enter name" : null,
              ),
              const SizedBox(height: 12),
              // Email
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(labelText: "Email"),
                validator: (value) =>
                value!.isEmpty ? "Please enter email" : null,
              ),
              const SizedBox(height: 12),
              // Phone
              TextFormField(
                controller: phoneController,
                decoration: const InputDecoration(labelText: "Phone"),
                validator: (value) =>
                value!.isEmpty ? "Please enter phone" : null,
              ),
              const SizedBox(height: 12),
              // Address
              TextFormField(
                controller: addressController,
                decoration: const InputDecoration(labelText: "Address"),
                validator: (value) =>
                value!.isEmpty ? "Please enter address" : null,
              ),
              const SizedBox(height: 16),
              // Image Picker
              GestureDetector(
                onTap: pickImage,
                child: Container(
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8)),
                  child: selectedImage == null
                      ? const Center(child: Text("Tap to select image"))
                      : Image.file(selectedImage!, fit: BoxFit.cover),
                ),
              ),
              const SizedBox(height: 24),
              isLoading
                  ? const CircularProgressIndicator()
                  : SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: submitStaff,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Text("Add Staff", style: TextStyle(fontSize: 18)),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


