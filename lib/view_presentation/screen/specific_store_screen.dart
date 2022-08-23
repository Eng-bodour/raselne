import 'package:flutter/material.dart';

import 'package:raselne/constatnt.dart';
import 'package:raselne/utilis/theme.dart';
import 'package:raselne/view_presentation/widget/specific%20store/Inside_namesOf_theItems_widget.dart';
import 'package:raselne/view_presentation/widget/specific%20store/first_container_widget.dart';
import 'package:raselne/view_presentation/widget/specific%20store/typs_choise_widget.dart';
import 'package:raselne/view_presentation/widget/text_utilis.dart';

class SpecificStoreScreen extends StatelessWidget {
  final int index;
  const SpecificStoreScreen({required this.index, Key? key}) : super(key: key);

  Widget buildSliverAppBar({required Size size}) {
    return SliverAppBar(
      expandedHeight: size.height * 0.1,
      pinned: true,
      stretch: true,
      backgroundColor: greyColor,
      flexibleSpace: FlexibleSpaceBar(
        title: Padding(
          padding: EdgeInsets.only(
              top: size.height * 0.059, right: size.width * 0.02),
          child: const Text('برجر كنج'),
          // Stack(
          //   children: [
          //     Positioned(
          //       left: size.width * 0.03,
          //       bottom: size.height * 0.01,
          //       child: InkWell(
          //         onTap: () {},
          //         child: const CircleAvatar(
          //             backgroundColor: Colors.white,
          //             radius: 10,
          //             child: Icon(
          //               Icons.ios_share,
          //               color: Colors.black,
          //               size: 14,
          //             )),
          //       ),
          //     ),
          //     Row(
          //       children: [
          //         Container(
          //           child: const CircleAvatar(
          //             backgroundColor: Colors.white,
          //             radius: 10,
          //             child: Icon(
          //               Icons.food_bank,
          //               size: f14,
          //             ),
          //           ),
          //         ),
          //         SizedBox(
          //           width: size.width * 0.01,
          //         ),
          //         Container(
          //           child: Column(
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             mainAxisAlignment: MainAxisAlignment.center,
          //             children: const [
          //               TextUtils(
          //                   fontSize: 10,
          //                   fontWeight: FontWeight.bold,
          //                   text: 'برجر كنج',
          //                   color: Colors.white,
          //                   underLine: TextDecoration.none),
          //               // TextUtils(
          //               //     fontSize: 5,
          //               //     fontWeight: FontWeight.bold,
          //               //     text:
          //               //         'اطلب الحين واستمتع بالطعم الملكي المميز مع برجر كنج',
          //               //     color: Colors.white,
          //               //     underLine: TextDecoration.none)
          //             ],
          //           ),
          //         ),
          //       ],
          //     ),
          //   ],
          // ),
        ),
        background: Stack(
          children: [
            Image.asset(
              'assets/services/organic.png',
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            Container(
              color: Colors.black.withOpacity(0.5),
              width: double.infinity,
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;
    var height = size.height;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            buildSliverAppBar(size: size),
            SliverList(
              //delegate: for item under image
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: height * 0.02),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: width * 0.05),
                            child: FirstContainerWedgit(size: size),
                          ),
                          Divider(
                            thickness: 2,
                            color: greyColor.withOpacity(0.3),
                          ),
                          SizedBox(
                              height: size.height * 0.05,
                              child: const TypesChoiseWidget()),
                          // Divider(
                          //   thickness: 1,
                          //   color: greyColor.withOpacity(0.3),
                          // ),

                          ListView.builder(
                            shrinkWrap: true, controller: ScrollController(),
                            scrollDirection: Axis.vertical,
                            itemCount: typesTitle.length,
                            itemBuilder: (context, index) {
                              return InsideNamesOfTheItems(
                                typesTitle: typesTitle[index],
                              );
                            },
                            // separatorBuilder: (context, index) => Divider(
                            //   thickness: 5,
                            //   color: greyColor.withOpacity(0.2),
                            // ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomSheet: BottomAppBar(
          child: InkWell(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return Center(
                      child: AlertDialog(
                          title: Column(
                            children: [
                              CircleAvatar(
                                radius: size.width * 0.09,
                                backgroundColor: greyColor.withOpacity(0.05),
                                child: Icon(
                                  Icons.menu_book,
                                  size: size.width * 0.1,
                                  color: mainColor,
                                ),
                              ),
                              SizedBox(
                                height: size.height * 0.03,
                              ),
                              TextUtils(
                                  fontSize: size.width * 0.042,
                                  fontWeight: FontWeight.bold,
                                  text:
                                      'وفرنا لك منيو خاص يسهل عليك الطلب,ليش ماتجربه؟',
                                  color: greyColor,
                                  underLine: TextDecoration.none),
                              SizedBox(
                                height: size.height * 0.03,
                              ),
                              containerInkwell(
                                // ontap: () {},
                                isBorder: false,
                                size: size,
                                text: 'أكيد , راح اختار من المنيو',
                              ),

                              // ),
                              SizedBox(
                                height: size.height * 0.01,
                              ),
                              containerInkwell(
                                // ontap: () {},
                                isBorder: true,
                                size: size,
                                text: 'لأ , بكتب طلبي بنفسي   ',
                              ),
                            ],
                          ),
                          content: const Text('')),
                    );
                  });
            },
            child: Container(
              width: size.width * 1,
              height: size.height * 0.1,
              decoration: const BoxDecoration(color: mainColor),
              child: Center(
                  child: TextUtils(
                      fontSize: size.width * 0.05,
                      fontWeight: FontWeight.bold,
                      text: 'أرسل الطلب',
                      color: Colors.white,
                      underLine: TextDecoration.none)),
            ),
          ),
          color: mainColor,
        ),
      ),
    );
  }
}

// for bottom sheet
Widget containerInkwell({
  required Size size,
  required String text,
  required bool isBorder,
}) {
  return InkWell(
    child: Container(
      width: size.width * 0.9,
      height: size.height * 0.049,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(80),
          border: isBorder
              ? Border.all(color: mainColor)
              : Border.all(color: mainColor),
          color: isBorder ? Colors.white : mainColor),
      child: TextButton(
          onPressed: () {},
          child: TextUtils(
            color: isBorder ? mainColor : Colors.white,
            fontSize: size.width * 0.035,
            fontWeight: FontWeight.bold,
            text: text,
            underLine: TextDecoration.none,
          )),
    ),
  );
}
