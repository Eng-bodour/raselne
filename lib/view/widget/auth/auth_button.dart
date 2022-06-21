import 'package:flutter/material.dart';

import 'package:raselne/utilis/theme.dart';
import 'package:raselne/view/widget/text_utilis.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final Function() onPressed;

  const AuthButton({
    required this.onPressed,
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: mainColor, //Get.isDarkMode ? pinkClr : mainColor,
        minimumSize: Size(size.height * 0.19, size.width * 0.15),
      ),
      child: TextUtils(
        color: Colors.white,
        text: text,
        fontSize: f18,
        fontWeight: FontWeight.bold,
        underLine: TextDecoration.none,
      ),
    );
  }
}
