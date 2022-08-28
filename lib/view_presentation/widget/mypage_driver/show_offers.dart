import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raselne/utilis/theme.dart';
import 'package:raselne/view_presentation/widget/text_utilis.dart';

import '../../../data_layer/model/orderModel.dart';
import '../../../logic/controller/order_vm.dart';
import '../../screen/chat/chat_screen.dart';

class ShowOffers extends StatelessWidget {
  ShowOffers({required this.id_order, Key? key}) : super(key: key);
  String id_order;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          // appBar: AppBar(),
          body: SizedBox(
            height: size.height,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.03, vertical: size.height * 0.27),
              child:  StreamBuilder(
                stream: Provider.of<order_vm>(context).get_offer(id_order),
                builder: (BuildContext context,
                    AsyncSnapshot<OrderModel>
                    snapshot) {
                  if(snapshot.hasError){
                    return Text('something went wrong'+snapshot.error.toString());
                  }
                  if(snapshot.connectionState==ConnectionState.waiting){
                    return Text("Loading");
                  }
                  return
                        Column(
                          children: [
                             Text(
                              'سعر التوصيل المتوقع ${snapshot.data!.price_deilvery} ر.س',
                              style: TextStyle(color: Colors.white),
                            ),
                            Container(
                              height: size.height * 0.35,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(size.width * 0.07)),
                              child: Column(
                                children: [
                                  Container(
                                      width: size.width,
                                      height: size.height * 0.06,
                                      decoration: BoxDecoration(
                                        color: mainColor,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(size.width * 0.07),
                                            topRight: Radius.circular(size.width * 0.07)),
                                      ),
                                      child: Center(
                                        child: Text('العرض الأفضل قيمة',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: size.width * 0.05,
                                                fontWeight: FontWeight.bold)),
                                      )),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: size.width * 0.04,
                                        vertical: size.height * 0.02),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        CircleAvatar(
                                          backgroundColor: greyColor,
                                          radius: size.width * 0.055,
                                          child: Icon(
                                            Icons.person,
                                            color: Colors.lightBlue.withOpacity(0.9),
                                            size: size.width * 0.1,
                                          ),
                                        ),
                                        SizedBox(
                                          width: size.width * 0.02,
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            TextUtils(
                                                fontSize: size.width * 0.05,
                                                fontWeight: FontWeight.bold,
                                                text: snapshot.data!.user_captain.name.toString(),//'حسام', //'${Firebase.name}',
                                                color: Colors.black54,
                                                underLine: TextDecoration.none),
                                            Row(
                                              children: [
                                                CircleAvatar(
                                                  backgroundColor: greyColor,
                                                  radius: size.width * 0.02,
                                                  child: Icon(
                                                    Icons.car_rental,
                                                    color: Colors.white,
                                                    size: size.width * 0.02,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: size.width * 0.01,
                                                ),
                                                TextUtils(
                                                    fontSize: size.width * 0.04,
                                                    fontWeight: FontWeight.bold,
                                                    text: ' ${snapshot.data!.user_captain.num_travel} رحلة ', //'${Firebase.name}',
                                                    color: Colors.black54,
                                                    underLine: TextDecoration.none),
                                                SizedBox(
                                                  width: size.width * 0.03,
                                                ),
                                                TextUtils(
                                                    fontSize: size.width * 0.04,
                                                    fontWeight: FontWeight.bold,
                                                    text:snapshot.data!.user_captain.dateCreated,
                                                    //'مندوب منذ 2022 jun', //'${Firebase.name}',
                                                    color: Colors.black54,
                                                    underLine: TextDecoration.none),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                CircleAvatar(
                                                  backgroundColor: greyColor,
                                                  radius: size.width * 0.02,
                                                  child: Icon(
                                                    Icons.location_on_outlined,
                                                    color: Colors.white,
                                                    size: size.width * 0.02,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: size.width * 0.01,
                                                ),
                                                TextUtils(
                                                    fontSize: size.width * 0.04,
                                                    fontWeight: FontWeight.bold,
                                                    text: snapshot.data!.distance_recive_deilvery,// '5.7 كم ', //'${Firebase.name}',
                                                    color: Colors.black54,
                                                    underLine: TextDecoration.none),
                                                SizedBox(
                                                  width: size.width * 0.03,
                                                ),
                                                TextUtils(
                                                    fontSize: size.width * 0.03,
                                                    fontWeight: FontWeight.bold,
                                                    text:
                                                    'بجوار موقع الاستلام', //'${Firebase.name}',
                                                    color: mainColor,
                                                    underLine: TextDecoration.none),
                                              ],
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  const Divider(thickness: 0.5),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: size.width * 0.04,
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'عرض التوصيل',
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: size.width * 0.05,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          '${snapshot.data!.price_deilvery_captain} ر.س ',
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: size.width * 0.05,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: size.width * 0.04,
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        ElevatedButton(
                                          onPressed: () {
                                            Provider.of<order_vm>(context,listen: false).
                                            approve_order_or_not(snapshot.data!.id_order, true);
                                          },
                                          style: ElevatedButton.styleFrom(
                                            elevation: 0,
                                            primary: greyColor.withOpacity(0.5),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(
                                                  size.width * 0.05),
                                            ), //Get.isDarkMode ? pinkClr : mainColor,
                                            minimumSize: Size(
                                                size.height * 0.16, size.width * 0.1),
                                          ),
                                          child: TextUtils(
                                            color: Colors.white,
                                            text: 'رفض',
                                            fontSize: size.width * 0.05,
                                            fontWeight: FontWeight.bold,
                                            underLine: TextDecoration.none,
                                          ),
                                        ),
                                        SizedBox(width: size.width * 0.02),
                                        ElevatedButton(
                                            onPressed: () {
                                              Provider.of<order_vm>(context,listen: false).
                                              approve_order_or_not(snapshot.data!.id_order, false);
                                              Navigator.push(context,
                                                  MaterialPageRoute(builder: (context)=>ChatScreen()));
                                            },
                                            style: ElevatedButton.styleFrom(
                                              elevation: 0,
                                              primary: mainColor,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(
                                                    size.width * 0.05),
                                              ), //Get.isDarkMode ? pinkClr : mainColor,
                                              minimumSize: Size(
                                                  size.height * 0.23, size.width * 0.1),
                                            ),
                                            child: Row(
                                              children: [
                                                const Icon(
                                                  Icons.done,
                                                  color: Colors.white,
                                                ),
                                                TextUtils(
                                                  color: Colors.white,
                                                  text: 'قبول',
                                                  fontSize: size.width * 0.05,
                                                  fontWeight: FontWeight.bold,
                                                  underLine: TextDecoration.none,
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
                        );

                },

              ),

            ),
          ),
          backgroundColor: greyColor,
        ),
      ),
    );
  }
}