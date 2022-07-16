import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:raselne/view_presentation/screen/my_page/support/any_question_screen_.dart';
import 'package:raselne/view_presentation/widget/mypage/row_with_text_and_icon.dart';
import 'package:raselne/view_presentation/widget/text_utilis.dart';

class AboutRaselne extends StatelessWidget {
  AboutRaselne({Key? key}) : super(key: key);
  var controller = ScrollController();
  List about = [
    'ماهو حسابكم في تويتر؟',
    'كيف اتعاقد مع مرسول؟',
    'ماهي خدمة (أرسلها عني)؟',
    'هل يمكنني الحصول على رابط قناتكم في التلغرام؟',
    'هل يمكنني تحميل تطبيق رسلني على مختلف الأجهزة؟',
    'أين أقدم لكم اقتراحاتي؟',
    'كيف أقدم على وظيفة في رسلني؟',
    'ماهو رسلني؟',
    'كيف أنضم إلى أسطول مراسيلكم؟',
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        // backgroundColor: Colors.white,
        appBar: AppBar(
          foregroundColor: Colors.black54,
          title: const Text(
            'عن مرسول',
            style: TextStyle(color: Colors.black54),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 1,
        ),
        backgroundColor: Colors.grey.shade200,
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: size.height * 0.03,
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: TextUtils(
                            fontSize: size.width * 0.05,
                            fontWeight: FontWeight.bold,
                            text: 'الأسئلة المتكررة ',
                            color: Colors.black,
                            underLine: TextDecoration.none),
                        padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.03,
                        ),
                      ),
                      SizedBox(
                        height: size.width * 0.02,
                      ),
                      Container(
                        height: size.height * 0.5,
                        decoration: const BoxDecoration(color: Colors.white),
                        padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.03,
                            vertical: size.height * 0.02),
                        child: ListView.separated(
                          shrinkWrap: true,
                          controller: controller,
                          itemCount: about.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Get.to(() => AnyQuestionScreen(
                                      title: about[index],
                                      index: index,
                                    ));
                              },
                              child: buildRowTextIcon(
                                  context: context,
                                  size: size,
                                  title: about[index]),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: size.height * 0.02,
                            );
                          },
                        ),
                      ),
                      // buildListAbout(),
                    ]))),
      ),
    );
  }
}
