/*
import 'package:flutter/material.dart';
import '../../core/widgets/custom_app_bar/ui/customAppBar.dart';
class WatermarkScreen extends StatefulWidget {
  @override
  _WatermarkScreenState createState() => _WatermarkScreenState();
}

class _WatermarkScreenState extends State<WatermarkScreen> {
  final Map<String, bool> watermarkSettings = {
    'Quotation Watermark': true,
    'Survey List Watermark': true,
    'Packing List Watermark': true,
    'Lr/Bilty Watermark': true,
    'Car/ Vehicle Condition Watermark': true,
    'Bill Watermark': false,
    'Money Receipt Watermark': false,
    'Payment Voucher Watermark': false,
    'TWS Form Watermark': false,
    'FOV- SCF Form Watermark': false,
  };

  final Map<String, String> watermarkSubtitles = {
    'Quotation Watermark': 'Show/ Hide watermark on Quotation',
    'Survey List Watermark': 'Show/ Hide watermark on Survey List',
    'Packing List Watermark': 'Show/ Hide watermark on Packing List',
    'Lr/Bilty Watermark': 'Show/ Hide watermark on Lr/ bilty',
    'Car/ Vehicle Condition Watermark': 'Show/ Hide watermark on Car Condition',
    'Bill Watermark': 'Show/ Hide watermark on Bill',
    'Money Receipt Watermark': 'Show/ Hide watermark on Money Receipt',
    'Payment Voucher Watermark': 'Show/ Hide watermark on Payment Voucher',
    'TWS Form Watermark': 'Show/ Hide watermark on TWS form',
    'FOV- SCF Form Watermark': 'Show/ Hide watermark on Fov form',
  };

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double fontSize = screenWidth * 0.04;
    final double subtitleSize = screenWidth * 0.035;

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Watermark',
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: watermarkSettings.length,
        itemBuilder: (context, index) {
          String key = watermarkSettings.keys.elementAt(index);
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 1,
            margin: const EdgeInsets.symmetric(vertical: 6),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
              trailing:
                Switch(
                  value: watermarkSettings[key]!,
                  activeColor: Colors.green,
                  inactiveThumbColor: Colors.white,
                  inactiveTrackColor: Colors.grey.shade400, 
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  onChanged: (value) {
                    setState(() {
                      watermarkSettings[key] = value;
                    });
                  },
              ),

            ),
          );
        },
      ),
    );
  }
}
*/

import 'dart:convert';
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
    //'Quotation Watermark': true,
    'quotation': true,
    'survey': true,
    'packing': true,
    'lrbility': true,
    'car': true,
    'bill': false,
    'moneyReceipt': false,
    'paymentVoucher': false,
    'tws': false,
    'forScf': false,
  };

  final Map<String, String> watermarkSubtitles = {
   // 'Quotation Watermark': 'Show/ Hide watermark on Quotation',
    'quotation': 'Show/ Hide watermark on Quotation',
    'survey': 'Show/ Hide watermark on Survey List',
    'packing': 'Show/ Hide watermark on Packing List',
    'lrbility': 'Show/ Hide watermark on Lr/ bilty',
    'car': 'Show/ Hide watermark on Car Condition',
    'bill': 'Show/ Hide watermark on Bill',
    'moneyReceipt': 'Show/ Hide watermark on Money Receipt',
    'paymentVoucher': 'Show/ Hide watermark on Payment Voucher',
    'tws': 'Show/ Hide watermark on TWS form',
    'forScf': 'Show/ Hide watermark on Fov form',
  };

  bool _loading = true;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double fontSize = screenWidth * 0.04;
    final double subtitleSize = screenWidth * 0.035;

    return Scaffold(
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
      // Get token from SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("token"); // token saved after login

      if (token == null) {
        print("❌ No token found. Please login first.");
        return;
      }

     // final String apiUrl = "http://192.168.1.34:5050/api/user/watermark/toggle";
      final String apiUrl = "http://167.71.232.245:8970/api/user/watermark/toggle";

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
          "enableWatermark": isOn ? true : false,
        }),
      );

      // Print response in console
      print("✅ API Response for $key");
      print("Status Code: ${response.statusCode}");
      print("Response Body: ${response.body}");

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Updated: $key → ${isOn ? 'Enabled' : 'Disabled'}")),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed: ${response.statusCode}")),
        );
      }
    } catch (e) {
      print("⚠️ API Error: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
    }
  }

}



/*
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../core/widgets/custom_app_bar/ui/customAppBar.dart';

class WatermarkScreen extends StatefulWidget {
  @override
  _WatermarkScreenState createState() => _WatermarkScreenState();
}

class _WatermarkScreenState extends State<WatermarkScreen> {
  final Map<String, bool> watermarkSettings = {
    'Quotation Watermark': true,
    'Survey List Watermark': true,
    'Packing List Watermark': true,
    'Lr/Bilty Watermark': true,
    'Car/ Vehicle Condition Watermark': true,
    'Bill Watermark': false,
    'Money Receipt Watermark': false,
    'Payment Voucher Watermark': false,
    'TWS Form Watermark': false,
    'FOV- SCF Form Watermark': false,
  };

  final Map<String, String> watermarkSubtitles = {
    'Quotation Watermark': 'Show/ Hide watermark on Quotation',
    'Survey List Watermark': 'Show/ Hide watermark on Survey List',
    'Packing List Watermark': 'Show/ Hide watermark on Packing List',
    'Lr/Bilty Watermark': 'Show/ Hide watermark on Lr/ bilty',
    'Car/ Vehicle Condition Watermark': 'Show/ Hide watermark on Car Condition',
    'Bill Watermark': 'Show/ Hide watermark on Bill',
    'Money Receipt Watermark': 'Show/ Hide watermark on Money Receipt',
    'Payment Voucher Watermark': 'Show/ Hide watermark on Payment Voucher',
    'TWS Form Watermark': 'Show/ Hide watermark on TWS form',
    'FOV- SCF Form Watermark': 'Show/ Hide watermark on Fov form',
  };

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double fontSize = screenWidth * 0.04;
    final double subtitleSize = screenWidth * 0.035;

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Watermark',
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: watermarkSettings.length,
        itemBuilder: (context, index) {
          String key = watermarkSettings.keys.elementAt(index);
          bool isOn = watermarkSettings[key]!;

          return Card(
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
                  });

                  final int status = value ? 1 : 0;

                  // Print name + status
                  print(" $key switched to $status");

                  // Call API
                  await sendWatermarkStatus(key, status);
                },
              ),
            ),
          );
        },
      ),
    );
  }
  Future<void> sendWatermarkStatus(String key, int status) async {
    try {
      final response = await http.patch(  Uri.parse("http://167.71.232.245:8970//api/user/watermark/toggle"),
        Uri.parse("http://192.168.1.34:5050//api/user/watermark/toggle"),

        body: {
        "pdfType": key, "enableWatermark": status.toString(),
        }, );
      if (response.statusCode == 200)
      { print(" API Success: $key set to $status"); }
      else { print(" API Failed: ${response.statusCode}"); } }
    catch (e) { print("️ API Error: $e"); } }

        }
    }
*/



