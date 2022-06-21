import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:raselne/logic/controller/auth_controller.dart';
import 'package:raselne/utilis/theme.dart';
import 'package:raselne/view/widget/home/build_card.dart';
import 'package:raselne/view/widget/home/customDrawer.dart';
import 'package:raselne/view/widget/setting/logout_widget.dart';
import 'package:raselne/view/widget/text_utilis.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
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
        drawer: const CustomDrawer(),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // yellow
              Container(
                width: double.infinity,
                height: size.height * 0.25,
                decoration: const BoxDecoration(
                  color: mainColor, // Get.isDarkMode ? darkGreyClr : mainColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: const [
                    SizedBox(height: 20),
                    // SearchFormText(),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    right: size.width * 0.05, top: size.height * 0.04),
                child: const Text('الطلبات الحديثة  '),
              ),

              Padding(
                padding: EdgeInsets.only(
                    right: size.width * 0.05,
                    top: size.height * 0.04,
                    bottom: size.height * 0.01),
                child: const Text('الخدمات الأكثر طلباً'),
              ),

              const Expanded(child: BuildCard()),
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
