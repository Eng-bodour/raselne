import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:raselne/utilis/theme.dart';
import 'package:raselne/view_presentation/widget/mypage/setting/listbuilder_setting.dart';
import 'package:raselne/view_presentation/widget/text_utilis.dart';

class SettingScreen extends StatelessWidget {
  final String title;
  SettingScreen({required this.title, Key? key}) : super(key: key);
  final List titleSetting = [
    'قائمة الشكاوى المقدمة',
    'تعديل البروفايل',
    'إدادات اللغة',
    ' شروط الاستخدام',
    'شهاد ضريبة القيمة المضافة',
    'سياسة الخصوصية',
    'قيم التطبيق',
  ];
  final List titleHelp = [
    'نبذة عن التطبيق  ',
    'كيف أعمل في رسلني ',
  ];
  ScrollController controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              foregroundColor: Colors.black54,
              title: Text(
                title,
                style: const TextStyle(color: Colors.black54),
              ),
              centerTitle: true,
              backgroundColor: Colors.white,
              elevation: 1,
            ),
            body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.03,
                    vertical: size.height * 0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextUtils(
                        fontSize: size.width * 0.05,
                        fontWeight: FontWeight.bold,
                        text: 'إعدادات عامة',
                        color: Colors.black,
                        underLine: TextDecoration.none),
                    Divider(
                      thickness: 1,
                      color: greyColor.withOpacity(0.1),
                    ),
                    ListBuilerSettingHelp(title: titleSetting),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    TextUtils(
                        fontSize: size.width * 0.05,
                        fontWeight: FontWeight.bold,
                        text: 'مساعدة',
                        color: Colors.black,
                        underLine: TextDecoration.none),
                    Divider(
                      thickness: 1,
                      color: greyColor.withOpacity(0.1),
                    ),
                    ListBuilerSettingHelp(title: titleHelp),
                    TextUtils(
                        fontSize: size.width * 0.04,
                        fontWeight: FontWeight.bold,
                        text: 'رقم الإصدار 1.1',
                        color: greyColor.withOpacity(0.4),
                        underLine: TextDecoration.none),
                    // ListBuilerSettingHelp(title: titleSetting),
                  ],
                ),
              ),
            )));
  }
}
