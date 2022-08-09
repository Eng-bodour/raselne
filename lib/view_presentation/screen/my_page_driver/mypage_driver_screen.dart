import 'package:flutter/material.dart';

import 'package:raselne/utilis/theme.dart';

import 'package:raselne/view_presentation/widget/mypage/coupon/bottom_sheet.dart';

import 'package:raselne/view_presentation/widget/mypage/info_user.dart';
import 'package:raselne/view_presentation/widget/mypage_driver/account_balance.dart';

import 'package:raselne/view_presentation/widget/mypage_driver/calculate_drive.dart';
import 'package:raselne/view_presentation/widget/mypage_driver/mode_user.dart';
import 'package:raselne/view_presentation/widget/mypage_driver/show_info_drive.dart';

import 'package:raselne/view_presentation/widget/text_utilis.dart';

class MyPageDriverScreen extends StatelessWidget {
  MyPageDriverScreen({Key? key}) : super(key: key);
  final TextEditingController couponController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: size.height * 0.16,
        backgroundColor: greyColor.withOpacity(0.2),
        // title: const Text('MyPage'),
        title: Directionality(
          textDirection: TextDirection.rtl,
          child: InfoUser(size: size),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.05, vertical: size.width * 0.04),
            child: Column(
              children: [
                showInfoDriver(size: size),
                Divider(
                  thickness: 1,
                  color: greyColor.withOpacity(0.2),
                  height: size.height * 0.04,
                ),
                CalculateDriver(size: size),
                Divider(
                  thickness: 1,
                  color: greyColor.withOpacity(0.2),
                  height: size.height * 0.04,
                ),
                accountBalance(
                    context: context,
                    size: size,
                    title: 'رصيد الحساب',
                    count: '0 رس'),
                Divider(
                  thickness: 1,
                  color: greyColor.withOpacity(0.2),
                ),
                info(
                    ontap: () {
                      // Get.to(CustomerSupport(
                      //   title: 'أرباحي',
                      // ));
                    },
                    context: context,
                    bool: false,
                    size: size,
                    title: ' أرباحي',
                    subtitle: '',
                    icon: const Icon(Icons.stars_outlined,
                        color: Colors.black26)),
                Divider(
                  thickness: 1,
                  color: greyColor.withOpacity(0.2),
                  height: size.height * 0.04,
                ),
                modeUser(
                    context: context,
                    size: size,
                    ontap: () {},
                    title: 'وضع المستخدم',
                    subtitle: TextButton(
                      onPressed: () {},
                      child: Text(
                        'وضع المندوب',
                        style: TextStyle(
                            color: mainColor, fontSize: size.width * 0.05),
                      ),
                    ),
                    icon: const Icon(Icons.person, color: Colors.black26)),
                Divider(
                  thickness: 1,
                  color: greyColor.withOpacity(0.2),
                ),
                info(
                    ontap: () {
                      // Get.to(const ServicesReview(
                      //   title: 'تقييمات الخدمات',
                      // ));
                    },
                    context: context,
                    bool: false,
                    size: size,
                    title: 'تقييمات الخدمات ',
                    subtitle: '0',
                    icon: const Icon(Icons.star_border_rounded,
                        color: Colors.black26)),
                Divider(thickness: 1, color: greyColor.withOpacity(0.2)),
                info(
                    ontap: () {
                      // Get.to(UserFeedBackScreen(
                      //   title: 'ملاحظات المستخدمين ',
                      // ));
                    },
                    context: context,
                    bool: false,
                    size: size,
                    title: 'ملاحظات المستخدمين ',
                    subtitle: '6',
                    icon: const Icon(Icons.notes_outlined,
                        color: Colors.black26)),
                Divider(thickness: 1, color: greyColor.withOpacity(0.2)),
                info(
                    ontap: () {},
                    context: context,
                    bool: true,
                    size: size,
                    title: 'الكوبونات  ',
                    subtitle: ' أضف كوبون',
                    icon: const Icon(Icons.design_services_outlined,
                        color: Colors.black26)),
                Divider(thickness: 1, color: greyColor.withOpacity(0.2)),
                info(
                    ontap: () {
                      // Get.to(CustomerSupport(
                      //   title: 'الدعم للعملاء',
                      // ));
                    },
                    context: context,
                    bool: false,
                    size: size,
                    title: 'الدعم للمناديب ',
                    subtitle: '',
                    icon:
                        const Icon(Icons.help_rounded, color: Colors.black26)),
                Divider(thickness: 1, color: greyColor.withOpacity(0.2)),
                info(
                    ontap: () {
                      // Get.to(SettingScreen(
                      //   title: 'إعدادات',
                      // ));
                    },
                    context: context,
                    bool: false,
                    size: size,
                    title: 'الإعدادات  ',
                    subtitle: '',
                    icon: const Icon(Icons.settings, color: Colors.black26)),
                Divider(thickness: 1, color: greyColor.withOpacity(0.2)),
                info(
                    ontap: () {},
                    context: context,
                    bool: false,
                    size: size,
                    title: 'طريقة السداد',
                    subtitle: '',
                    icon: const Icon(Icons.settings, color: Colors.black26)),
                Divider(thickness: 1, color: greyColor.withOpacity(0.2)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget info(
      {required bool bool,
      required Size size,
      required String title,
      required String subtitle,
      required Icon icon,
      required BuildContext context,
      required Function() ontap}) {
    return InkWell(
      highlightColor: Colors.white,
      onTap: ontap,
      child: SizedBox(
        height: size.height * 0.05,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                icon,
                SizedBox(width: size.width * 0.03),
                TextUtils(
                    fontSize: size.width * 0.04,
                    fontWeight: FontWeight.bold,
                    text: title,
                    color: Colors.black87,
                    underLine: TextDecoration.none),
              ],
            ),
            bool
                ? InkWell(
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
                        builder: ((context) =>
                            bottomSheet(context, couponController)),
                      );
                    },
                    child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.02),
                        width: size.width / 2 - size.width * 0.2,
                        // height: size.height * 0.1,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(80),
                            border: Border.all(color: mainColor),
                            color: Colors.white),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.add,
                              color: mainColor,
                            ),
                            TextUtils(
                              color: mainColor,
                              fontSize: size.width * 0.035,
                              fontWeight: FontWeight.bold,
                              text: subtitle,
                              underLine: TextDecoration.none,
                            ),
                          ],
                        )),
                  )
                : Row(
                    children: [
                      TextUtils(
                          fontSize: size.width * 0.04,
                          fontWeight: FontWeight.bold,
                          text: subtitle,
                          color: mainColor,
                          underLine: TextDecoration.none),
                      Icon(
                        Icons.arrow_back_ios_new_outlined,
                        color: mainColor,
                        size: size.width * 0.04,
                      ),
                    ],
                  )
          ],
        ),
      ),
    );
  }
}
