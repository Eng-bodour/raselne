import 'package:flutter/material.dart';
import 'package:raselne/utilis/theme.dart';
import 'package:raselne/view_presentation/widget/text_utilis.dart';

Widget modeUser(
    {required Size size,
    required String title,
    required Widget subtitle,
    required Icon icon,
    required BuildContext context,
    required Function() ontap}) {
  return InkWell(
    highlightColor: Colors.white,
    onTap: ontap,
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
            SizedBox(width: size.width * 0.02),
            subtitle,
          ],
        ),
        Icon(
          Icons.arrow_back_ios_new_outlined,
          color: mainColor,
          size: size.width * 0.04,
        ),
      ],
    ),
  );
}
