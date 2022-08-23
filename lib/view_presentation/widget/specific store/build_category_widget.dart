import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:raselne/utilis/theme.dart';
import 'package:raselne/view_presentation/widget/specific%20store/bottom_sheet_tomeal.dart';

Widget buildCategory({
  required Size size,
  required Function() ontap,
  required var context,
  required String title,
  required String image,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
    child: InkWell(
      onTap: () {
        showModalBottomSheet<dynamic>(
          backgroundColor: Colors.white,
          //  backgroundColor: Colors.transparent,
          elevation: 0,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          )),
          context: context,
          isScrollControlled: true,
          builder: ((context) => bottomSheetToMeal(context)),
          // builder: ((context) => bottomSheetWithChoiseMealAdditions(context)),
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
                    children: [
                      Text(
                        title,
                      ),
                      const Text('6 أصناف من اختيارك'),
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
                  image: DecorationImage(
                    image: AssetImage(image),
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
  // return Stack(
  //   children: [
  //     Container(
  //       child: Padding(
  //         padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
  //         child: InkWell(
  //           onTap: () {
  //             showModalBottomSheet<dynamic>(
  //               backgroundColor: Colors.white,
  //               //  backgroundColor: Colors.transparent,
  //               elevation: 0,
  //               shape: const RoundedRectangleBorder(
  //                   borderRadius: BorderRadius.only(
  //                 topLeft: Radius.circular(20),
  //                 topRight: Radius.circular(20),
  //               )),
  //               context: context,
  //               isScrollControlled: true,
  //               builder: ((context) => bottomSheetToMeal(context)),
  //               // builder: ((context) => bottomSheetWithChoiseMealAdditions(context)),
  //             );
  //           },
  //           child: Column(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: [
  //               const Divider(
  //                 thickness: 1,
  //                 color: greyColor,
  //               ),
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 //crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   Column(
  //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: [
  //                       Column(
  //                         crossAxisAlignment: CrossAxisAlignment.start,
  //                         children: [
  //                           Text(
  //                             title,
  //                           ),
  //                           const Text('6 أصناف من اختيارك'),
  //                         ],
  //                       ),

  //                       SizedBox(
  //                         height: size.height * 0.03,
  //                       ),
  //                       const Text('160.00 SAR')
  //                       //const Divider(thickness: 2)
  //                     ],
  //                   ),
  //                   Container(
  //                     width: size.width * 0.3,
  //                     height: size.height * 0.13,
  //                     decoration: BoxDecoration(
  //                       image: DecorationImage(
  //                         image: AssetImage(image),
  //                         fit: BoxFit.fill,
  //                       ),
  //                       borderRadius: BorderRadius.circular(10),
  //                       color: Colors.white,
  //                     ),
  //                   )
  //                 ],
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ),
  //     Positioned(
  //         child: Stack(
  //       children: [
  //         Container(
  //           child: Padding(
  //             padding: EdgeInsets.only(top: size.height * 0.038),
  //             child: Container(
  //               height: 100,
  //               decoration: BoxDecoration(
  //                   borderRadius: BorderRadius.circular(size.width * 0.01),
  //                   color: mainColor.withOpacity(0.1)),
  //             ),
  //           ),
  //         ),
  //         Positioned(
  //             child: Padding(
  //           padding: EdgeInsets.only(
  //               top: size.height * 0.08, right: size.width * 0.7),
  //           child: Row(
  //             children: [
  //               InkWell(
  //                 onTap: () {
  //                   showModalBottomSheet<dynamic>(
  //                     backgroundColor: Colors.white,
  //                     //  backgroundColor: Colors.transparent,
  //                     elevation: 0,
  //                     shape: const RoundedRectangleBorder(
  //                         borderRadius: BorderRadius.only(
  //                       topLeft: Radius.circular(20),
  //                       topRight: Radius.circular(20),
  //                     )),
  //                     context: context,
  //                     isScrollControlled: true,
  //                     builder: ((context) => bottomSheetToMeal(context)),
  //                     // builder: ((context) => bottomSheetWithChoiseMealAdditions(context)),
  //                   );
  //                 },
  //                 child: Container(
  //                   width: size.width * 0.1,
  //                   height: size.height * 0.05,
  //                   decoration: BoxDecoration(
  //                       borderRadius: BorderRadius.circular(20),
  //                       color: mainColor),
  //                   child: const Icon(
  //                     Icons.add,
  //                     color: Colors.white,
  //                   ),
  //                 ),
  //               ),
  //               SizedBox(
  //                 width: size.width * 0.04,
  //               ),
  //               InkWell(
  //                 onTap: () {
  //                   Get.defaultDialog(
  //                     title: "",
  //                     titleStyle: TextStyle(
  //                       fontSize: size.width * 0.04,
  //                       color: Colors.black,
  //                       fontWeight: FontWeight.bold,
  //                     ),
  //                     middleText: 'هل أنت متأكد من الحذف',
  //                     middleTextStyle: TextStyle(
  //                       fontSize: size.width * 0.05,
  //                       color: Colors.black,
  //                       fontWeight: FontWeight.bold,
  //                     ),
  //                     backgroundColor: Colors.white,
  //                     radius: size.width * 0.04,
  //                     textCancel: 'حذف',
  //                     cancelTextColor: Colors.black,
  //                     textConfirm: 'إغلاق',
  //                     confirmTextColor: Colors.white,
  //                     onCancel: () {
  //                       // to delete
  //                     },
  //                     onConfirm: () {
  //                       Get.back();
  //                       // authProvider.signOutFromApp();
  //                     },
  //                     buttonColor:
  //                         mainColor, // Get.isDarkMode ? pinkClr : mainColor,
  //                   );
  //                 },
  //                 child: Container(
  //                   width: size.width * 0.1,
  //                   height: size.height * 0.05,
  //                   decoration: BoxDecoration(
  //                       borderRadius: BorderRadius.circular(20),
  //                       color: mainColor),
  //                   child: const Icon(
  //                     Icons.delete_outlined,
  //                     color: Colors.white,
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ))
  //       ],
  //     ))
  //   ],
  // );
}
