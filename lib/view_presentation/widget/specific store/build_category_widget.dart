import 'package:flutter/material.dart';
import 'package:raselne/utilis/theme.dart';
import 'package:raselne/view_presentation/widget/specific%20store/bottom_sheet_tomeal.dart';
import 'package:raselne/view_presentation/widget/specific%20store/bottom_sheet_with_choise_mealAddition.dart';

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
}
