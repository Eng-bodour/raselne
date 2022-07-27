import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:raselne/utilis/theme.dart';
import 'package:raselne/view_presentation/screen/orders_screen.dart';

import 'package:raselne/view_presentation/widget/specific%20store/build_category_widget.dart';

import 'package:raselne/view_presentation/widget/text_utilis.dart';

class InsideNamesOfTheItems extends StatelessWidget {
  final String typesTitle;

  InsideNamesOfTheItems({required this.typesTitle, Key? key}) : super(key: key);
  bool? isAdditinMeal;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

//الوجبات الموجودة بكل خيار مثلا العروض فيها وجبات والأطباق الرئيسية يوجد فيها وجبات
    return Card(
      child: ExpansionTile(
        title: TextUtils(
            fontSize: f16,
            fontWeight: FontWeight.bold,
            text: typesTitle,
            color: Colors.black,
            underLine: TextDecoration.none),
        iconColor: greyColor,
        textColor: greyColor,
        children: [
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 2,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              childAspectRatio: 0.9, //MediaQuery.of(context).size.width * 0.9
              mainAxisExtent: size.height * 0.16,
              crossAxisSpacing: 3.0,
              mainAxisSpacing: 5.0,
              maxCrossAxisExtent: size.width * 1,
            ),
            itemBuilder: (context, index) {
              return buildCategory(
                size: size,
                ontap: () {
                  //  Get.to(const ImageProfile());
                  // Get.to(() => StoreDetailsScreen(
                  //       titleStore: titleStore[index],
                  //       subTitleStore: subTitleStore[index],
                  //     ));
                },
                context: context,
                title: 'كانتون بوكس',
                image: 'assets/services/market.png',
              );
            },
          ),
        ],
      ),
    );
  }
}

// build shape meal one and meal Addition






