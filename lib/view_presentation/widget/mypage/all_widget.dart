import 'package:flutter/material.dart';
import 'package:raselne/utilis/theme.dart';
import 'package:raselne/view_presentation/widget/mypage/coupon/bottom_sheet.dart';
import 'package:raselne/view_presentation/widget/text_utilis.dart';

Widget allWidget(
    {required bool bool,
    required Size size,
    required String title,
    required String subtitle,
    required Icon icon,
    required BuildContext context,
    required TextEditingController couponController}) {
  return TextButton(
    style: ButtonStyle(
      // backgroundColor: MaterialStateProperty.all(Colors.white),
      overlayColor: MaterialStateProperty.all(Colors.white),
    ),
    onPressed: () {},
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            icon,
            SizedBox(width: size.width * 0.03),
            TextUtils(
                fontSize: size.width * 0.04,
                fontWeight: FontWeight.bold,
                text: title,
                color: Colors.black87,
                underLine: TextDecoration.none),
          ],
        ),
        bool
            ? InkWell(
                onTap: () {
                  showModalBottomSheet(
                    backgroundColor: Colors.white,
                    elevation: 0,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    )),
                    context: context,
                    builder: ((context) =>
                        bottomSheet(context, couponController,'')),
                  );
                },
                child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.02),
                    width: size.width / 2 - size.width * 0.2,
                    // height: size.height * 0.1,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(80),
                        border: Border.all(color: mainColor),
                        color: Colors.white),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.add,
                          color: mainColor,
                        ),
                        TextUtils(
                          color: mainColor,
                          fontSize: size.width * 0.035,
                          fontWeight: FontWeight.bold,
                          text: subtitle,
                          underLine: TextDecoration.none,
                        ),
                      ],
                    )),
              )
            : Row(
                children: [
                  TextUtils(
                      fontSize: size.width * 0.04,
                      fontWeight: FontWeight.bold,
                      text: subtitle,
                      color: mainColor,
                      underLine: TextDecoration.none),
                  Icon(
                    Icons.arrow_back_ios_new_outlined,
                    color: mainColor,
                    size: size.width * 0.04,
                  ),
                ],
              )
      ],
    ),
  );
}
