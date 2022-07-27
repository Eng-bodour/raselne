import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:raselne/utilis/theme.dart';
import 'package:raselne/view_presentation/widget/new_order/buildlist_newOrder.dart';
import 'package:raselne/view_presentation/widget/text_utilis.dart';

class NewOrderScreen extends StatelessWidget {
  const NewOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        toolbarHeight: size.height * 0.09,
        elevation: 2,
        leading: IconButton(
            onPressed: () {
              // Get.back();
            },
            icon: const Icon(Icons.info, color: mainColor)),
        actions: [
          IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.close, color: Colors.black))
        ],
        title: Column(
          children: [
            TextUtils(
                fontSize: size.width * 0.05,
                fontWeight: FontWeight.normal,
                text: 'طلب جديد',
                color: Colors.black54,
                underLine: TextDecoration.none),
            TextUtils(
                fontSize: size.width * 0.05,
                fontWeight: FontWeight.bold,
                text: 'اسم المطعم ',
                color: Colors.black54,
                underLine: TextDecoration.none),
          ],
        ),
      ),
      backgroundColor: Colors.grey.shade200,
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.05, vertical: size.height * 0.01),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            //mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextUtils(
                  fontSize: size.width * 0.05,
                  fontWeight: FontWeight.bold,
                  text: 'عناوين التوصيل',
                  color: Colors.black54,
                  underLine: TextDecoration.none),
              Container(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.03,
                      vertical: size.height * 0.01),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: const [
                              Icon(
                                Icons.info_rounded,
                                color: mainColor,
                              ),
                              Text(
                                'التوصيل إلى',
                                style: TextStyle(color: Colors.black54),
                              ),
                            ],
                          ),
                          Row(
                            children: const [
                              Text(
                                'اختر الموقع',
                                style: TextStyle(color: mainColor),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: mainColor,
                              )
                            ],
                          )
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(right: size.width * 0.06),
                        child: TextUtils(
                            fontSize: size.width * 0.04,
                            fontWeight: FontWeight.bold,
                            text: 'اختر مكان التوصيل',
                            color: Colors.black54,
                            underLine: TextDecoration.none),
                      )
                    ],
                  ),
                ),
                // width: size.width * 0.9,
                height: size.height * 0.09,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(size.width * 0.03)),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              TextUtils(
                  fontSize: size.width * 0.05,
                  fontWeight: FontWeight.bold,
                  text: 'طريقة الدفع',
                  color: Colors.black54,
                  underLine: TextDecoration.none),
              Container(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.03,
                      vertical: size.height * 0.01),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: const [
                              Icon(
                                Icons.payments,
                                color: mainColor,
                              ),
                              Text(
                                ' نوع الدفع',
                                style: TextStyle(color: Colors.black54),
                              ),
                            ],
                          ),
                          Row(
                            children: const [
                              Text(
                                'تغيير',
                                style: TextStyle(color: mainColor),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: mainColor,
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                // width: size.width * 0.9,
                height: size.height * 0.055,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(size.width * 0.03)),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextUtils(
                          fontSize: size.width * 0.05,
                          fontWeight: FontWeight.bold,
                          text: 'كوبون ',
                          color: Colors.black54,
                          underLine: TextDecoration.none),
                      Row(
                        children: [
                          TextUtils(
                              fontSize: size.width * 0.03,
                              fontWeight: FontWeight.bold,
                              text: 'أضف كوبون ',
                              color: mainColor,
                              underLine: TextDecoration.none),
                          const Icon(
                            Icons.add,
                            color: mainColor,
                          )
                        ],
                      )
                    ],
                  ),
                  TextUtils(
                      fontSize: size.width * 0.03,
                      fontWeight: FontWeight.normal,
                      text: 'رسوم التوصيل مخفضة',
                      color: Colors.orange,
                      underLine: TextDecoration.none)
                ],
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              TextUtils(
                  fontSize: size.width * 0.05,
                  fontWeight: FontWeight.bold,
                  text: 'الأصناف ',
                  color: Colors.black54,
                  underLine: TextDecoration.none),
              SizedBox(
                height: size.height * 0.15,
                child: const BuildListNewOrder(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
