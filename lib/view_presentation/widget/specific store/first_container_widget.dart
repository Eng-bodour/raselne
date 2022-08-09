import 'package:flutter/material.dart';
import 'package:raselne/utilis/theme.dart';
import 'package:raselne/view_presentation/widget/text_utilis.dart';

class FirstContainerWedgit extends StatelessWidget {
  final Size size;

  const FirstContainerWedgit({required this.size, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = size.width;

    return Row(
      children: [
        Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: mainColor,
                  size: width * 0.05,
                ),
                TextUtils(
                    fontSize: width * 0.05,
                    fontWeight: FontWeight.normal,
                    text: '4.3',
                    color: greyColor,
                    underLine: TextDecoration.none)
              ],
            ),
            Row(
              children: [
                TextUtils(
                    fontSize: width * 0.03,
                    fontWeight: FontWeight.normal,
                    text: 'مشاركات',
                    color: greyColor,
                    underLine: TextDecoration.none),
                TextUtils(
                    fontSize: width * 0.034,
                    fontWeight: FontWeight.normal,
                    text: '19.8K',
                    color: greyColor,
                    underLine: TextDecoration.none),
              ],
            )
          ],
        ),
        SizedBox(
          width: width * 0.16,
        ),
        Container(
          child: Row(
            children: [
              Icon(
                Icons.access_time_sharp,
                color: greyColor,
                size: width * 0.05,
              ),
              TextUtils(
                  fontSize: width * 0.05,
                  fontWeight: FontWeight.normal,
                  text: 'مفتوح',
                  color: greyColor,
                  underLine: TextDecoration.none)
            ],
          ),
        ),
        SizedBox(
          width: width * 0.16,
        ),
        Container(
          child: Column(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: greyColor,
                    size: width * 0.05,
                  ),
                  TextUtils(
                      fontSize: width * 0.04,
                      fontWeight: FontWeight.normal,
                      text: 'الفرع',
                      color: greyColor,
                      underLine: TextDecoration.none)
                ],
              ),
              Row(
                children: [
                  TextUtils(
                      fontSize: width * 0.03,
                      fontWeight: FontWeight.normal,
                      text: ' يبعد  ',
                      color: greyColor,
                      underLine: TextDecoration.none),
                  TextUtils(
                      fontSize: width * 0.03,
                      fontWeight: FontWeight.normal,
                      text: '2.60  كم ',
                      color: greyColor,
                      underLine: TextDecoration.none),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
