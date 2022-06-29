import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:raselne/utilis/theme.dart';
import 'package:raselne/view/screen/meal_set.dart';
import 'package:raselne/view/widget/auth/auth_button.dart';

import 'package:raselne/view/widget/text_utilis.dart';

import '../../../constatnt.dart';

class ExpansionGridWidget extends StatelessWidget {
  final String typesTitle;
  const ExpansionGridWidget({required this.typesTitle, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

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
              return buildCardCategory(
                  size: size,
                  ontap: () {
                    //  Get.to(const ImageProfile());
                    // Get.to(() => StoreDetailsScreen(
                    //       titleStore: titleStore[index],
                    //       subTitleStore: subTitleStore[index],
                    //     ));
                  },
                  context: context
                  // ontap: () => Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => listwidget[index])),
                  );
            },
          ),
        ],
      ),
    );
  }
}

Widget buildCardCategory({
  required Size size,
  required Function() ontap,
  required var context,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
    child: InkWell(
      onTap: () {
        showModalBottomSheet(
          backgroundColor: Colors.white,
          elevation: 0,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          )),
          context: context,
          builder: ((context) => bottomSheet(context)),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Divider(
            thickness: 1,
            color: greyColor,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('كانتون بوكس'),
                      Text('6 أصناف من اختيارك'),
                    ],
                  ),

                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  const Text('160.00 SAR')
                  //const Divider(thickness: 2)
                ],
              ),
              Container(
                width: size.width * 0.3,
                height: size.height * 0.13,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage('assets/services/market.png'),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
              )
            ],
          ),
        ],
      ),
    ),
  );
}

Widget bottomSheet(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return Directionality(
    textDirection: TextDirection.rtl,
    child: Container(
        height: size.height * 0.9,
        width: double.infinity,
        margin: EdgeInsets.symmetric(
          vertical: size.height * 0.01,
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.06,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextUtils(
                      fontSize: size.width * 0.05,
                      fontWeight: FontWeight.bold,
                      text: 'تفاح أميركي أحمر سوبر',
                      color: Colors.black54,
                      underLine: TextDecoration.none),
                  IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(
                        Icons.close,
                        size: size.width * 0.08,
                        color: Colors.black54,
                      ))
                ],
              ),
            ),
            Container(
              height: size.height * 0.26,
              width: size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/services/sweet.png"),
                    fit: BoxFit.cover),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.24, vertical: size.height * 0.04),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.add, color: Colors.black45)),
                  SizedBox(
                    width: size.width * 0.05,
                  ),
                  Column(
                    children: [
                      TextUtils(
                          fontSize: size.width * 0.06,
                          fontWeight: FontWeight.bold,
                          text: '1',
                          color: Colors.blueAccent.shade100,
                          underLine: TextDecoration.none),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      TextUtils(
                          fontSize: size.width * 0.03,
                          fontWeight: FontWeight.bold,
                          text: '22.00 SAR',
                          color: Colors.black45,
                          underLine: TextDecoration.none),
                    ],
                  ),
                  SizedBox(
                    width: size.width * 0.05,
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.minimize, color: Colors.black45)),
                ],
              ),
            ),
            Container(
              width: size.width * 0.9,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: mainColor),
              child: const Center(
                child: TextUtils(
                  color: Colors.white,
                  text: 'إضافة',
                  fontSize: f18,
                  fontWeight: FontWeight.bold,
                  underLine: TextDecoration.none,
                ),
              ),
            ),
            // ElevatedButton(
            //   onPressed: () {},
            //   style: ElevatedButton.styleFrom(
            //     primary: mainColor, //Get.isDarkMode ? pinkClr : mainColor,
            //     minimumSize: Size(size.height * 0.44, size.width * 0.10),
            //   ),
            //   child: const TextUtils(
            //     color: Colors.white,
            //     text: 'إضافة',
            //     fontSize: f18,
            //     fontWeight: FontWeight.bold,
            //     underLine: TextDecoration.none,
            //   ),
            // )
            // AuthButton(
            //   height: size.height * 0.1,
            //   width: size.width * 0.4,
            //   onPressed: () {},
            //   text: "إضافة",
            // )
          ],
        )),
  );
}
