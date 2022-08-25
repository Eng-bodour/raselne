import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:raselne/logic/controller/auth_controller.dart';
import 'package:raselne/routes/routes.dart';
import 'package:raselne/utilis/theme.dart';

import 'package:raselne/view_presentation/screen/store%20drawer/add_store.dart';
import 'package:raselne/view_presentation/screen_driver/my_page_driver/mypage_driver_screen.dart';

import '../text_utilis.dart';

class Driver extends StatelessWidget {
  const Driver({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Get.off(MyPageDriverScreen());
        },
        splashColor: Get.isDarkMode ? Colors.pink : Colors.green[100],
        borderRadius: BorderRadius.circular(12),
        customBorder: const StadiumBorder(),
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: logOutSettings,
                  ),
                  child: const Icon(
                    Icons.drive_eta,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: size.width * 0.03,
                ),
                TextUtils(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  text: "drive".tr,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  underLine: TextDecoration.none,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}