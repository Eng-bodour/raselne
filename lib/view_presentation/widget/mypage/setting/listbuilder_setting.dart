import 'package:flutter/material.dart';
import 'package:raselne/utilis/theme.dart';
import 'package:raselne/view_presentation/widget/text_utilis.dart';

import '../../../widget_driver/mypage_driver/detail_user.dart';

class ListBuilerSettingHelp extends StatelessWidget {
  final List title;
  var listw=[
    detail_info_user(),
    detail_info_user(),
    detail_info_user(),
    detail_info_user(),
    detail_info_user(),
    detail_info_user(),
    detail_info_user(),

  ];
  ListBuilerSettingHelp({required this.title, Key? key}) : super(key: key);
  var controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ListView.builder(
      shrinkWrap: true,
      controller: controller,
      itemCount: title.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            SizedBox(
              height: size.height * 0.04,
              child: InkWell(
                highlightColor: Colors.white,
                onTap: () {

                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context) {
                            return listw[index];
                          }));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextUtils(
                        fontSize: size.width * 0.04,
                        fontWeight: FontWeight.bold,
                        text: title[index],
                        color: Colors.black87,
                        underLine: TextDecoration.none),
                    Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.black45,
                      size: size.width * 0.04,
                    )
                  ],
                ),
              ),
            ),
            Divider(
              thickness: 1,
              color: greyColor.withOpacity(0.1),
            )
          ],
        );
      },
    );
  }

  buildSettingHelp({required Size size, required String title}) {
    return Column(
      children: [
        SizedBox(
          height: size.height * 0.04,
          child: InkWell(
            highlightColor: Colors.white,
            onTap: () {

            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextUtils(
                    fontSize: size.width * 0.04,
                    fontWeight: FontWeight.bold,
                    text: title,
                    color: Colors.black87,
                    underLine: TextDecoration.none),
                Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.black45,
                  size: size.width * 0.04,
                )
              ],
            ),
          ),
        ),
        Divider(
          thickness: 1,
          color: greyColor.withOpacity(0.1),
        )
      ],
    );
  }
}
