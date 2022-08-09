import 'package:flutter/material.dart';
import 'package:raselne/utilis/theme.dart';
import 'package:raselne/view_presentation/widget/text_utilis.dart';

Widget showInfoDriver({required Size size}) {
  return InkWell(
    onTap: () {},
    child: Row(
      children: [
        const Icon(
          Icons.person_pin_outlined,
          color: mainColor,
        ),
        TextUtils(
            fontSize: size.width * 0.04,
            fontWeight: FontWeight.bold,
            text: 'أظهر هوية المرسول',
            color: mainColor,
            underLine: TextDecoration.none)
      ],
    ),
  );
}
