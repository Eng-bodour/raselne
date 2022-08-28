import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:group_button/group_button.dart';
import 'package:raselne/utilis/theme.dart';
import 'package:raselne/view_presentation/widget/text_utilis.dart';

import '../screen/orders_screen.dart';
import '../widget/orders/build_orders.dart';

class OrdersDriverScreen extends StatefulWidget {
   OrdersDriverScreen({Key? key}) : super(key: key);

  @override
  State<OrdersDriverScreen> createState() => _OrdersDriverScreenState();
}

class _OrdersDriverScreenState extends State<OrdersDriverScreen> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.black87,
          title: const Text(
            'طلبات التوصيل',
            style: TextStyle(color: Colors.black87),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
        ),
        backgroundColor: Colors.grey.shade200,
        body: SingleChildScrollView(
            child: Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: size.width,
                      color: Colors.white,
                      child: GroupButton(
                        options: GroupButtonOptions(
                          borderRadius:
                              BorderRadius.circular(size.width * 0.01),
                          buttonWidth: size.width * 0.48,
                          //elevation: 0,
                          selectedColor: mainColor,
                        ),
                        controller: GroupButtonController(
                          selectedIndex: selected,
                          // onDisablePressed: (i) =>
                          //     print('Button #$i is disabled'),
                        ),
                        buttons: const ['التوصيل', 'طلباتي'],
                        onSelected: (value, index, isSelected) {
                          setState(() {
                            selected = index;
                          });
                          print('$index  +  $selected');
                        },
                      ),
                    ),
                    selected == 0
                        ? ListView.builder(
                            shrinkWrap: true,
                            controller: ScrollController(),
                            scrollDirection: Axis.vertical,
                            itemCount: 2,
                            itemBuilder: (context, index) {
                              return buildMyDelevery(size: size);
                            },
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            controller: ScrollController(),
                            scrollDirection: Axis.vertical,
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return Text('data');
                                //buildCardOrders(size: size);
                            },
                          )
                  ],
                ))));
  }

  Widget buildMyDelevery({required Size size}) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.03,
          vertical: size.width * 0.01,
        ),
        child: Card(
          child: SizedBox(
            height: size.height * 0.2,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.02, vertical: size.height * 0.02),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: greyColor,
                            radius: size.width * 0.05,
                            child: Icon(
                              Icons.person,
                              color: Colors.lightBlue.withOpacity(0.9),
                              size: size.width * 0.06,
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.03,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextUtils(
                                  fontSize: size.width * 0.04,
                                  fontWeight: FontWeight.bold,
                                  text:
                                      'صيدلية مستشفى الحبيب', //'${Firebase.name}',
                                  color: Colors.black54,
                                  underLine: TextDecoration.none),
                              TextUtils(
                                  fontSize: size.width * 0.03,
                                  fontWeight: FontWeight.bold,
                                  text:
                                      'وصفة من الصيدلية', //'${Firebase.name}',
                                  color: Colors.black38,
                                  underLine: TextDecoration.none),
                            ],
                          ),
                        ],
                      ),
                      TextUtils(
                          fontSize: size.width * 0.04,
                          fontWeight: FontWeight.normal,
                          text: '#123456777',
                          color: Colors.black54,
                          underLine: TextDecoration.none)
                    ],
                  ),
                  SizedBox(height: size.height * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.access_time_rounded,
                            color: Colors.black38,
                            size: size.width * 0.04,
                          ),
                          SizedBox(width: size.width * 0.01),
                          TextUtils(
                              fontSize: size.width * 0.035,
                              fontWeight: FontWeight.bold,
                              text: 'تم التوصيل 3 ساعات', //'${Firebase.name}',
                              color: Colors.black38,
                              underLine: TextDecoration.none),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.price_change,
                            color: Colors.black38,
                            size: size.width * 0.04,
                          ),
                          SizedBox(width: size.width * 0.01),
                          TextUtils(
                              fontSize: size.width * 0.035,
                              fontWeight: FontWeight.bold,
                              text:
                                  'سعر التوصيل 35.75 رس', //'${Firebase.name}',
                              color: Colors.black38,
                              underLine: TextDecoration.none),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: size.height * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          width: size.width * 0.4,
                          height: size.height * 0.03,
                          decoration: BoxDecoration(
                              color: Colors.yellow,
                              borderRadius:
                                  BorderRadius.circular(size.width * 0.1)),
                          child: Center(
                            child: TextUtils(
                              color: Colors.black,
                              text: 'تم التوصيل',
                              fontSize: size.width * 0.03,
                              fontWeight: FontWeight.bold,
                              underLine: TextDecoration.none,
                            ),
                          ),
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.black26,
                        size: size.width * 0.03,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Widget buildMyOrders({required Size size}) {
  //   return Padding(
  //     padding: EdgeInsets.symmetric(
  //       horizontal: size.width * 0.03,
  //       vertical: size.width * 0.01,
  //     ),
  //     child: Card(
  //       child: SizedBox(
  //         height: size.height * 0.29,
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Padding(
  //               padding: EdgeInsets.symmetric(
  //                   horizontal: size.width * 0.04,
  //                   vertical: size.height * 0.01),
  //               child: Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   Row(
  //                     children: [
  //                       Container(
  //                         decoration: const BoxDecoration(
  //                             shape: BoxShape.circle, color: Colors.red),
  //                         child: Icon(
  //                           Icons.close,
  //                           color: Colors.white,
  //                           size: size.width * 0.04,
  //                         ),
  //                       ),
  //                       SizedBox(
  //                         width: size.width * 0.01,
  //                       ),
  //                       TextUtils(
  //                           fontSize: size.width * 0.04,
  //                           fontWeight: FontWeight.normal,
  //                           text: 'ملغى',
  //                           color: Colors.red,
  //                           underLine: TextDecoration.none)
  //                     ],
  //                   ),
  //                   TextUtils(
  //                       fontSize: size.width * 0.04,
  //                       fontWeight: FontWeight.normal,
  //                       text: 'سنة',
  //                       color: Colors.black54,
  //                       underLine: TextDecoration.none)
  //                 ],
  //               ),
  //             ),
  //             const Divider(
  //               thickness: 1,
  //             ),
  //             Row(
  //               children: [
  //                 CircleAvatar(
  //                   backgroundColor: Colors.white,
  //                   radius: size.width * 0.08,
  //                   child: Icon(
  //                     Icons.person,
  //                     color: Colors.lightBlue.withOpacity(0.9),
  //                     size: size.width * 0.06,
  //                   ),
  //                 ),
  //                 Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     TextUtils(
  //                         fontSize: size.width * 0.04,
  //                         fontWeight: FontWeight.bold,
  //                         text: 'اسم المطعم', //'${Firebase.name}',
  //                         color: Colors.black54,
  //                         underLine: TextDecoration.none),
  //                     Row(
  //                       children: [
  //                         RatingBarIndicator(
  //                           // rating: rate,
  //                           //to do
  //                           rating: 5,
  //                           itemBuilder: (context, index) => Icon(
  //                             Icons.star,
  //                             color: Colors.orange.withOpacity(0.4),
  //                           ),
  //                           itemCount: 5,
  //                           itemPadding: const EdgeInsets.only(left: 4),
  //                           itemSize: size.width * 0.03,
  //                           direction: Axis.horizontal,
  //                         ),
  //                         TextUtils(
  //                             fontSize: size.width * 0.02,
  //                             fontWeight: FontWeight.normal,
  //                             text: '4.6',
  //                             color: Colors.black54,
  //                             underLine: TextDecoration.none)
  //                       ],
  //                     ),
  //                   ],
  //                 )
  //               ],
  //             ),
  //             Padding(
  //               padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
  //               child: TextUtils(
  //                   fontSize: size.width * 0.04,
  //                   fontWeight: FontWeight.normal,
  //                   text: 'وصف الطلب',
  //                   color: Colors.black54,
  //                   underLine: TextDecoration.none),
  //             ),
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               children: [
  //                 Padding(
  //                   padding:
  //                       EdgeInsets.symmetric(horizontal: size.width * 0.05),
  //                   child: Row(
  //                     children: [
  //                       TextUtils(
  //                           fontSize: size.width * 0.04,
  //                           fontWeight: FontWeight.normal,
  //                           text: 'المجموع',
  //                           color: Colors.black54,
  //                           underLine: TextDecoration.none),
  //                       SizedBox(width: size.width * 0.02),
  //                       TextUtils(
  //                           fontSize: size.width * 0.04,
  //                           fontWeight: FontWeight.normal,
  //                           text: '200 رس',
  //                           color: mainColor,
  //                           underLine: TextDecoration.none),
  //                     ],
  //                   ),
  //                 ),
  //                 Padding(
  //                   padding:
  //                       EdgeInsets.symmetric(horizontal: size.width * 0.05),
  //                   child: TextUtils(
  //                       fontSize: size.width * 0.04,
  //                       fontWeight: FontWeight.normal,
  //                       text: 'كم 2.7',
  //                       color: Colors.black54,
  //                       underLine: TextDecoration.none),
  //                 ),
  //               ],
  //             ),
  //             ElevatedButton(
  //                 onPressed: () {},
  //                 style: ButtonStyle(
  //                     elevation: MaterialStateProperty.all(0),
  //                     backgroundColor: MaterialStateProperty.all(mainColor)),
  //                 child: Padding(
  //                   padding:
  //                       EdgeInsets.symmetric(horizontal: size.width * 0.25),
  //                   child: Row(
  //                     children: [
  //                       Text('إعادة الطلب',
  //                           style: TextStyle(
  //                             fontSize: size.width * 0.045,
  //                           )),
  //                       SizedBox(
  //                         width: size.width * 0.02,
  //                       ),
  //                       const Icon(
  //                         Icons.refresh_outlined,
  //                       ),
  //                     ],
  //                   ),
  //                 ))
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
