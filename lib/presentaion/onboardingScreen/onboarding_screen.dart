import 'package:flutter/material.dart';
import '../../core/widgets/custom_image_view.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'login_screen/ui/login_screen.dart';

class OBScreen extends StatefulWidget {
  const OBScreen({super.key});

  @override
  State<OBScreen> createState() => _OBScreenState();
}

class _OBScreenState extends State<OBScreen> {
  final List<String> OBStickersPaths = [
    'assets/images/OB1Sticker.png',
    'assets/images/OB2Sticker.png',
  ];

  final List<String> OBTextPaths = [
    'assets/images/OB1Text.png',
    'assets/images/OB2Text.png',
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/OB.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30.0, right: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        side: BorderSide(color: Colors.grey),
                      ),
                    ),
                    child: Text(
                      'Skip',
                      style: TextStyle(color: Colors.blue, fontSize: screenWidth * 0.04),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CarouselSlider.builder(
                    itemCount: OBStickersPaths.length,
                    itemBuilder: (context, index, realIndex) {
                      return CustomImageView(
                        imagePath: OBStickersPaths[index],
                        height: screenHeight * 0.5,
                        width: screenWidth * 2,
                      );
                    },
                    options: CarouselOptions(
                      height: screenHeight * 0.5,
                      autoPlay: false,
                      autoPlayInterval: Duration(seconds: 3),
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                      enlargeCenterPage: true,
                      enableInfiniteScroll: false,
                    ),
                  ),
                  CustomImageView(
                    imagePath: OBTextPaths[_currentIndex],
                    width: screenWidth * 0.8,
                    margin: EdgeInsets.all(16),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(OBStickersPaths.length, (index) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 4.0),
                        width: 8.0,
                        height: 8.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentIndex == index ? Colors.blue : Colors.grey,
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}