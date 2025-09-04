import 'package:BillBook/core/widgets/custom_app_bar/ui/customAppBar.dart';
import 'package:flutter/material.dart';
import '../../../core/widgets/custom_Textbutton.dart';

class SwitchAccount extends StatelessWidget {
  final List<String> accounts = [
    "Agreem Solution",
    "user2@example.com",
    "user3@example.com",
    "user4@example.com",
  ];

  final String currentAccount = "Agreem Solution";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:CustomAppBar(title: 'Switch Account',),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: accounts.length,
                itemBuilder: (context, index) {
                  final account = accounts[index];
                  final isSelected = account == currentAccount;
                  return Card(
                    child: ListTile(
                      title: Text(account),
                      trailing: isSelected
                          ? Icon(Icons.check, color: Colors.blue)
                          : null,
                      onTap: () {
                        // Handle account switch logic here
                      },
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16.0),
            CustomButton(
              label: 'Add Account',
              onPressed: ()=>null,
            ),
          ],
        ),
      ),
    );
  }
}

