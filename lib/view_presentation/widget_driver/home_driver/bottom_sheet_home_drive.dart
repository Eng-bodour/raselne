import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:raselne/data_layer/model/orderModel.dart';
import 'package:raselne/routes/routes.dart';
import 'package:raselne/utilis/theme.dart';
import 'package:raselne/view_presentation/screen_driver/waiting_approve_order.dart';

import 'package:raselne/view_presentation/widget/text_utilis.dart';

import '../../../logic/controller/order_vm.dart';

class bottomsheet_offer extends StatelessWidget {
   bottomsheet_offer({required this.order, Key? key}) : super(key: key);
  OrderModel order;
  @override
  Widget build(BuildContext context) {
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.06,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: greyColor.withOpacity(0.2),
                          radius: size.width * 0.05,
                          child: Icon(
                            Icons.shopping_bag_rounded,
                            color: Colors.lightBlue.withOpacity(0.9),
                            size: size.width * 0.09,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextUtils(
                                fontSize: size.width * 0.04,
                                fontWeight: FontWeight.bold,
                                text: order.titleStore,
                                color: Colors.black54,
                                underLine: TextDecoration.none),
                            TextUtils(
                                fontSize: size.width * 0.04,
                                fontWeight: FontWeight.bold,
                                text: order.id_order,
                                color: Colors.black54,
                                underLine: TextDecoration.none),
                          ],
                        ),
                      ],
                    ),
                    CircleAvatar(
                        backgroundColor: greyColor.withOpacity(0.6),
                        radius: size.width * 0.05,
                        child: IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: Icon(
                              Icons.close,
                              size: size.width * 0.05,
                              color: Colors.white,
                            ))),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Container(
                height: size.height * 0.1,
                decoration: BoxDecoration(color: mainColor.withOpacity(0.2)),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.06,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.person,
                        color: mainColor,
                        size: size.width * 0.1,
                      ),
                      TextUtils(
                          fontSize: size.width * 0.04,
                          fontWeight: FontWeight.bold,
                          text: order.from_user.toString(),//'Sa**b',
                          color: Colors.black45,
                          underLine: TextDecoration.none),
                      SizedBox(width: size.width * 0.02),
                      Icon(
                        Icons.star,
                        color: mainColor,
                        size: size.width * 0.05,
                      ),
                      SizedBox(width: size.width * 0.01),
                      TextUtils(
                          fontSize: size.width * 0.04,
                          fontWeight: FontWeight.bold,
                          text: '5.0',
                          color: Colors.black45,
                          underLine: TextDecoration.none),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.06,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextUtils(
                        fontSize: size.width * 0.04,
                        fontWeight: FontWeight.bold,
                        text: 'infoOrder',
                        color: Colors.black45,
                        underLine: TextDecoration.none),
                    //SizedBox(width: size.width * 0.02),
                    TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.info,
                          color: Colors.black45,
                        ),
                        label: const Text(
                          'تبليغ',
                          style: TextStyle(color: Colors.black45),
                        ))
                  ],
                ),
              ) // Container(

              ,
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.06,
                ),
                child: Text(order.content_order.toString(),),
              ),
              Container(
                  height: size.height * 0.4,
                  decoration: const BoxDecoration(color: mainColor)),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.06, vertical: size.height * 0.01),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.business_outlined,
                                color: mainColor,
                                size: size.width * 0.08,
                              ),
                              TextUtils(
                                  fontSize: size.width * 0.04,
                                  fontWeight: FontWeight.bold,
                                  text: order.distance_me_recive,
                                  color: Colors.black87,
                                  underLine: TextDecoration.none),
                            ],
                          ),
                          TextUtils(
                              fontSize: size.width * 0.04,
                              fontWeight: FontWeight.bold,
                              text: 'موقع الاستلام',
                              color: Colors.black45,
                              underLine: TextDecoration.none),
                          TextUtils(
                              fontSize: size.width * 0.03,
                              fontWeight: FontWeight.bold,
                              text: 'اللوكاشن المحدد من الخريطة',
                              color: Colors.black45,
                              underLine: TextDecoration.none),
                        ]),
                    const Text('____'),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.home,
                                color: mainColor,
                                size: size.width * 0.08,
                              ),
                              SizedBox(
                                width: size.width * 0.01,
                              ),
                              TextUtils(
                                  fontSize: size.width * 0.04,
                                  fontWeight: FontWeight.bold,
                                  text: order.distance_recive_deilvery,
                                  color: Colors.black87,
                                  underLine: TextDecoration.none),
                            ],
                          ),
                          TextUtils(
                              fontSize: size.width * 0.04,
                              fontWeight: FontWeight.bold,
                              text: 'موقع التسليم',
                              color: Colors.black45,
                              underLine: TextDecoration.none),
                          TextUtils(
                              fontSize: size.width * 0.03,
                              fontWeight: FontWeight.bold,
                              text: 'اللوكاشن المحدد من الخريطة',
                              color: Colors.black45,
                              underLine: TextDecoration.none),
                        ]),
                  ],
                ),
              ),
              Container(
                height: size.height * 0.1,
                decoration: const BoxDecoration(color: mainColor),
                child: Column(
                  children: [
                    TextUtils(
                        fontSize: size.width * 0.04,
                        fontWeight: FontWeight.bold,
                        text: 'تأكيد العرض',
                        color: Colors.white,
                        underLine: TextDecoration.none),
                    Padding(
                      padding:
                      EdgeInsets.symmetric(horizontal: size.width * 0.06),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            onPressed: ()async {

                             await Provider.of<order_vm>(context,listen: false)
                                  .update_order(order.id_order);
                              ///////////////////////////////////////////
                         Navigator.push(context,
                             MaterialPageRoute(builder: (context)=>waiting_aprrove_order()));
                            },
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              primary: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(size.width * 0.03),
                              ), //Get.isDarkMode ? pinkClr : mainColor,
                              minimumSize:
                              Size(size.height * 0.3, size.width * 0.1),
                            ),
                            child: TextUtils(
                              color: mainColor,
                              text:order.price_deilvery+' ر.س ',// '20ر.س',
                              fontSize: size.width * 0.05,
                              fontWeight: FontWeight.bold,
                              underLine: TextDecoration.none,
                            ),
                          ),
                          SizedBox(width: size.width * 0.02),
                          ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                primary: greyColor.withOpacity(0.5),
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(size.width * 0.03),
                                ), //Get.isDarkMode ? pinkClr : mainColor,
                                minimumSize:
                                Size(size.height * 0.1, size.width * 0.1),
                              ),
                              child: Row(
                                children: [
                                  TextUtils(
                                    color: Colors.white,
                                    text: 'غير',
                                    fontSize: size.width * 0.05,
                                    fontWeight: FontWeight.bold,
                                    underLine: TextDecoration.none,
                                  ),
                                  const Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: Colors.white,
                                  ),
                                ],
                              )),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }

}