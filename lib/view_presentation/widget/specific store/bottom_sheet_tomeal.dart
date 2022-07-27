import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:raselne/routes/routes.dart';
import 'package:raselne/utilis/theme.dart';
import 'package:raselne/view_presentation/screen/new_order_screen.dart';
import 'package:raselne/view_presentation/screen/orders_screen.dart';
import 'package:raselne/view_presentation/widget/text_utilis.dart';

Widget bottomSheetToMeal(BuildContext context) {
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
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.06,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextUtils(
                      fontSize: size.width * 0.05,
                      fontWeight: FontWeight.bold,
                      text: 'تفاح أميركي أحمر سوبر',
                      color: Colors.black54,
                      underLine: TextDecoration.none),
                  IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(
                        Icons.close,
                        size: size.width * 0.08,
                        color: Colors.black54,
                      ))
                ],
              ),
            ),
            Container(
              height: size.height * 0.26,
              width: size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/services/sweet.png"),
                    fit: BoxFit.cover),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.24, vertical: size.height * 0.04),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.add, color: Colors.black45)),
                  SizedBox(
                    width: size.width * 0.05,
                  ),
                  Column(
                    children: [
                      TextUtils(
                          fontSize: size.width * 0.06,
                          fontWeight: FontWeight.bold,
                          text: '1',
                          color: Colors.blueAccent.shade100,
                          underLine: TextDecoration.none),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      TextUtils(
                          fontSize: size.width * 0.03,
                          fontWeight: FontWeight.bold,
                          text: '22.00 SAR',
                          color: Colors.black45,
                          underLine: TextDecoration.none),
                    ],
                  ),
                  SizedBox(
                    width: size.width * 0.05,
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.minimize, color: Colors.black45)),
                ],
              ),
            ),
            Container(
              width: size.width * 0.9,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: mainColor),
              child: Center(
                child: InkWell(
                  onTap: () {
                    Get.toNamed(Routes.newOrderScreen);
                  },
                  child: const TextUtils(
                    color: Colors.white,
                    text: 'إضافة',
                    fontSize: f18,
                    fontWeight: FontWeight.bold,
                    underLine: TextDecoration.none,
                  ),
                ),
              ),
            ),
          ],
        )),
  );
}
