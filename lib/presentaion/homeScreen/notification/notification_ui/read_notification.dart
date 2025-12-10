import 'package:BillBook/core/widgets/custom_app_bar/ui/customAppBar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../notification_provider/notification_provider.dart';

class ReadNotification extends StatefulWidget {
  final String sId;
  const ReadNotification({super.key, required this.sId});
  @override
  State<ReadNotification> createState() => _ReadNotificationState();
}

class _ReadNotificationState extends State<ReadNotification> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final provider = Provider.of<NotificationProvider>(context, listen: false);
      await provider.redNotification(widget.sId);
      if (provider.errorMessage != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(provider.errorMessage!)),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Notification read successfully')),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NotificationProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: 'Read Notification'),
      body: Center(
        child: provider.isLoading
            ? const CircularProgressIndicator()
            : provider.readNotificationModel == null ||
            provider.readNotificationModel!.data == null
            ? const Text('No data available')
            : Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Title: ${provider.readNotificationModel!.data?.title ?? 'N/A'}',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                'Message: ${provider.readNotificationModel!.data?.message ?? 'N/A'}',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8),
              Text(
                'PDF Type: ${provider.readNotificationModel!.data?.pdfType ?? 'N/A'}',
                style: const TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 8),
              Text(
                'Created At: ${provider.readNotificationModel!.data?.createdAt ?? 'N/A'}',
                style: const TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 8),
              Text(
                'Is Read: ${provider.readNotificationModel!.data?.isRead == true ? 'Yes' : 'No'}',
                style: const TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
