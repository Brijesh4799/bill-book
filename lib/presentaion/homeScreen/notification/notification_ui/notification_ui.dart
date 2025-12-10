import 'package:BillBook/core/widgets/custom_app_bar/ui/customAppBar.dart';
import 'package:BillBook/presentaion/homeScreen/notification/notification_ui/read_notification.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/widgets/navigation_method.dart';
import '../notification_provider/notification_provider.dart';

class NotificationScreen extends StatefulWidget {
  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<NotificationProvider>(context, listen: false).fetchNotification();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NotificationProvider>(context);
    return Scaffold(
      appBar: CustomAppBar(title: 'Notifications'),
      body: provider.isLoading
          ? Center(child: CircularProgressIndicator())
          : provider.errorMessage != null
          ? Center(child: Text(provider.errorMessage!))
          : provider.notificationModel == null || provider.notificationModel!.data == null
          ? Center(child: Text("No notifications"))
          : ListView.builder(
        itemCount: provider.notificationModel!.data!.length,
        itemBuilder: (context, index) {
          final notification = provider.notificationModel!.data![index];
          return Dismissible(
            key: Key(notification.sId ?? index.toString()),
            direction: DismissDirection.endToStart, // Swipe right to left
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Icon(Icons.delete, color: Colors.white),
            ),
            confirmDismiss: (direction) async {
              return await showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: Text('Delete Notification'),
                  content: Text('Are you sure you want to delete this notification?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(ctx).pop(false),
                      child: Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.of(ctx).pop(true),
                      child: Text('Delete'),
                    ),
                  ],
                ),
              );
            },
            onDismissed: (direction) async {
              bool success = await provider.deleteNotification(notification.sId ?? '');
              if (success) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Notification deleted')),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(provider.errorMessage ?? 'Delete failed')),
                );
              }
            },
            child: ListTile(
              leading: Icon(Icons.notifications),
              title: Text(notification.pdfType ?? "No Title"),
              subtitle: Text(notification.message ?? "No message"),
              trailing: Icon(
                notification.isRead == true ? Icons.check_circle : Icons.circle,
                color: notification.isRead == true ? Colors.green : Colors.grey,
              ),
              onTap: () {
                navPush(
                  context: context,
                  action: ReadNotification(sId: notification.sId ?? ''),
                );
                print("Tapped on notification ${notification.sId}");
              },
            ),
          );
        },
      ),
    );
  }
}
