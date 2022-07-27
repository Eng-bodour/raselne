import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:raselne/constatnt.dart';
import 'package:raselne/utilis/theme.dart';
import 'package:raselne/view_presentation/widget/specific%20store/choise_category_to_add.dart';
import 'package:raselne/view_presentation/widget/text_utilis.dart';

Widget bottomSheetWithChoiseMealAdditions(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return SingleChildScrollView(
    //  controller: ScrollController(initialScrollOffset: 0),
    child: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
            height: size.height * 0.9,
            width: double.infinity,
            margin: EdgeInsets.symmetric(
              vertical: size.height * 0.01,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                          text: 'شكل 7 أطباق',
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
                        image: AssetImage('assets/services/restaurant.jpg'),
                        fit: BoxFit.cover),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.04,
                      vertical: size.height * 0.03),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextUtils(
                          fontSize: size.width * 0.04,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                          text:
                              '  سبعة أطباق من اختيارك مع صحن مشكل مقبلات \n  * العرض ساري على منتجات مختارة  \n * لا يمكن تكرار نفس المنتج داخل العرض ',
                          underLine: TextDecoration.none),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      ListView.builder(
                        itemCount: additionMeal.length,
                        itemBuilder: (context, index) {
                          return ExpansionTile(
                            title: Text(additionMeal[index]),
                            iconColor: greyColor,
                            textColor: greyColor,
                            children: [
                              GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: 1,
                                gridDelegate:
                                    SliverGridDelegateWithMaxCrossAxisExtent(
                                  childAspectRatio:
                                      0.9, //MediaQuery.of(context).size.width * 0.9
                                  mainAxisExtent: size.height * 0.06,
                                  crossAxisSpacing: 3.0,
                                  mainAxisSpacing: 5.0,
                                  maxCrossAxisExtent: size.width * 1,
                                ),
                                itemBuilder: (context, index) {
                                  return choiceCategoreToAdd();
                                },
                              ),
                              // ListView.builder(
                              //   itemBuilder: (context, index) => Row(
                              //     children: const [
                              //       Text('مسحب'),
                              //       Text('0.00sr')
                              //     ],
                              //   ),
                              // ),
                            ],
                          );
                        },
                        // separatorBuilder: (context, index) => Divider(
                        //   thickness: 5,
                        //   color: greyColor.withOpacity(0.2),
                        // ),
                      ),
                    ],
                  ),
                )
              ],
            ))),
  );
}
