
import 'package:BillBook/core/widgets/navigation_method.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../WebServices/app_url.dart';
import '../../../../presentaion/homeScreen/notification/notification_provider/notification_provider.dart';
import '../../../../presentaion/homeScreen/notification/notification_ui/notification_ui.dart';
import '../../../../presentaion/profile/profile.dart';
import '../provider/profile_provider.dart';
import '../../../../core/widgets/custom_image_view.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String? title;
  final bool home;
  final bool showBackButton;

  const CustomAppBar({
    Key? key,
    this.title,
    this.home = false,
    this.showBackButton = true,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(90);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  void initState() {
    super.initState();
    if (widget.home) {
      Future.microtask(() {
        // Update profile data
        Provider.of<GetProfileProvider>(context, listen: false).profiledataData();

        // Update notification data
        Provider.of<NotificationProvider>(context, listen: false).fetchNotification();
      });
    }
  }

  String getProfileImageUrl(String? path) {
    if (path == null || path.isEmpty) return '';
    final cleanPath = path.replaceAll('\\', '/');
    return '${AppUrl.baseUrl}/$cleanPath';
   // return 'http://192.168.1.6:5050/$cleanPath';
  }

  @override
  Widget build(BuildContext context) {
    final textScale = MediaQuery.of(context).textScaleFactor;

    return Consumer<GetProfileProvider>(
      builder: (context, provider, child) {
        if (widget.home && provider.isLoading) {
          return const SizedBox(
            height: 70,
            child: Center(child: CircularProgressIndicator()),
          );
        }

        final user = provider.profiledata?.user;

        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: SafeArea(
            bottom: false,
            child: SizedBox(
              height: 65,
              child: Stack(
                children: [
                  // Centered Title
                  Center(
                    child: Text(
                      widget.title ?? '',
                      style: TextStyle(
                        fontSize: 18 * textScale,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  // Back Button
                  if (widget.showBackButton)
                    Positioned(
                      left: 15,
                      top: 0,
                      bottom: 0,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  // Profile Section for home
                  if (widget.home)
                    Positioned(
                      left: 16,
                      top: 0,
                      bottom: 0,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ProfileScreen()),
                          );
                        },
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 26,
                              backgroundColor: Colors.yellow[700],
                              child: user?.profileImage != null && user!.profileImage!.isNotEmpty
                                  ? ClipOval(
                                child: Image.network(
                                  getProfileImageUrl(user.profileImage),
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.cover,
                                  errorBuilder: (_, __, ___) => const Icon(Icons.person),
                                ),
                              )
                                  : const Icon(Icons.person),
                            ),
                            const SizedBox(width: 12),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  user?.name ?? 'No Name',
                                  style: TextStyle(
                                    fontSize: 16 * textScale,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  'ID: ${user?.sId ?? 'N/A'}',
                                  style: TextStyle(
                                    fontSize: 10 * textScale,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  // Right Side Icons - Only on Home Page
                  if (widget.home)
                    Positioned(
                      right: 16,
                      top: 0,
                      bottom: 0,
                      child: Row(
                        children: [
                          CustomImageView(
                            imagePath: 'assets/images/calenderIcon.png',
                            height: 24,
                            width: 24,
                            onTap: () => print('Calendar tapped'),
                          ),
                          const SizedBox(width: 10),
                          Stack(
                            children: [
                              CustomImageView(
                                imagePath: 'assets/images/notificationIcon.png',
                                height: 24,
                                width: 24,
                                onTap: () {
                                  navPush(context: context, action: NotificationScreen());
                                },
                              ),
                              Positioned(
                                right: 0,
                                top: 0,
                                child: Consumer<NotificationProvider>(
                                  builder: (context, provider, child) {
                                    int count = provider.notificationModel?.count ?? 0;
                                    if (count == 0) {
                                      return const SizedBox();
                                    }
                                    return Container(
                                      padding: const EdgeInsets.all(2),
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      constraints: const BoxConstraints(
                                        minWidth: 12,
                                        minHeight: 12,
                                      ),
                                      child: Text(
                                        '$count',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
