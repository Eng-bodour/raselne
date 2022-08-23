import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:raselne/logic/controller/auth_controller.dart';
import 'package:raselne/utilis/theme.dart';

import '../text_utilis.dart';

class LogOutWidget extends StatelessWidget {
  const LogOutWidget({Key? key}) : super(key: key);

  // final controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<AuthProvider>(context);
    var size = MediaQuery.of(context).size;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Get.defaultDialog(
            title: "Logout From App",
            titleStyle: const TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            middleText: 'Are you sure you need to logout',
            middleTextStyle: const TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            backgroundColor: Colors.grey,
            radius: 10,
            textCancel: " No ",
            cancelTextColor: Colors.white,
            textConfirm: " YES ",
            confirmTextColor: Colors.white,
            onCancel: () {
              Get.back();
            },
            onConfirm: () {
              authProvider.signOutFromApp();
            },
            buttonColor: mainColor, // Get.isDarkMode ? pinkClr : mainColor,
          );
        },
        splashColor: Get.isDarkMode ? Colors.pink : Colors.green[100],
        borderRadius: BorderRadius.circular(12),
        customBorder: const StadiumBorder(),
        child: const Icon(
          Icons.logout,
          color: mainColor,
        ),
        // child: Directionality(
        //   textDirection: TextDirection.ltr,
        //   child: Row(
        //     children: [
        //       Icon(
        //         Icons.logout,
        //         color: Colors.lightBlue.withOpacity(0.9),
        //       ),
        //       Container(
        //         padding: const EdgeInsets.all(6),
        //         decoration: BoxDecoration(
        //           shape: BoxShape.circle,
        //           color: greyColor.withOpacity(0.2),
        //         ),
        //         child: Icon(
        //           Icons.logout,
        //           color: Colors.lightBlue.withOpacity(0.9),
        //         ),
        //       ),
        //       SizedBox(
        //         width: size.width * 0.03,
        //       ),
        //       TextUtils(
        //         fontSize: 22,
        //         fontWeight: FontWeight.bold,
        //         text: "Logout".tr,
        //         color: Get.isDarkMode ? Colors.white : Colors.black,
        //         underLine: TextDecoration.none,
        //       ),
        //     ],
        //   ),
        // ),
      ),
    );
    // return GetBuilder<AuthController>(
    //   builder: (_) => Material(
    //     color: Colors.transparent,
    //     child: InkWell(
    //       onTap: () {
    //         Get.defaultDialog(
    //           title: "Logout From App",
    //           titleStyle: const TextStyle(
    //             fontSize: 18,
    //             color: Colors.black,
    //             fontWeight: FontWeight.bold,
    //           ),
    //           middleText: 'Are you sure you need to logout',
    //           middleTextStyle: const TextStyle(
    //             fontSize: 18,
    //             color: Colors.black,
    //             fontWeight: FontWeight.bold,
    //           ),
    //           backgroundColor: Colors.grey,
    //           radius: 10,
    //           textCancel: " No ",
    //           cancelTextColor: Colors.white,
    //           textConfirm: " YES ",
    //           confirmTextColor: Colors.white,
    //           onCancel: () {
    //             Get.back();
    //           },
    //           onConfirm: () {
    //             controller.signOutFromApp();
    //           },
    //           buttonColor: mainColor, // Get.isDarkMode ? pinkClr : mainColor,
    //         );
    //       },
    //       splashColor: Get.isDarkMode ? Colors.pink : Colors.green[100],
    //       borderRadius: BorderRadius.circular(12),
    //       customBorder: const StadiumBorder(),
    //       child: const Icon(
    //         Icons.logout,
    //         color: greyColor,
    //       ),
    //       // child: Directionality(
    //       //   textDirection: TextDirection.ltr,
    //       //   child: Row(
    //       //     children: [
    //       //       Icon(
    //       //         Icons.logout,
    //       //         color: Colors.lightBlue.withOpacity(0.9),
    //       //       ),
    //       //       Container(
    //       //         padding: const EdgeInsets.all(6),
    //       //         decoration: BoxDecoration(
    //       //           shape: BoxShape.circle,
    //       //           color: greyColor.withOpacity(0.2),
    //       //         ),
    //       //         child: Icon(
    //       //           Icons.logout,
    //       //           color: Colors.lightBlue.withOpacity(0.9),
    //       //         ),
    //       //       ),
    //       //       SizedBox(
    //       //         width: size.width * 0.03,
    //       //       ),
    //       //       TextUtils(
    //       //         fontSize: 22,
    //       //         fontWeight: FontWeight.bold,
    //       //         text: "Logout".tr,
    //       //         color: Get.isDarkMode ? Colors.white : Colors.black,
    //       //         underLine: TextDecoration.none,
    //       //       ),
    //       //     ],
    //       //   ),
    //       // ),
    //     ),
    //   ),
    // );
  }
}
