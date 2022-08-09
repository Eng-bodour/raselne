import 'package:flutter/material.dart';
import 'package:raselne/utilis/theme.dart';
import 'package:raselne/view_presentation/screen/specific_store_screen.dart';
import 'package:raselne/view_presentation/widget/text_utilis.dart';

Widget AccountBalance(
    {required BuildContext context,
    required Size size,
    required String title,
    required String count}) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(
                Icons.calculate,
                color: Colors.black26,
              ),
              SizedBox(width: size.width * 0.03),
              TextUtils(
                  fontSize: size.width * 0.04,
                  fontWeight: FontWeight.bold,
                  text: title,
                  color: Colors.black87,
                  underLine: TextDecoration.none),
            ],
          ),
          Row(
            children: [
              TextUtils(
                  fontSize: size.width * 0.04,
                  fontWeight: FontWeight.bold,
                  text: count,
                  color: Colors.red,
                  underLine: TextDecoration.none),
              SizedBox(
                width: size.width * 0.02,
              ),
              InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Center(
                          child: AlertDialog(
                              title: Column(
                                children: [
                                  SizedBox(
                                    height: size.height * 0.03,
                                  ),
                                  TextUtils(
                                      fontSize: size.width * 0.042,
                                      fontWeight: FontWeight.bold,
                                      text: 'طريقة الدفع؟ ',
                                      color: greyColor,
                                      underLine: TextDecoration.none),
                                  SizedBox(
                                    height: size.height * 0.03,
                                  ),

                                  containerInkwell(
                                    // ontap: () {},
                                    isBorder: true,
                                    size: size,
                                    text: '  دفع أونلاين  ',
                                  ),

                                  // ),
                                  SizedBox(
                                    height: size.height * 0.01,
                                  ),
                                  containerInkwell(
                                    // ontap: () {},
                                    isBorder: true,
                                    size: size,
                                    text: 'شراء كوبون رسلني ',
                                  ),
                                  SizedBox(
                                    height: size.height * 0.01,
                                  ),
                                  containerInkwell(
                                    // ontap: () {
                                    //   Get.back();
                                    // },
                                    isBorder: false,
                                    size: size,
                                    text: 'إلغاء ',
                                  ),
                                ],
                              ),
                              content: const Text('')),
                        );
                      });
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: mainColor,
                      borderRadius: BorderRadius.circular(size.width * 0.01)),
                  child: Row(
                    children: [
                      const Text('إضافة',
                          style: TextStyle(
                            color: Colors.white,
                          )),
                      Icon(
                        Icons.add,
                        color: Colors.white,
                        size: size.width * 0.04,
                      )
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
      // SizedBox(
      //   height: size.height * 0.01,
      // ),
      // InkWell(
      //   child: Container(
      //     width: size.width,
      //     height: size.height * 0.04,
      //     decoration: BoxDecoration(
      //         borderRadius: BorderRadius.circular(20), color: mainColor),
      //     child: Center(
      //       child: TextUtils(
      //         color: Colors.white,
      //         fontSize: size.width * 0.04,
      //         fontWeight: FontWeight.bold,
      //         text: 'إضافة',
      //         underLine: TextDecoration.none,
      //       ),
      //     ),
      //   ),
      //   onTap: () {
      //     showDialog(
      //         context: context,
      //         builder: (context) {
      //           return Center(
      //             child: AlertDialog(
      //                 title: Column(
      //                   children: [
      //                     SizedBox(
      //                       height: size.height * 0.03,
      //                     ),
      //                     TextUtils(
      //                         fontSize: size.width * 0.042,
      //                         fontWeight: FontWeight.bold,
      //                         text: 'طريقة الدفع؟ ',
      //                         color: greyColor,
      //                         underLine: TextDecoration.none),
      //                     SizedBox(
      //                       height: size.height * 0.03,
      //                     ),

      //                     containerInkwell(
      //                       // ontap: () {},
      //                       isBorder: true,
      //                       size: size,
      //                       text: '  دفع أونلاين  ',
      //                     ),

      //                     // ),
      //                     SizedBox(
      //                       height: size.height * 0.01,
      //                     ),
      //                     containerInkwell(
      //                       // ontap: () {},
      //                       isBorder: true,
      //                       size: size,
      //                       text: 'شراء كوبون رسلني ',
      //                     ),
      //                     SizedBox(
      //                       height: size.height * 0.01,
      //                     ),
      //                     containerInkwell(
      //                       // ontap: () {
      //                       //   Get.back();
      //                       // },
      //                       isBorder: false,
      //                       size: size,
      //                       text: 'إلغاء ',
      //                     ),
      //                   ],
      //                 ),
      //                 content: const Text('')),
      //           );
      //         });
      //   },
      // ),
    ],
  );
}
