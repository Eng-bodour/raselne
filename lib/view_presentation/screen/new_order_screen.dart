import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:raselne/utilis/theme.dart';
import 'package:raselne/view_presentation/widget/auth/auth_text_from_field.dart';
import 'package:raselne/view_presentation/widget/new_order/buildlist_newOrder.dart';

import 'package:raselne/view_presentation/widget/specific%20store/location_receive_bottomsheet.dart';
import 'package:raselne/view_presentation/widget/specific%20store/payment_bottomsheet.dart';
import 'package:raselne/view_presentation/widget/text_utilis.dart';

import '../../../data_layer/model/orderModel.dart';
import '../../../logic/controller/order_vm.dart';
import '../widget/mypage_driver/show_offers.dart';

class NewOrderScreen extends StatefulWidget {
  const NewOrderScreen({Key? key}) : super(key: key);

  @override
  State<NewOrderScreen> createState() => _NewOrderScreenState();
}

class _NewOrderScreenState extends State<NewOrderScreen> {
  final TextEditingController notesController = TextEditingController();
  late OrderModel orderModel;
  bool isAddNote = false;

  @override
  Widget build(BuildContext context) {
    orderModel= Provider.of<order_vm>(context,listen: true).order;
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
                text:orderModel.titleStore,// 'اسم المطعم ',
                color: Colors.black54,
                underLine: TextDecoration.none),
          ],
        ),
      ),
      backgroundColor: Colors.grey.shade200,
      body: ModalProgressHUD(
        inAsyncCall: Provider.of<order_vm>(context).isloading,
        child: SingleChildScrollView(
          // controller: ScrollController(),
          physics: const NeverScrollableScrollPhysics(),

          // scrollDirection: Axis.vertical,
          child: Directionality(
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
                  InkWell(
                    onTap: () {
                      showModalBottomSheet<dynamic>(
                        backgroundColor: Colors.grey.shade200,
                        //  backgroundColor: Colors.transparent,
                        elevation: 0,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            )),
                        context: context,
                        isScrollControlled: true,
                        builder: ((context) =>
                            map_location()),
                        // builder: ((context) => bottomSheetWithChoiseMealAdditions(context)),
                      );
                    },
                    child: Container(
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
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(right: size.width * 0.06),
                                child: TextUtils(
                                    fontSize: size.width * 0.03,
                                    fontWeight: FontWeight.bold,
                                    text:orderModel.AddresstoLocation.toString(),// 'اختر مكان التوصيل',
                                    color: Colors.black54,
                                    underLine: TextDecoration.none),
                              ),
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
                  ),
                //   SizedBox(height: 10,),
                // InkWell(
                //   onTap: () {
                //     showModalBottomSheet<dynamic>(
                //       backgroundColor: Colors.grey.shade200,
                //       //  backgroundColor: Colors.transparent,
                //       elevation: 0,
                //       shape: const RoundedRectangleBorder(
                //           borderRadius: BorderRadius.only(
                //             topLeft: Radius.circular(20),
                //             topRight: Radius.circular(20),
                //           )),
                //       context: context,
                //       isScrollControlled: true,
                //       builder: ((context) =>
                //           map_location()),
                //       // builder: ((context) => bottomSheetWithChoiseMealAdditions(context)),
                //     );
                //   },
                //   child: Container(
                //     child: Padding(
                //       padding: EdgeInsets.symmetric(
                //           horizontal: size.width * 0.03,
                //           vertical: size.height * 0.01),
                //       child: Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           Row(
                //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //             children: [
                //               Row(
                //                 children: const [
                //                   Icon(
                //                     Icons.info_rounded,
                //                     color: mainColor,
                //                   ),
                //                   Text(
                //                     'التوصيل إلى',
                //                     style: TextStyle(color: Colors.black54),
                //                   ),
                //                 ],
                //               ),
                //               Row(
                //                 children: const [
                //                   Text(
                //                     'اختر الموقع',
                //                     style: TextStyle(color: mainColor),
                //                   ),
                //                   Icon(
                //                     Icons.arrow_forward_ios,
                //                     color: mainColor,
                //                   )
                //                 ],
                //               )
                //             ],
                //           ),
                //           Expanded(
                //             child: Container(
                //               margin: EdgeInsets.only(right: size.width * 0.06),
                //               child: TextUtils(
                //                   fontSize: size.width * 0.03,
                //                   fontWeight: FontWeight.bold,
                //                   text:orderModel.AddresstoLocation.toString(),// 'اختر مكان التوصيل',
                //                   color: Colors.black54,
                //                   underLine: TextDecoration.none),
                //             ),
                //           )
                //         ],
                //       ),
                //     ),
                //     // width: size.width * 0.9,
                //     height: size.height * 0.09,
                //     decoration: BoxDecoration(
                //         color: Colors.white,
                //         borderRadius: BorderRadius.circular(size.width * 0.03)),
                //   ),
                // ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  TextUtils(
                      fontSize: size.width * 0.05,
                      fontWeight: FontWeight.bold,
                      text: 'طريقة الدفع',
                      color: Colors.black54,
                      underLine: TextDecoration.none),
                  InkWell(
                    onTap: () {
                      showModalBottomSheet<dynamic>(
                        backgroundColor: Colors.grey.shade200,
                        //  backgroundColor: Colors.transparent,
                        elevation: 0,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            )),
                        context: context,
                        isScrollControlled: true,
                        builder: ((context) => paymentBottomSheet(context)),
                        // builder: ((context) => bottomSheetWithChoiseMealAdditions(context)),
                      );
                    },
                    child: Container(
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
                  // Container(
                  //     decoration: BoxDecoration(
                  //         color: Colors.white,
                  //         borderRadius: BorderRadius.circular(size.width * 0.03)),
                  //     height: size.height * 0.9,
                  //     child: Column(
                  //       children: [
                  //         Expanded(child: BuildListNewOrder()),
                  //         SizedBox(
                  //           height: size.height * 0.02,
                  //         ),
                  //         Container(
                  //             height: size.height * 0.05,
                  //             width: size.width * 0.7,
                  //             padding: EdgeInsets.symmetric(
                  //                 horizontal: size.width * 0.05),
                  //             child: Padding(
                  //               padding: EdgeInsets.symmetric(
                  //                   horizontal: size.width * 0.1),
                  //               child: Row(
                  //                 children: [
                  //                   const Icon(
                  //                     Icons.add,
                  //                     color: Colors.orange,
                  //                   ),
                  //                   TextUtils(
                  //                       fontSize: size.width * 0.04,
                  //                       fontWeight: FontWeight.bold,
                  //                       text: 'أضف ملاحظاتك',
                  //                       color: Colors.orange,
                  //                       underLine: TextDecoration.none)
                  //                 ],
                  //               ),
                  //             ),
                  //             decoration: BoxDecoration(
                  //                 borderRadius:
                  //                     BorderRadius.circular(size.width * 0.05),
                  //                 color: mainColor.withOpacity(0.7))),
                  //       ],
                  //     )),
                  Column(
                    children: [
                      BuildListNewOrder(),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            isAddNote = true;
                          });
                        },
                        child: isAddNote
                            ? showFeildText()
                            : Container(
                            height: size.height * 0.05,
                            width: size.width * 0.7,
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.05),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.1),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.add,
                                    color: Colors.orange,
                                  ),
                                  TextUtils(
                                      fontSize: size.width * 0.04,
                                      fontWeight: FontWeight.bold,
                                      text: 'أضف ملاحظاتك',
                                      color: Colors.orange,
                                      underLine: TextDecoration.none)
                                ],
                              ),
                            ),
                            decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.circular(size.width * 0.05),
                                color: mainColor.withOpacity(0.7))),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      bottomSheet: BottomAppBar(
        child: InkWell(
          onTap: ()async {
            Provider.of<order_vm>(context,listen: false)
                .order.detailorder=notesController.text;
            Provider.of<order_vm>(context,listen: false)
                .order.DateTimeorder=DateTime.now().toString();
            //distance_recive_deilvery
           await Provider.of<order_vm>(context,listen:  false)
                .addOrder( );
           Navigator.of(context).push(
               MaterialPageRoute(builder:
               (context)=> ShowOffers(orderModel: orderModel)
           )) ;
          },
          child:
          Container(
            width: size.width * 1,
            height: size.height * 0.1,
            decoration: const BoxDecoration(color: greyColor),
            child: Center(
                child: TextUtils(
                    fontSize: size.width * 0.05,
                    fontWeight: FontWeight.bold,
                    text: 'أرسل الطلب',
                    color: Colors.white,
                    underLine: TextDecoration.none)),
          ),
        ),
      ),
    );
  }

  Widget showFeildText() {
    return TextFormField(
      controller: notesController,
      maxLines: 2,
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value.toString().length < 6) {
          return 'notes should be longer ';
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        fillColor: Colors.white,
        hintText: 'رقم العمارة, رقم الشقة, علامة مميزة',
        hintStyle: const TextStyle(
          color: Colors.black45,
          fontSize: f16,
          fontWeight: FontWeight.w500,
        ),
        suffixIcon: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.camera,
              color: Colors.black,
            )),
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
    );
  }
}