import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:raselne/routes/routes.dart';
import 'package:raselne/utilis/theme.dart';
import 'package:raselne/view/screen/image_slider_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageSliders extends StatefulWidget {
  final String imageUrl;
  const ImageSliders({
    required this.imageUrl,
    Key? key,
  }) : super(key: key);

  @override
  _ImageSlidersState createState() => _ImageSlidersState();
}

class _ImageSlidersState extends State<ImageSliders> {
  CarouselController carouselController = CarouselController();

  // final cartController = Get.find<CartController>();

  int currentPage = 0;
  int currentColor = 0;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
      children: [
        CarouselSlider.builder(
          itemCount: 5,
          carouselController: carouselController,
          options: CarouselOptions(
              height: 150,
              autoPlay: true,
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
              autoPlayInterval: const Duration(seconds: 1),
              viewportFraction: 1,
              onPageChanged: (index, reson) {
                setState(() {
                  currentPage = index;
                });
              }),
          itemBuilder: (context, index, realIndex) {
            return InkWell(
              onTap: () {
                Get.to(() => ImageSliderScreen(index: index));
              },
              child: Container(
                // margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(widget.imageUrl),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            );
          },
        ),
        Positioned(
          bottom: size.height * 0.01,
          left: size.width * 0.35,
          child: AnimatedSmoothIndicator(
            activeIndex: currentPage,
            count: 5,
            effect: const ExpandingDotsEffect(
              dotHeight: 10,
              dotWidth: 10,
              activeDotColor: mainColor, //Get.isDarkMode ? pinkClr : mainColor,
              dotColor: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
