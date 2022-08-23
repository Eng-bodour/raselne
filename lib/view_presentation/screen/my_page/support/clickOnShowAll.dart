import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:raselne/utilis/theme.dart';
import 'package:raselne/view_presentation/screen/my_page/support/about_raselne.dart';
import 'package:raselne/view_presentation/widget/text_utilis.dart';

class ClickOnShowAll extends StatelessWidget {
  final String title;
  final List<dynamic> titleList;
  const ClickOnShowAll({required this.title, required this.titleList, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          backgroundColor: Colors.grey.shade200,
          appBar: AppBar(
            foregroundColor: Colors.black38,
            elevation: 1,
            title: Row(
              children: [
                Text(
                  title,
                  style: TextStyle(
                      color: Colors.black38, fontSize: size.width * 0.05),
                )
              ],
            ),
            backgroundColor: Colors.white,
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildGridView(size: size),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Container(
                  child: TextUtils(
                      fontSize: size.width * 0.05,
                      fontWeight: FontWeight.bold,
                      text: 'بحاجة لمزيد من المساعدة؟',
                      color: Colors.black,
                      underLine: TextDecoration.none),
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.04,
                  ),
                ),
                // const Text('hhh'),
                info(size: size),
              ],
            ),
          )),
    );
  }

  Widget info({required Size size}) {
    return InkWell(
      onTap: () {
        Get.to(AboutRaselne());
      },
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.05, vertical: size.height * 0.02),
        height: size.height * 0.07,
        decoration: const BoxDecoration(color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'عن رسلني',
              style: TextStyle(
                  fontSize: size.width * 0.04,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54),
            ),
            Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black54,
              size: size.width * 0.05,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildGridView({required Size size}) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.06, vertical: size.height * 0.03),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: titleList.length,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          childAspectRatio: 0.9, //MediaQuery.of(context).size.width * 0.9
          mainAxisExtent: size.height * 0.15,
          crossAxisSpacing: 0,
          mainAxisSpacing: 0,
          maxCrossAxisExtent: size.width * 0.3,
        ),
        itemBuilder: (context, index) {
          return buildCardCategory(
              size: size,
              // image: imageList[index],
              //  item: getController.docTyps[index].name,
              item: titleList[index],
              ontap: () {});
        },
      ),
    );
  }

  Widget buildCardCategory({
    // required String image,
    required Size size,
    required String item,
    required Function() ontap,
  }) {
    return Padding(
      padding: EdgeInsets.all(size.width * 0.03),
      child: InkWell(
        onTap: ontap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(size.width * 0.01),
            color: Colors.white,
          ),
          child: Padding(
            padding: EdgeInsets.only(
                right: size.width * 0.03, top: size.height * 0.02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.ac_unit,
                  color: mainColor,
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                item.length < 16
                    ? TextUtils(
                        fontSize: size.width * 0.03,
                        fontWeight: FontWeight.bold,
                        text: item,
                        color: Colors.black,
                        underLine: TextDecoration.none,
                      )
                    : Text(
                        item.substring(0, 16),
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: size.width * 0.04,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
