import 'package:flutter/material.dart';
import 'package:raselne/utilis/theme.dart';


Widget buildRowTextIcon(
    {required Size size,
    required String title,
    required BuildContext context}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      RichText(
        overflow: TextOverflow.clip,
        softWrap: true,
        maxLines: 2,
        textScaleFactor: 1,
        text: TextSpan(
          text: title,
          style: DefaultTextStyle.of(context).style,
        ),
      ),
      // TextUtils(
      //     fontSize: size.width * 0.05,
      //     fontWeight: FontWeight.normal,
      //     text: title,
      //     color: Colors.black,
      //     underLine: TextDecoration.none),
      Icon(
        Icons.arrow_back_ios_new,
        color: greyArrow,
        size: size.width * arrow,
      ),
    ],
  );
}
