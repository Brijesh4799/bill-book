/*

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../presentaion/profile/profile.dart';
import '../provider/profile_provider.dart';
import '../../../../core/widgets/custom_image_view.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String? title;
  final bool home;

  const CustomAppBar({Key? key, this.title, this.home = false}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(90);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<GetProfileProvider>(context, listen: false).profiledataData();
    });
  }

  String getProfileImageUrl(String? path) {
    if (path == null || path.isEmpty) return '';
    final cleanPath = path.replaceAll('\\', '/');
    return 'http://167.71.232.245:8970/$cleanPath';
  }

  @override
  Widget build(BuildContext context) {
    final textScale = MediaQuery.of(context).textScaleFactor;

    return Consumer<GetProfileProvider>(
      builder: (context, provider, child) {
        if (provider.isLoading) {
          return const SizedBox(
            height: 90,
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
              height: 90,
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
                  // Back button or home layout
                  if (!widget.home)
                    Positioned(
                      left: 15,
                      top: 0,
                      bottom: 0,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
                        onPressed: () => Navigator.of(context).maybePop(),
                      ),
                    ),
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
                                    fontSize: 12 * textScale,
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
                  if (widget.home)
                    Positioned(
                      right: 16,
                      top: 0,
                      bottom: 0,
                      child: Row(
                        children: [
                          CustomImageView(
                            imagePath: 'assets/images/calenderIcon.png',
                            height: 40,
                            width: 40,
                            onTap: () => print('Calendar tapped'),
                          ),
                          const SizedBox(width: 10),
                          CustomImageView(
                            imagePath: 'assets/images/notificationIcon.png',
                            height: 40,
                            width: 40,
                            onTap: () => print('Notification tapped'),
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
*/

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../presentaion/profile/profile.dart';
import '../provider/profile_provider.dart';
import '../../../../core/widgets/custom_image_view.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String? title;
  final bool home;

  const CustomAppBar({Key? key, this.title, this.home = false}) : super(key: key);

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
        Provider.of<GetProfileProvider>(context, listen: false).profiledataData();
      });
    }
  }

  String getProfileImageUrl(String? path) {
    if (path == null || path.isEmpty) return '';
    final cleanPath = path.replaceAll('\\', '/');
    return 'http://167.71.232.245:8970/$cleanPath';
  }

  @override
  Widget build(BuildContext context) {
    final textScale = MediaQuery.of(context).textScaleFactor;

    // Case 1: Non-home pages (only back button + title, no loading/provider)
    if (!widget.home) {
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
            height: 90,
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
                Positioned(
                  left: 15,
                  top: 0,
                  bottom: 0,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
               onPressed: (){
                      Navigator.pop(context);
               },     //onPressed: () => Navigator.of(context).maybePop(),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    // Case 2: Home page (load profile with Consumer)
    return Consumer<GetProfileProvider>(
      builder: (context, provider, child) {
        if (provider.isLoading) {
          return const SizedBox(
            height: 90,
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
              height: 90,
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
                  // Profile on left
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
                  // Right side icons
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
                        CustomImageView(
                          imagePath: 'assets/images/notificationIcon.png',
                          height: 24,
                          width: 24,
                          //onTap: () => print('Notification tapped'),
                          onTap: () {
                            AwesomeNotifications().createNotification(
                              content: NotificationContent(
                                id: 1,
                                channelKey: 'basic_channel',
                                title: "Test Notification",
                                body: "This is a local test notification 🚀",
                              ),
                            );

                          }
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
