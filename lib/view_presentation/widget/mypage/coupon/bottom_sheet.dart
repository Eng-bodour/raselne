import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:raselne/utilis/theme.dart';

import 'package:raselne/view_presentation/widget/text_utilis.dart';

Widget bottomSheet(BuildContext context, TextEditingController coupon) {
  Size size = MediaQuery.of(context).size;
  return Directionality(
    textDirection: TextDirection.rtl,
    child: Container(
        height: size.height * 0.9,
        width: double.infinity,
        margin: EdgeInsets.symmetric(
          vertical: size.height * 0.01,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.3),
                  child: TextUtils(
                      fontSize: size.width * 0.05,
                      fontWeight: FontWeight.bold,
                      text: 'أضف كوبون   ',
                      color: Colors.black87,
                      underLine: TextDecoration.none),
                ),
                IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.close,
                      size: size.width * 0.08,
                      color: Colors.black54,
                    )),
              ],
            ),
            Divider(
              thickness: 1,
              color: greyColor.withOpacity(0.2),
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.24,
                      vertical: size.height * 0.03),
                  child: Column(
                    children: [
                      TextUtils(
                          fontSize: size.width * 0.05,
                          fontWeight: FontWeight.bold,
                          text: 'أدخل رقم الكوبون ',
                          color: Colors.black87,
                          underLine: TextDecoration.none),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      TextField(
                        controller: coupon,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: mainColor),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: mainColor),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: mainColor),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: mainColor),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                TextUtils(
                    fontSize: size.width * 0.03,
                    fontWeight: FontWeight.normal,
                    text: 'هل تريد الحصول على مزيد من الكوبونات؟ تابعنا على',
                    color: Colors.black87,
                    underLine: TextDecoration.none),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.34),
                  child: Row(
                    children: [
                      TextUtils(
                          fontSize: size.width * 0.03,
                          fontWeight: FontWeight.normal,
                          text: 'تويتر',
                          color: mainColor,
                          underLine: TextDecoration.underline),
                      TextUtils(
                          fontSize: size.width * 0.03,
                          fontWeight: FontWeight.normal,
                          text: ' و ',
                          color: Colors.black87,
                          underLine: TextDecoration.none),
                      TextUtils(
                          fontSize: size.width * 0.03,
                          fontWeight: FontWeight.normal,
                          text: 'أنستغرام',
                          color: mainColor,
                          underLine: TextDecoration.underline),
                      TextUtils(
                          fontSize: size.width * 0.03,
                          fontWeight: FontWeight.normal,
                          text: ' و ',
                          color: Colors.black87,
                          underLine: TextDecoration.none),
                      TextUtils(
                          fontSize: size.width * 0.03,
                          fontWeight: FontWeight.normal,
                          text: 'فيس بوك',
                          color: mainColor,
                          underLine: TextDecoration.underline),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            Container(
              width: size.width * 0.7,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: mainColor.withOpacity(0.3)),
              child: Center(
                child: TextUtils(
                  color: Colors.white,
                  text: 'تحقق',
                  fontSize: size.width * 0.05,
                  fontWeight: FontWeight.bold,
                  underLine: TextDecoration.none,
                ),
              ),
            ),
          ],
        )),
  );
}
