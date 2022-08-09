import 'package:flutter/material.dart';

import 'package:raselne/utilis/theme.dart';

import 'package:raselne/view_presentation/widget/home/build_card.dart';
import 'package:raselne/view_presentation/widget/home/build_list.dart';
import 'package:raselne/view_presentation/widget/home/customDrawer.dart';
import 'package:raselne/view_presentation/widget/home/image_slider.dart';
import 'package:raselne/view_presentation/widget/home/search_text_form.dart';
import 'package:raselne/view_presentation/widget/text_utilis.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  //final controller = Get.find<AuthController>();
  List<String> imageList = [
    'assets/services/offer.png',
    'assets/services/restaurant.jpg',
    'assets/services/juice.png',
    'assets/services/market.png',
    'assets/services/sweet.png',
    'assets/services/pharmacy.png',
    'assets/services/charity.png',
    'assets/services/card-digit.png',
    'assets/services/service.png',
    'assets/services/coffee.png',
    'assets/services/gifts.png',
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
            backgroundColor:
                mainColor, // Get.isDarkMode ? darkGreyClr : Colors.white,
            elevation: 0,
            centerTitle: true,
            title: const TextUtils(
              fontSize: f26,
              fontWeight: FontWeight.bold,
              text: 'Raselne',
              color: Colors.white,
              underLine: TextDecoration.none,
            )),
        drawer: CustomDrawer(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.height * 0.01),
              Padding(
                padding: EdgeInsets.only(
                    right: size.width * 0.05, bottom: size.height * 0.01),
                child: const Text('العليا الشرقية'),
              ),
              const ImageSliders(
                imageUrl: 'assets/services/offer.png',
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              const SearchFormText(),
              Padding(
                padding: EdgeInsets.only(
                    right: size.width * 0.05, top: size.height * 0.02),
                child: const Text('الطلبات الحديثة  '),
              ),
              SizedBox(
                height: size.height * 0.15,
                child: const BuildList(),
              ),
              Padding(
                padding: EdgeInsets.only(
                  right: size.width * 0.05,
                  top: size.height * 0.01,
                ),
                child: const Text('الخدمات الأكثر طلباً'),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: size.width * 0.02,
                  right: size.width * 0.02,
                ),
                child: const BuildCard(),
              ),
            ],
          ),
        ),
        //  Column(
        //   children: [
        //     LogOutWidget(),
        //   ],
        // )
        // const Center(
        //   child: Text(
        //     'Main',
        //     style: TextStyle(color: Colors.black),
        //   ),
        // ),
      ),
    );
  }
}
