
import 'dart:convert';
import 'package:BillBook/WebServices/app_url.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/widgets/custom_app_bar/ui/customAppBar.dart';

class WatermarkScreen extends StatefulWidget {
  @override
  _WatermarkScreenState createState() => _WatermarkScreenState();
}

class _WatermarkScreenState extends State<WatermarkScreen> {
  final Map<String, bool> watermarkSettings = {
    'Quotation': true,
    'Survey': true,
    'Packing': true,
    'Lr bility': true,
    'Car': true,
    'Bill': false,
    'MoneyReceipt': false,
    'PaymentVoucher': false,
    'Tws': false,
    'ForScf': false,
  };

  final Map<String, String> watermarkSubtitles = {
    'Quotation': 'Show/ Hide watermark on Quotation',
    'Survey': 'Show/ Hide watermark on Survey List',
    'Packing': 'Show/ Hide watermark on Packing List',
    'Lr bility': 'Show/ Hide watermark on Lr/ bilty',
    'Car': 'Show/ Hide watermark on Car Condition',
    'Bill': 'Show/ Hide watermark on Bill',
    'MoneyReceipt': 'Show/ Hide watermark on Money Receipt',
    'PaymentVoucher': 'Show/ Hide watermark on Payment Voucher',
    'Tws': 'Show/ Hide watermark on TWS form',
    'ForScf': 'Show/ Hide watermark on Fov form',
  };

  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double fontSize = screenWidth * 0.04;
    final double subtitleSize = screenWidth * 0.035;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: 'Watermark',
      ),
      body: Column(
        children: [
          if (_loading) const LinearProgressIndicator(),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: watermarkSettings.length,
              itemBuilder: (context, index) {
                String key = watermarkSettings.keys.elementAt(index);
                bool isOn = watermarkSettings[key]!;

                return Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 1,
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  child: ListTile(
                    contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    title: Text(
                      key,
                      style: TextStyle(
                        fontSize: fontSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text(
                        watermarkSubtitles[key] ?? '',
                        style: TextStyle(
                          fontSize: subtitleSize,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    trailing: Switch(
                      value: isOn,
                      activeColor: Colors.green,
                      inactiveThumbColor: Colors.white,
                      inactiveTrackColor: Colors.grey.shade400,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      onChanged: (value) async {
                        setState(() {
                          watermarkSettings[key] = value;
                          _loading = true;
                        });

                        await sendWatermarkStatus(key, value);

                        setState(() {
                          _loading = false;
                        });
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> sendWatermarkStatus(String key, bool isOn) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("token");

      if (token == null) {
        print("❌ No token found. Please login first.");
        return;
      }

      final String apiUrl = "${AppUrl.baseUrl}/api/user/watermark/toggle";
    //  final String apiUrl = "http://192.168.1.12:5050 /api/user/watermark/toggle";

      print("➡️ Hitting API: $apiUrl");
      print("📦 Payload: {pdfType: $key, enableWatermark: ${isOn ? true : false}}");
      print("🔑 Token: $token");

      final response = await http.patch(
        Uri.parse(apiUrl),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
        body: jsonEncode({
          "pdfType": key,
          "enableWatermark": isOn,
        }),
      );

      print("✅ API Response for $key");
      print("Status Code: ${response.statusCode}");
      print("Response Body: ${response.body}");

      if (response.statusCode == 200) {
        // Show dialog message in center for successful toggle
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Watermark Updated"),
              content: Text("${key.toUpperCase()} watermark ${isOn ? 'enabled' : 'disabled'}"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close dialog
                  },
                  child: Text("OK"),
                ),
              ],
            );
          },
        );
      }
    } catch (e) {
      print("⚠️ API Error: $e");
      // Silently handle error, no user disruption
    }
  }
}




