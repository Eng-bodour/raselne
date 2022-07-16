import 'package:flutter/material.dart';
import 'package:raselne/utilis/theme.dart';
import 'package:raselne/view_presentation/widget/text_utilis.dart';

class AnyQuestionScreen extends StatelessWidget {
  final String title;
  final int index;
  const AnyQuestionScreen({required this.title, required this.index, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            // backgroundColor: Colors.white,
            appBar: AppBar(
              foregroundColor: Colors.black54,
              title: Text(
                title,
                style: TextStyle(
                    color: Colors.black54, fontSize: size.width * 0.04),
              ),
              backgroundColor: Colors.white,
              elevation: 1,
            ),
            backgroundColor: Colors.grey.shade200,
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: size.height * 0.03,
                  horizontal: size.width * 0.05,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextUtils(
                        fontSize: size.width * 0.05,
                        fontWeight: FontWeight.bold,
                        text: title,
                        color: Colors.black,
                        underLine: TextDecoration.none),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Row(
                      children: [
                        TextUtils(
                            fontSize: size.width * 0.04,
                            fontWeight: FontWeight.normal,
                            text: 'حياك في رسلني',
                            color: Colors.black,
                            underLine: TextDecoration.none),
                        SizedBox(width: size.width * 0.02),
                        const Icon(Icons.add_reaction_outlined),
                        const Icon(
                          Icons.auto_awesome,
                          color: Colors.green,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.06,
                    ),
                    index == 0
                        ? whatsAccountintwitter(
                            size: size,
                            isAccount: true,
                            title:
                                'بإمكانك متابعتنا والتواصل معنا عن طريق التويتر على حسابنا',
                            nameAccount: '@AppRaselne',
                          )
                        : index == 1
                            ? whatsAccountintwitter(
                                size: size,
                                isAccount: false,
                                title:
                                    'سعداء بخدمتكم , يرجى تعبئة النكوذج التالي بالمستندات المطلوبة:',
                                nameAccount: 'https//www.busness',
                              )
                            : const Text(''),
                    SizedBox(
                      height: size.height * 0.04,
                    ),
                    Row(
                      children: [
                        TextUtils(
                            fontSize: size.width * 0.04,
                            fontWeight: FontWeight.normal,
                            text: ' نسعد بخدمتكم ',
                            color: Colors.black,
                            underLine: TextDecoration.none),
                        SizedBox(width: size.width * 0.02),
                        const Icon(
                          Icons.auto_awesome,
                          color: Colors.green,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Row(
                      children: [
                        TextUtils(
                            fontSize: size.width * 0.04,
                            fontWeight: FontWeight.normal,
                            text: 'Raselne .',
                            color: Colors.black,
                            underLine: TextDecoration.none),
                        SizedBox(width: size.width * 0.02),
                        TextUtils(
                            fontSize: size.width * 0.04,
                            fontWeight: FontWeight.normal,
                            text: '6',
                            color: Colors.black,
                            underLine: TextDecoration.none),
                        TextUtils(
                            fontSize: size.width * 0.04,
                            fontWeight: FontWeight.normal,
                            text: 'مايو,',
                            color: Colors.black,
                            underLine: TextDecoration.none),
                        TextUtils(
                            fontSize: size.width * 0.04,
                            fontWeight: FontWeight.normal,
                            text: '2021',
                            color: Colors.black,
                            underLine: TextDecoration.none),
                      ],
                    ),
                  ],
                ),
              ),
            )));
  }

  Widget whatsAccountintwitter(
      {required Size size,
      required bool isAccount,
      required String title,
      required String nameAccount}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextUtils(
            fontSize: size.width * 0.04,
            fontWeight: FontWeight.normal,
            color: Colors.black,
            text: title,
            underLine: TextDecoration.none),
        TextButton(
          onPressed: () {},
          child: TextUtils(
              fontSize: size.width * 0.04,
              fontWeight: FontWeight.normal,
              text: nameAccount,
              color: Colors.orange,
              underLine: TextDecoration.none),
        ),
        isAccount
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: size.height * 0.06,
                  ),
                  TextUtils(
                      fontSize: size.width * 0.04,
                      fontWeight: FontWeight.normal,
                      text: 'أو بالنقر على الرابط التالي:',
                      color: Colors.black,
                      underLine: TextDecoration.none),
                  TextButton(
                    onPressed: () {},
                    child: TextUtils(
                        fontSize: size.width * 0.04,
                        fontWeight: FontWeight.normal,
                        text: 'https://twitter.com/appraselne',
                        color: Colors.orange,
                        underLine: TextDecoration.none),
                  ),
                ],
              )
            : const Text('')
      ],
    );
  }

// Widget contractWithraselne(){
//   ret
// }

}
