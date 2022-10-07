import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:raselne/data_layer/model/user_model.dart';
import 'package:raselne/logic/controller/auth_controller.dart';

import 'package:raselne/utilis/theme.dart';
import 'package:raselne/view_presentation/screen/my_page/services_review_screen.dart';
import 'package:raselne/view_presentation/screen/my_page/user_feedback_screen.dart';

import 'package:raselne/view_presentation/screen_driver/my_page_driver/customer_support_driver.dart';

import 'package:raselne/view_presentation/widget/mypage/coupon/bottom_sheet.dart';

import 'package:raselne/view_presentation/widget/mypage/info_user.dart';

import 'package:raselne/view_presentation/widget/text_utilis.dart';
import 'package:raselne/view_presentation/widget_driver/mypage_driver/account_balance.dart';
import 'package:raselne/view_presentation/widget_driver/mypage_driver/calculate_drive.dart';
import 'package:raselne/view_presentation/widget_driver/mypage_driver/mode_user.dart';
import 'package:raselne/view_presentation/widget_driver/mypage_driver/show_info_drive.dart';

class MyPageDriverScreen extends StatefulWidget {
  MyPageDriverScreen({Key? key}) : super(key: key);

  @override
  State<MyPageDriverScreen> createState() => _MyPageDriverScreenState();
}

class _MyPageDriverScreenState extends State<MyPageDriverScreen> {
  final TextEditingController couponController = TextEditingController();
  late UserModel user ;
  @override
  Widget build(BuildContext context) {
    user =Provider.of<AuthProvider_vm>(context, listen: true).currentuser;
    var size = MediaQuery.of(context).size;
    // SimpleDialog(
    //   elevation: 0,
    //   //backgroundColor: Colors.yellowAccent,
    //   // shape: StadiumBorder(
    //   //    side: BorderSide.none
    //   // ),
    //   titlePadding: const EdgeInsets.fromLTRB(24.0, 1.0, 24.0, 10.0),
    //   insetPadding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
    //   contentPadding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
    //   title: Center(child: Text('')),
    //   children: [],
    // );
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
                user.type == 'captain'
                    ? showInfoDriver(size: size)
                    : Container(),
                user.type == 'captain'
                    ? Divider(
                        thickness: 1,
                        color: greyColor.withOpacity(0.2),
                        height: size.height * 0.04,
                      )
                    : Container(),
                user.type == 'captain'
                    ? CalculateDriver(size: size, context: context)
                    : Container(),
                user.type == 'captain'
                    ? Divider(
                        thickness: 1,
                        color: greyColor.withOpacity(0.2),
                        height: size.height * 0.04,
                      )
                    : Container(),
                user.type == 'captain'
                    ? accountBalance(
                        context: context,
                        size: size,
                        title: 'رصيد الحساب',
                        count: '  ${user.balance}  رس ')
                    : Container(),
                user.type == 'captain'
                    ? Divider(
                        thickness: 1,
                        color: greyColor.withOpacity(0.2),
                      )
                    : Container(),
                user.type == 'captain'
                    ? info(
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
                            color: Colors.black26))
                    : Container(),
                user.type == 'captain'
                    ? Divider(
                        thickness: 1,
                        color: greyColor.withOpacity(0.2),
                        height: size.height * 0.04,
                      )
                    : Container(),
                ModalProgressHUD(
                  inAsyncCall:
                  Provider.of<AuthProvider_vm>(context)
                      .isloading,
                  child: modeUser(
                      context: context,
                      size: size,
                      ontap: () {},
                      title: 'وضع المستخدم',
                      subtitle: TextButton(
                        onPressed: () async {
                          await showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  titlePadding: const EdgeInsets.fromLTRB(
                                      24.0, 1.0, 24.0, 10.0),
                                  insetPadding: EdgeInsets.only(
                                      left: 10, right: 10, bottom: 10),
                                  contentPadding: EdgeInsets.only(
                                      left: 10, right: 10, bottom: 10),
                                  title: Center(child: Text(
                                 user.type=='captain'
                                  ? "التحويل إلى وضع التسوق؟"
                                  : "التحويل إلى وضع المندوب ؟",)),
                                  content: Text(user.type=='captain'
                                             ? 'يمكنك وضع التسوق من التسوق عبر التطبيق. لكي تتمكن منتوصيل الطلبات عليك أن تعيد تفعيل وضع المراسيل'
                                             : "يمكنك وضع المناديب من توصيل الطلبات بشكل أسهل .لكي تتمكنمن التسوق عبر التطبيق عليك أن تعيد تفعيل وضع التسوق",),
                                  actions: <Widget>[
                                    new FlatButton(
                                      onPressed: () {
                                        Navigator.of(context,
                                                rootNavigator: true)
                                            .pop(
                                                false); // dismisses only the dialog and returns false
                                      },
                                      child: Text('لا'),
                                    ),
                                    FlatButton(
                                      onPressed: () async {
                                            await Provider.of<AuthProvider_vm>(context,listen: false)
                                                .switch_type();
                                            Navigator.of(context, rootNavigator: true)
                                                .pop(true);
                                            setState(() {

                                            });
                                        // dismisses only the dialog and returns true
                                      },
                                      child: Text('نعم'),
                                    ),
                                  ],
                                );
                              });
                          // Get.defaultDialog(
                          //
                          //   title: user.type=='captain'
                          //       ? "التحويل إلى وضع التسوق؟"
                          //       : "التحويل إلى وضع المندوب ؟",
                          //   titleStyle: TextStyle(
                          //     fontSize: size.width * 0.05,
                          //     color: Colors.black,
                          //     fontWeight: FontWeight.bold,
                          //   ),
                          //   middleText: user.type=='captain'
                          //       ? 'يمكنك وضع التسوق من التسوق عبر التطبيق. لكي تتمكن منتوصيل الطلبات عليك أن تعيد تفعيل وضع المراسيل'
                          //       : "يمكنك وضع المناديب من توصيل الطلبات بشكل أسهل .لكي تتمكنمن التسوق عبر التطبيق عليك أن تعيد تفعيل وضع التسوق",
                          //   middleTextStyle: TextStyle(
                          //     fontSize: size.width * 0.04,
                          //     color: Colors.black54,
                          //     fontWeight: FontWeight.normal,
                          //   ),
                          //   backgroundColor: Colors.white,
                          //   radius: size.width * 0.04,
                          //   textCancel: 'رجوع',
                          //   cancelTextColor: Colors.black,
                          //   textConfirm: 'تحويل',
                          //   confirmTextColor: Colors.white,
                          //   onCancel: () {
                          //     Get.back();
                          //     // to delete
                          //   },
                          //   onConfirm: () async {
                          //     await Provider.of<AuthProvider_vm>(context,listen: false)
                          //         .switch_type();
                          //    // Get.back();
                          //
                          //    setState(() {
                          //
                          //    });
                          //     Get.back();
                          //     // authProvider.signOutFromApp();
                          //   },
                          //
                          //   buttonColor:
                          //   mainColor, // Get.isDarkMode ? pinkClr : mainColor,
                          // );
                        },
                        child: user.type == 'captain'
                            ? Text(
                                'وضع المندوب',
                                style: TextStyle(
                                    color: mainColor,
                                    fontSize: size.width * 0.05),
                              )
                            : Text(
                                'وضع المتسوق',
                                style: TextStyle(
                                    color: mainColor,
                                    fontSize: size.width * 0.05),
                              ),
                      ),
                      icon: const Icon(Icons.person, color: Colors.black26)),
                ),
                // modeUser(
                //     context: context,
                //     size: size,
                //     ontap: () {},
                //     title: 'وضع المستخدم',
                //     subtitle: TextButton(
                //       onPressed: () {},
                //       child: Text(
                //         'وضع المندوب',
                //         style: TextStyle(
                //             color: mainColor, fontSize: size.width * 0.05),
                //       ),
                //     ),
                //     icon: const Icon(Icons.person, color: Colors.black26)),
                Divider(
                  thickness: 1,
                  color: greyColor.withOpacity(0.2),
                ),
                // info(
                //     ontap: () {
                //       Get.to(const ServicesReview(
                //         title: 'تقييمات الخدمات',
                //       ));
                //     },
                //     context: context,
                //     bool: false,
                //     size: size,
                //     title: 'تقييمات الخدمات ',
                //     subtitle: '0',
                //     icon: const Icon(Icons.star_border_rounded,
                //         color: Colors.black26)),
                // Divider(thickness: 1, color: greyColor.withOpacity(0.2)),
                info(
                    ontap: () {
                      Get.to(UserFeedBackScreen(
                        title: 'ملاحظات المستخدمين ',
                      ));
                    },
                    context: context,
                    bool: false,
                    size: size,
                    title: 'ملاحظات المستخدمين ',
                    subtitle: '6',
                    icon: const Icon(Icons.notes_outlined,
                        color: Colors.black26)),
                user.type == 'user'
                    ? Divider(thickness: 1, color: greyColor.withOpacity(0.2))
                    : Container(),
                Provider.of<AuthProvider_vm>(context, listen: true)
                    .currentuser.type == 'user'
                    ? info(
                        ontap: () {
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
                                bottomSheet(context, couponController,'save')),
                          );
                        },
                        context: context,
                        bool: true,
                        size: size,
                        title: 'الكوبونات  ',
                        subtitle: ' أضف كوبون',
                        icon: const Icon(Icons.design_services_outlined,
                            color: Colors.black26))
                    : Container(),
                Divider(thickness: 1, color: greyColor.withOpacity(0.2)),
                user.type == 'captain'
                    ? info(
                        ontap: () {
                          Get.to(CustomerSupportDriver(
                            title: 'الدعم للعملاء',
                          ));
                        },
                        context: context,
                        bool: false,
                        size: size,
                        title: 'الدعم للمناديب ',
                        subtitle: '',
                        icon: const Icon(Icons.help_rounded,
                            color: Colors.black26))
                    : Container(),
                user.type == 'captain'
                    ? Divider(thickness: 1, color: greyColor.withOpacity(0.2))
                    : Container(),
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
                // info(
                //     ontap: () {},
                //     context: context,
                //     bool: false,
                //     size: size,
                //     title: 'طريقة السداد',
                //     subtitle: '',
                //     icon: const Icon(Icons.settings, color: Colors.black26)),
                // Divider(thickness: 1, color: greyColor.withOpacity(0.2)),
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
