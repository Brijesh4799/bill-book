import 'package:BillBook/core/widgets/custom_image_view.dart';
import 'package:BillBook/presentaion/homeScreen/home_screen.dart';
import 'package:BillBook/presentaion/homeScreen/quotationScreens/ui/quotaion_screen.dart';
import 'package:BillBook/presentaion/homeScreen/setting/setting_screen.dart';
import 'package:BillBook/presentaion/homeScreen/subscriptionScreen/ui/subscription_screen.dart';
import 'package:flutter/material.dart';

class HomeNavController extends StatefulWidget {
  @override
  HomeNavControllerState createState() => HomeNavControllerState();
}

class HomeNavControllerState extends State<HomeNavController> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    Center(child: Text('QT Design')),
    QuotationScreen(mobileNumber: ''),
    SubscriptionScreen(),
    SettingScreen(),
  ];

  void _onItemTapped(int index) {
    if (index == 2) return;
    setState(() {
      _currentIndex = index;
    });
  }

  Future<bool> _onWillPop() async {
    if (_currentIndex != 0) {
      setState(() {
        _currentIndex = 0;
      });
      return false;
    } else {
      return await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Exit App'),
          content: const Text('Do you want to exit the app?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text('Yes'),
            ),
          ],
        ),
      ) ??
          false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        extendBody: true,
        body: _pages[_currentIndex],
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(),
          onPressed: () {
            setState(() {
              _currentIndex = 2;
            });
          },
          backgroundColor: const Color(0xFF137DC7),
          child: const Icon(Icons.add, size: 32, color: Colors.white),
          elevation: 4,
        ),
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          child: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            notchMargin: 6.0,
            color: Colors.white,
            elevation: 8,
            child: SizedBox(
              height: screenHeight * 0.07,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      _buildBottomNavItem(
                        imagePath: 'assets/images/homeIcon.png',
                        selectedIconPath: 'assets/images/homeFilledIcon.png',
                        index: 0,
                        screenHeight: screenHeight,
                        screenWidth: screenWidth,
                      ),
                      _buildBottomNavItem(
                        imagePath: 'assets/images/qtDesignIcon.png',
                        selectedIconPath: 'assets/images/qtDesignFilledIcon.png',
                        index: 1,
                        screenHeight: screenHeight,
                        screenWidth: screenWidth,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      _buildBottomNavItem(
                        imagePath: 'assets/images/subscriptionIcon.png',
                        selectedIconPath: 'assets/images/subscriptionFilledIcon.png',
                        index: 3,
                        screenHeight: screenHeight,
                        screenWidth: screenWidth,
                      ),
                      _buildBottomNavItem(
                        imagePath: 'assets/images/settingIcon.png',
                        selectedIconPath: 'assets/images/settingFilledIcon.png',
                        index: 4,
                        screenHeight: screenHeight,
                        screenWidth: screenWidth,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavItem({
    required String imagePath,
    required String selectedIconPath,
    required int index,
    required double screenHeight,
    required double screenWidth,
  }) {
    final isSelected = _currentIndex == index;

    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomImageView(
              imagePath: isSelected ? selectedIconPath : imagePath,
              height: screenHeight * 0.06,
              width: screenHeight * 0.06,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }
}
