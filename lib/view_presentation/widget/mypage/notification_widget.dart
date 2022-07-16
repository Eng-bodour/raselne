import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:raselne/logic/binding/main_binding.dart';
import 'package:raselne/logic/controller/mypage_controller.dart';
import 'package:raselne/utilis/theme.dart';

import 'package:raselne/view_presentation/widget/text_utilis.dart';

class NotificationWidget extends StatelessWidget {
  NotificationWidget({Key? key}) : super(key: key);
  final controller = Get.find<MyPageController>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          //  toolbarHeight: size.height * 0.2,
          backgroundColor: Colors.white,
          title: const Text(
            'تنبيهات',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.black),
          elevation: 0,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.05, vertical: size.height * 0.04),
          child: Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.notification_add_sharp,
                      color: mainColor,
                    ),
                    SizedBox(
                      width: size.width * 0.04,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextUtils(
                            fontSize: size.width * 0.04,
                            fontWeight: FontWeight.bold,
                            text: 'إعلانات',
                            color: greyColor,
                            underLine: TextDecoration.none),
                        TextUtils(
                            fontSize: size.width * 0.03,
                            fontWeight: FontWeight.normal,
                            text: 'لتنبيهك عن الإعلانات والعروض',
                            color: greyColor,
                            underLine: TextDecoration.none)
                      ],
                    ),
                  ],
                )
                // ,IconButton(onPressed: (){}, icon: icon)
                ,
                Obx(
                  () => Switch(
                    activeTrackColor:
                        mainColor, //Get.isDarkMode ? pinkClr : mainColor,
                    activeColor:
                        mainColor, //Get.isDarkMode ? pinkClr : mainColor,
                    value: controller.swithchValue.value,
                    onChanged: (value) {
                      // ThemeController().changesTheme();
                      controller.swithchValue.value = value;
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
