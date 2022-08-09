import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:raselne/logic/controller/auth_controller.dart';
import 'package:raselne/utilis/theme.dart';

import '../text_utilis.dart';

class CheckWidget extends StatelessWidget {
  const CheckWidget({Key? key}) : super(key: key);

  // final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<AuthProvider>(context);
    var size = MediaQuery.of(context).size;
    return Row(
      children: [
        InkWell(
          onTap: () {
            authProvider.checkBox();
          },
          child: Container(
            height: size.height * 0.04,
            width: size.width * 0.08,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10),
            ),
            child: authProvider.isCheckBox
                ?
                //  Get.isDarkMode
                //     ? const Icon(
                //         Icons.done,
                //         color: darkGreyClr,
                //       )
                //     :
                Image.asset(
                    'assets/images/check.png',
                    color: Colors.amber,
                  )
                : Container(),
          ),
        ),
        SizedBox(
          width: size.width * 0.06,
        ),
        Row(
          children: [
            TextUtils(
              fontSize: f16,
              fontWeight: FontWeight.normal,
              text: "I accept ",
              color: Get.isDarkMode ? Colors.white : Colors.black,
              underLine: TextDecoration.none,
            ),
            TextUtils(
              fontSize: f16,
              fontWeight: FontWeight.normal,
              text: "terms & conditions",
              color: Get.isDarkMode ? Colors.white : Colors.black,
              underLine: TextDecoration.underline,
            ),
          ],
        ),
      ],
    );
    // return GetBuilder<AuthController>(builder: (_) {
    //   return Row(
    //     children: [
    //       InkWell(
    //         onTap: () {
    //           controller.checkBox();
    //         },
    //         child: Container(
    //           height: size.height * 0.04,
    //           width: size.width * 0.08,
    //           decoration: BoxDecoration(
    //             color: Colors.grey.shade200,
    //             borderRadius: BorderRadius.circular(10),
    //           ),
    //           child: controller.isCheckBox
    //               ?
    //               //  Get.isDarkMode
    //               //     ? const Icon(
    //               //         Icons.done,
    //               //         color: darkGreyClr,
    //               //       )
    //               //     :
    //               Image.asset(
    //                   'assets/images/check.png',
    //                   color: Colors.amber,
    //                 )
    //               : Container(),
    //         ),
    //       ),
    //       SizedBox(
    //         width: size.width * 0.06,
    //       ),
    //       Row(
    //         children: [
    //           TextUtils(
    //             fontSize: f16,
    //             fontWeight: FontWeight.normal,
    //             text: "I accept ",
    //             color: Get.isDarkMode ? Colors.white : Colors.black,
    //             underLine: TextDecoration.none,
    //           ),
    //           TextUtils(
    //             fontSize: f16,
    //             fontWeight: FontWeight.normal,
    //             text: "terms & conditions",
    //             color: Get.isDarkMode ? Colors.white : Colors.black,
    //             underLine: TextDecoration.underline,
    //           ),
    //         ],
    //       ),
    //     ],
    //   );
    // });
  }
}
