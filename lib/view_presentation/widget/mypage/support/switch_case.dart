import 'package:flutter/material.dart';
import 'package:raselne/view_presentation/widget/text_utilis.dart';

switchCaseQuestion({required int index, required Size size}) {
  switch (index) {
    case 0:
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextUtils(
              fontSize: size.width * 0.04,
              fontWeight: FontWeight.normal,
              color: Colors.black,
              text: 'بإمكانك متابعتنا والتواصل معنا عن طريق التويتر على حسابنا',
              underLine: TextDecoration.none),
          TextButton(
            onPressed: () {},
            child: TextUtils(
                fontSize: size.width * 0.04,
                fontWeight: FontWeight.normal,
                text: '@AppRaselne',
                color: Colors.orange,
                underLine: TextDecoration.none),
          ),
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
          SizedBox(
            height: size.height * 0.1,
          ),
          Row(
            children: [
              TextUtils(
                  fontSize: size.width * 0.04,
                  fontWeight: FontWeight.normal,
                  text: ' نسعد بخدمتك ',
                  color: Colors.black,
                  underLine: TextDecoration.none),
              SizedBox(width: size.width * 0.02),
              const Icon(
                Icons.auto_awesome,
                color: Colors.green,
              ),
            ],
          ),
        ],
      );

    case 1:
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        TextUtils(
            fontSize: size.width * 0.04,
            fontWeight: FontWeight.normal,
            color: Colors.black,
            text:
                'سعداء بخدمتكم , يرجى تعبئة النكوذج التالي بالمستندات المطلوبة:',
            underLine: TextDecoration.none),
        TextButton(
          onPressed: () {},
          child: TextUtils(
              fontSize: size.width * 0.04,
              fontWeight: FontWeight.normal,
              text: 'https://business.mrsool.co/registration',
              color: Colors.orange,
              underLine: TextDecoration.none),
        ),
        SizedBox(
          height: size.height * 0.1,
        ),
        Row(
          children: [
            TextUtils(
                fontSize: size.width * 0.04,
                fontWeight: FontWeight.normal,
                text: 'شكراً لاختيارك رسلني',
                color: Colors.black,
                underLine: TextDecoration.none),
            SizedBox(width: size.width * 0.02),
            const Icon(
              Icons.auto_awesome,
              color: Colors.green,
            ),
          ],
        ),
      ]);
    case 2:
      return Column(
        children: [
          RichText(
              text: TextSpan(
            text: 'أرسلها عني ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: size.width * 0.04,
              color: Colors.black,
            ),
            children: const [
              TextSpan(
                  style: TextStyle(
                      fontWeight: FontWeight.normal, color: Colors.black),
                  text:
                      ' هي خدمة لتوصيل أي شيء من أي مكان كان. كل ماعليك فعله هو فقط تحديد موقع الاستلام وهو الموقع الذي سيتم أخذ الغرض منه وموقع التسليم والذي سيتم توصيل الغرض إليه على الخريطة.')
            ],
          )),
          SizedBox(
            height: size.height * 0.1,
          ),
          Row(
            children: [
              TextUtils(
                  fontSize: size.width * 0.04,
                  fontWeight: FontWeight.normal,
                  text: 'شكراً لاستخدامك رسلني',
                  color: Colors.black,
                  underLine: TextDecoration.none),
              SizedBox(width: size.width * 0.02),
              const Icon(
                Icons.auto_awesome,
                color: Colors.green,
              ),
            ],
          ),
        ],
      );
    case 3:
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        TextUtils(
            fontSize: size.width * 0.04,
            fontWeight: FontWeight.normal,
            color: Colors.black,
            text: 'يرجى النقر على الرابط أدناه للوصول إلى قناتنا في التلغرام:',
            underLine: TextDecoration.none),
        TextButton(
          onPressed: () {},
          child: TextUtils(
              fontSize: size.width * 0.04,
              fontWeight: FontWeight.normal,
              text: 'https:t.me/raselne_help_bot',
              color: Colors.orange,
              underLine: TextDecoration.none),
        ),
        SizedBox(
          height: size.height * 0.1,
        ),
        Row(
          children: [
            TextUtils(
                fontSize: size.width * 0.04,
                fontWeight: FontWeight.normal,
                text: 'شكراً لاختيارك رسلني',
                color: Colors.black,
                underLine: TextDecoration.none),
            SizedBox(width: size.width * 0.02),
            const Icon(
              Icons.auto_awesome,
              color: Colors.green,
            ),
          ],
        ),
      ]);
    case 4:
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextUtils(
              fontSize: size.width * 0.04,
              fontWeight: FontWeight.normal,
              color: Colors.black,
              text: 'حمل تطبيقنا عن طريق :',
              underLine: TextDecoration.none),
          TextUtils(
              fontSize: size.width * 0.04,
              fontWeight: FontWeight.normal,
              color: Colors.black,
              text: '- App Store',
              underLine: TextDecoration.none),
          TextButton(
            onPressed: () {},
            child: TextUtils(
                fontSize: size.width * 0.04,
                fontWeight: FontWeight.normal,
                text: 'https://appStoreRaselne',
                color: Colors.orange,
                underLine: TextDecoration.none),
          ),
          TextUtils(
              fontSize: size.width * 0.04,
              fontWeight: FontWeight.normal,
              text: 'أو',
              color: Colors.black,
              underLine: TextDecoration.none),
          TextUtils(
              fontSize: size.width * 0.04,
              fontWeight: FontWeight.normal,
              text: '- Google Play',
              color: Colors.black,
              underLine: TextDecoration.none),
          TextButton(
            onPressed: () {},
            child: TextUtils(
                fontSize: size.width * 0.04,
                fontWeight: FontWeight.normal,
                text: 'https://googleplayRaselne',
                color: Colors.orange,
                underLine: TextDecoration.none),
          ),
          SizedBox(
            height: size.height * 0.1,
          ),
          Row(
            children: [
              TextUtils(
                  fontSize: size.width * 0.04,
                  fontWeight: FontWeight.normal,
                  text: 'شكراً لاستخدامك رسلني',
                  color: Colors.black,
                  underLine: TextDecoration.none),
              SizedBox(width: size.width * 0.02),
              const Icon(
                Icons.auto_awesome,
                color: Colors.green,
              ),
            ],
          ),
        ],
      );
    case 5:
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('يمكنك التواصل معنا من خلال التطبيق'),
          SizedBox(
            height: size.height * 0.05,
          ),
          Row(
            children: [
              TextUtils(
                  fontSize: size.width * 0.04,
                  fontWeight: FontWeight.normal,
                  text: 'شكراً لاختيارك رسلني',
                  color: Colors.black,
                  underLine: TextDecoration.none),
              SizedBox(width: size.width * 0.02),
              const Icon(
                Icons.auto_awesome,
                color: Colors.green,
              ),
            ],
          ),
        ],
      );
    case 6:
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
              'بإمكانك متابعتنا والتقديم على الوظائف المطروحة في حسابنا على LinkedIn'),
          SizedBox(
            height: size.height * 0.05,
          ),
          Row(
            children: [
              TextUtils(
                  fontSize: size.width * 0.04,
                  fontWeight: FontWeight.normal,
                  text: 'سعدنا بخدمتك',
                  color: Colors.black,
                  underLine: TextDecoration.none),
              SizedBox(width: size.width * 0.02),
              const Icon(
                Icons.auto_awesome,
                color: Colors.green,
              ),
            ],
          ),
        ],
      );
    case 7:
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
              ' رسلني هو أحد أشهر تطبيقات التوصيل في السودان . يوفر خدما ت التوصيل من مجموعة واسعة من المتاجر إلى المنازل أو لأي مكان . حيث يقوم العملاء بتحديد موقع الاستلام والتسليم على الخريطة وإرسال الطلب إلى مراسلينا وبعدها ستصلهم عروض المراسيل وللعميل الحق في إختيار أفضل وأنسب سعر بينهم. يمكن رسلني العملاء من التواصل مع المراسيل من خلال المحادثات أو المكالمات وبإمكانهم تتبع الطلب من بدايته حتى يتم تسليمه'),
          SizedBox(
            height: size.height * 0.05,
          ),
          Row(
            children: [
              TextUtils(
                  fontSize: size.width * 0.04,
                  fontWeight: FontWeight.normal,
                  text: 'شكراً لاختيارك رسلني ',
                  color: Colors.black,
                  underLine: TextDecoration.none),
              SizedBox(width: size.width * 0.02),
              const Icon(
                Icons.auto_awesome,
                color: Colors.green,
              ),
            ],
          ),
        ],
      );
    case 8:
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextUtils(
              fontSize: size.width * 0.04,
              fontWeight: FontWeight.normal,
              color: Colors.black,
              text:
                  'أولاً يجب عليك تحميل التطبيق والتسجيل كعميل ثم اتباع الخطوات التالية:',
              underLine: TextDecoration.none),
          SizedBox(
            height: size.height * 0.1,
          ),
          TextUtils(
              fontSize: size.width * 0.04,
              fontWeight: FontWeight.normal,
              color: Colors.black,
              text: 'يرجى تعبئة الرابط التالي:',
              underLine: TextDecoration.none),
          TextButton(
            onPressed: () {},
            child: TextUtils(
                fontSize: size.width * 0.04,
                fontWeight: FontWeight.normal,
                text: 'https://form.raselne.co/signup',
                color: Colors.orange,
                underLine: TextDecoration.none),
          ),
          SizedBox(
            height: size.height * 0.1,
          ),
          TextUtils(
              fontSize: size.width * 0.04,
              fontWeight: FontWeight.normal,
              text:
                  'سيصلك رمز التحقق عن طريق إشعارات التطبيق بعد إدخال رقم الجوال باللغة الانكليزية ثم قم بتعبئة الحقول المطلوبة لإكمال التسجيل كما يرجى مشهدة الفيديو في الرابط التالي:',
              color: Colors.black,
              underLine: TextDecoration.none),
          SizedBox(
            height: size.height * 0.1,
          ),
          Row(
            children: [
              TextUtils(
                  fontSize: size.width * 0.04,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                  text: '- كيف أعمل في رسلني ؟ ',
                  underLine: TextDecoration.none),
              const Icon(
                Icons.auto_awesome,
                color: Colors.green,
              ),
            ],
          ),
          TextButton(
            onPressed: () {},
            child: TextUtils(
                fontSize: size.width * 0.04,
                fontWeight: FontWeight.normal,
                text: 'youtube.be/',
                color: Colors.orange,
                underLine: TextDecoration.none),
          ),
          SizedBox(
            height: size.height * 0.1,
          ),
          Row(
            children: [
              TextUtils(
                  fontSize: size.width * 0.04,
                  fontWeight: FontWeight.normal,
                  text: 'يسعدنا انضمامك إلينا',
                  color: Colors.black,
                  underLine: TextDecoration.none),
              SizedBox(width: size.width * 0.02),
              const Icon(
                Icons.auto_awesome,
                color: Colors.green,
              ),
            ],
          ),
        ],
      );
  }
}
