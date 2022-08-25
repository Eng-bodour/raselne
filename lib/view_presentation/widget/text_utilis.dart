import 'package:flutter/material.dart';

class TextUtils extends StatelessWidget {
   String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final TextDecoration underLine;

   TextUtils({
    required this.fontSize,
    required this.fontWeight,
    required this.text,
    required this.color,
    required this.underLine,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      // text.length > 13 ? text.substring(0, 13) :
      text,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        decoration: underLine,
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
