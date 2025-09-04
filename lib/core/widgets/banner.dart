import 'package:carousel_slider/carousel_slider.dart';
import 'package:BillBook/core/widgets/custom_image_view.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';



class BannerWidget extends StatefulWidget {
  final List<String> imagePaths;

  BannerWidget({required this.imagePaths});

  @override
  _BannerWidgetState createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    final double bannerHeight = 100;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadiusGeometry.circular(10)
              ),
              child: SizedBox(
                width: double.infinity,
                height: bannerHeight,
                child: CarouselSlider.builder(
                  itemCount: widget.imagePaths.length,
                  itemBuilder: (BuildContext context, int index, int realIndex) {
                    return SizedBox.expand( // forces image to fill width & height
                      child: CustomImageView(
                        imagePath: widget.imagePaths[index],
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                  options: CarouselOptions(
                    height: bannerHeight,
                    viewportFraction: 1.0,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    onPageChanged: (index, reason) {
                      setState(() {
                        activeIndex = index;
                      });
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            AnimatedSmoothIndicator(
              activeIndex: activeIndex,
              count: widget.imagePaths.length,
              effect: ExpandingDotsEffect(
                dotWidth: 10,
                dotHeight: 10,
                activeDotColor: Colors.blue,
                dotColor: Colors.grey.shade400,
                spacing: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
