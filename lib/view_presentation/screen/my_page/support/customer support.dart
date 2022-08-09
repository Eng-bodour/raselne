import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:raselne/utilis/theme.dart';
import 'package:raselne/view_presentation/widget/mypage/row_with_text_and_icon.dart';
import 'package:raselne/view_presentation/widget/mypage/support/buildlist_horizen.dart';

import 'package:raselne/view_presentation/widget/text_utilis.dart';

import 'about_raselne.dart';

class CustomerSupport extends StatelessWidget {
  final String title;
  CustomerSupport({required this.title, Key? key}) : super(key: key);
  List name = ['مشاكل في الطلب', 'المدفوعات والمبالغ المستردة'];
  List nameHelp = ['  عن رسلني'];
  var controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          // backgroundColor: Colors.white,
          appBar: AppBar(
            foregroundColor: Colors.black54,
            title: Text(
              title,
              style: const TextStyle(color: Colors.black54),
            ),
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 1,
          ),
          backgroundColor: Colors.grey.shade200,
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: size.height * 0.03,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: TextUtils(
                        fontSize: size.width * 0.05,
                        fontWeight: FontWeight.bold,
                        text: 'جميع المواضيع',
                        color: Colors.black,
                        underLine: TextDecoration.none),
                    padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.03,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.15,
                    child: const BuildListHorizen(),
                  ),
                  SizedBox(
                    height: size.width * 0.09,
                  ),
                  Container(
                    child: TextUtils(
                        fontSize: size.width * 0.05,
                        fontWeight: FontWeight.bold,
                        text: 'المقالات الشائعة ',
                        color: Colors.black,
                        underLine: TextDecoration.none),
                    padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.03,
                    ),
                  ),
                  SizedBox(
                    height: size.width * 0.02,
                  ),
                  Container(
                    height: size.height * 0.15,
                    decoration: const BoxDecoration(color: Colors.white),
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.03,
                        vertical: size.height * 0.02),
                    child: ListView.separated(
                      shrinkWrap: true,
                      controller: controller,
                      itemCount: name.length,
                      itemBuilder: (context, index) {
                        return buildRowTextIcon(
                            context: context, size: size, title: name[index]);
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: size.height * 0.02,
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: size.width * 0.09,
                  ),
                  Container(
                    child: TextUtils(
                        fontSize: size.width * 0.05,
                        fontWeight: FontWeight.bold,
                        text: 'بحاجة لمزيد من المساعدة؟  ',
                        color: Colors.black,
                        underLine: TextDecoration.none),
                    padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.03,
                    ),
                  ),
                  SizedBox(
                    height: size.width * 0.02,
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(AboutRaselne());
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.03,
                          vertical: size.height * 0.02),
                      height: size.height * 0.08,
                      decoration: const BoxDecoration(color: Colors.white),
                      child: ListView.builder(
                        shrinkWrap: true,
                        controller: controller,
                        itemCount: nameHelp.length,
                        itemBuilder: (context, index) {
                          return buildRowTextIcon(
                              context: context,
                              size: size,
                              title: nameHelp[index]);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
