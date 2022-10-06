import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:raselne/logic/controller/auth_controller.dart';
import 'package:raselne/logic/controller/order_vm.dart';
import 'package:raselne/utilis/theme.dart';

import 'package:raselne/view_presentation/widget/text_utilis.dart';

Widget bottomSheet(BuildContext context, TextEditingController coupon,String type) {
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.3),
                  child: TextUtils(
                      fontSize: size.width * 0.05,
                      fontWeight: FontWeight.bold,
                      text: 'أضف كوبون   ',
                      color: Colors.black87,
                      underLine: TextDecoration.none),
                ),
                IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.close,
                      size: size.width * 0.08,
                      color: Colors.black54,
                    )),
              ],
            ),
            Divider(
              thickness: 1,
              color: greyColor.withOpacity(0.2),
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.24,
                      vertical: size.height * 0.03),
                  child: ModalProgressHUD(
                    inAsyncCall: Provider.of<AuthProvider_vm>(context,listen: true)
                    .isloading,
                    child: Column(
                      children: [
                        TextUtils(
                            fontSize: size.width * 0.05,
                            fontWeight: FontWeight.bold,
                            text: 'أدخل رقم الكوبون ',
                            color: Colors.black87,
                            underLine: TextDecoration.none),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        TextField(
                          controller: coupon,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: mainColor),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: mainColor),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: mainColor),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: mainColor),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                TextUtils(
                    fontSize: size.width * 0.03,
                    fontWeight: FontWeight.normal,
                    text: 'هل تريد الحصول على مزيد من الكوبونات؟ تابعنا على',
                    color: Colors.black87,
                    underLine: TextDecoration.none),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.34),
                  child: Row(
                    children: [
                      TextUtils(
                          fontSize: size.width * 0.03,
                          fontWeight: FontWeight.normal,
                          text: 'تويتر',
                          color: mainColor,
                          underLine: TextDecoration.underline),
                      TextUtils(
                          fontSize: size.width * 0.03,
                          fontWeight: FontWeight.normal,
                          text: ' و ',
                          color: Colors.black87,
                          underLine: TextDecoration.none),
                      TextUtils(
                          fontSize: size.width * 0.03,
                          fontWeight: FontWeight.normal,
                          text: 'أنستغرام',
                          color: mainColor,
                          underLine: TextDecoration.underline),
                      TextUtils(
                          fontSize: size.width * 0.03,
                          fontWeight: FontWeight.normal,
                          text: ' و ',
                          color: Colors.black87,
                          underLine: TextDecoration.none),
                      TextUtils(
                          fontSize: size.width * 0.03,
                          fontWeight: FontWeight.normal,
                          text: 'فيس بوك',
                          color: mainColor,
                          underLine: TextDecoration.underline),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            InkWell(
              onTap: ()async {
                  if(type=='check'){
                    double val= await Provider.of<AuthProvider_vm>(context,listen: false)
                        .check_Copoun(coupon.text.toString());
               Provider.of<order_vm>(context,listen: false)
                    .setvalue_dicount(val);
               if(val==0.0) {
                 Get.snackbar(
                   '',
                   'لايوجد خصم أو الكود منتهي الصلاحية ',
                   snackPosition: SnackPosition.BOTTOM,
                   backgroundColor: Colors.green,
                   colorText: Colors.white,
                 );
               }else{
                 Get.snackbar(
                   '',
                   'تم التحقق من الكوبون, بإمكانك استخدامه',
                   snackPosition: SnackPosition.BOTTOM,
                   backgroundColor: Colors.green,
                   colorText: Colors.white,
                 );
               }
                  } else{
              bool res= await Provider.of<AuthProvider_vm>(context)
                    .save_Copoun(coupon.text.toString());
              if(res){
                Get.snackbar(
                  '',
                  'تم التحقق من الكوبون, بإمكانك استخدامه',
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: Colors.green,
                  colorText: Colors.white,
                );
              } else{
                Get.snackbar(
                  '',
                  'الكوبون خاطئ',
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: Colors.green,
                  colorText: Colors.white,
                );
              }
            }
              },
              child: Container(
                width: size.width * 0.7,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: mainColor),//.withOpacity(0.3)),
                child: Center(
                  child: TextUtils(
                    color: Colors.white,
                    text: 'تحقق',
                    fontSize: size.width * 0.05,
                    fontWeight: FontWeight.bold,
                    underLine: TextDecoration.none,
                  ),
                ),
              ),
            ),
          ],
        )),
  );
}
