import 'package:flutter/material.dart';
import 'package:raselne/utilis/theme.dart';
import 'package:raselne/view_presentation/widget/text_utilis.dart';

Widget numOrder(
    {required Size size, required String title, required String subTitle}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          const Icon(
            Icons.car_rental,
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
      TextUtils(
          fontSize: size.width * 0.04,
          fontWeight: FontWeight.bold,
          text: subTitle,
          color: mainColor,
          underLine: TextDecoration.none),
    ],
  );
}
