import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:raselne/logic/controller/auth_controller.dart';
import 'package:raselne/utilis/theme.dart';
import 'package:raselne/view_presentation/screen/add_store.dart';

import '../text_utilis.dart';

class AddStoreWidget extends StatelessWidget {
  AddStoreWidget({Key? key}) : super(key: key);

  final controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Get.to(() => AddStore());
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
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: size.width * 0.03,
                ),
                TextUtils(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  text: "Add Store".tr,
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
