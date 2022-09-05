import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:raselne/data_layer/model/user_model.dart';
import 'package:raselne/logic/controller/auth_controller.dart';
import 'package:raselne/utilis/theme.dart';
import 'package:raselne/view_presentation/screen/chat/chat_screen.dart';
import 'package:raselne/view_presentation/screen/store%20drawer/add_category_store.dart';
import 'package:raselne/view_presentation/screen/store%20drawer/add_store.dart';

import '../text_utilis.dart';

class chatWidget extends StatelessWidget {
  const chatWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          // Get.to(() => ChatScreen(orderModel: null,
          //     //   user: UserModel(
          //     //       uid: '0',
          //     //       name: 'bodour',
          //     //       email: 'bodour@gmail.com',
          //     //       mobile: '0567487700', location: null),
          //      )
          // );
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
                    Icons.chat,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: size.width * 0.03,
                ),
                TextUtils(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  text: "Chat".tr,
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
