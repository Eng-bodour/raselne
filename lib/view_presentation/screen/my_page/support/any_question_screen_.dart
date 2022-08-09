import 'package:flutter/material.dart';

import 'package:raselne/view_presentation/widget/mypage/support/switch_case.dart';
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
                    switchCaseQuestion(
                      index: index,
                      size: size,
                    ),
                    SizedBox(
                      height: size.height * 0.04,
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
}
