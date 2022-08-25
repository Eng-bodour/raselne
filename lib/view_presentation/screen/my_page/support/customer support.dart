import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:raselne/view_presentation/screen/my_page/support/clickOnShowAll.dart';

import 'package:raselne/view_presentation/widget/mypage/row_with_text_and_icon.dart';
import 'package:raselne/view_presentation/widget/mypage/support/buildlist_horizen.dart';

import 'package:raselne/view_presentation/widget/text_utilis.dart';

import 'about_raselne.dart';

class CustomerSupport extends StatelessWidget {
  final String title;
  CustomerSupport({required this.title, Key? key}) : super(key: key);
  List name = ['مشاكل في الطلب', 'المدفوعات والمبالغ المستردة'];
  List nameHelp = ['  عن رسلني'];
  List allTopics = [
    'طلبي',
    'المرسِل',
    'الكوبونات',
    'عرض التوصيل',
    'البحث عن الخدمات والمتاجر',
    'المدفوعات والمبالغ المستردة',
    'تقديم الطلب',
    ' التقييمات والمراجعات',
    'إدارة الحساب',
    'إعدادات التطبيق',
  ];
  // List iconList = [
  //   const Icon(Icons.ac_unit),
  //   const Icon(Icons.car_rental),
  //   const Icon(Icons.calculate),
  //   const Icon(Icons.local_offer),
  //   const Icon(Icons.image_search_rounded),
  //   const Icon(Icons.payment),
  //   const Icon(Icons.shopping_cart_rounded),
  //   const Icon(Icons.stars),
  //   const Icon(Icons.person_pin),
  //   const Icon(Icons.settings),
  // ];
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
                  InkWell(
                    onTap: () {
                      Get.to(ClickOnShowAll(
                        title: 'Supports',
                        titleList: allTopics,
                      ));
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.03,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          Row(
                            children: [
                              TextUtils(
                                  fontSize: size.width * 0.03,
                                  fontWeight: FontWeight.bold,
                                  text: 'عرض الكل',
                                  color: Colors.black26,
                                  underLine: TextDecoration.none),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: size.width * 0.03,
                                color: Colors.black26,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.18,
                    child: BuildListHorizen(
                      listTitle: allTopics,
                      // iconList: iconList,
                    ),
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
