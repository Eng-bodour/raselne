import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:raselne/data_layer/model/user_model.dart';
import 'package:raselne/utilis/theme.dart';
import 'package:raselne/view_presentation/widget/text_utilis.dart';

import '../../../data_layer/model/orderModel.dart';
import '../../../logic/controller/order_vm.dart';
import '../../screen/chat/chat_screen.dart';

class ShowOffers extends StatelessWidget {
  ShowOffers({required this.orderModel, Key? key}) : super(key: key);
  OrderModel orderModel;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child:  ModalProgressHUD(
        inAsyncCall: Provider.of<order_vm>(context,listen: true).isloading,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            // appBar: AppBar(),
            body: SizedBox(
              height: size.height,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.03, vertical: size.height * 0.27),
                child: StreamBuilder(
                  stream: Provider.of<order_vm>(context,listen: false).get_offer(orderModel.id_order),
                  builder: (BuildContext context,
                      AsyncSnapshot<OrderModel> snapshot_order) {
                    if (snapshot_order.hasError) {
                      return Text('something went wrong' +
                          snapshot_order.error.toString());
                    }
                    if (! snapshot_order.hasData) {
                      return Text("Loading");
                    }
                    return
                      FutureBuilder(
                        future: Provider.of<order_vm>(context,listen: false).getusercaptain(
                            snapshot_order.data!.captain_user.toString()),
                        builder: (BuildContext context,
                            AsyncSnapshot<UserModel> snapshot_user) {
                          if (snapshot_user.hasError) {
                            return Text('something went wrong' +
                                snapshot_user.error.toString());
                          }
                          if (!snapshot_user.hasData) {
                            return Text("Loading");
                          }
                          return
                           snapshot_order.data!.ispause==true?
                           Column(
                            children: [
                              Text(
                                'سعر التوصيل المتوقع ${snapshot_order.data!.price_deilvery} ر.س',
                                style: TextStyle(color: Colors.white),
                              ),
                              Container(
                                height: size.height * 0.35,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.circular(size.width * 0.07)),
                                child: Column(
                                  children: [
                                    Container(
                                        width: size.width,
                                        height: size.height * 0.06,
                                        decoration: BoxDecoration(
                                          color: mainColor,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(
                                                  size.width * 0.07),
                                              topRight: Radius.circular(
                                                  size.width * 0.07)),
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CircleAvatar(
                                            backgroundColor: greyColor,
                                            radius: size.width * 0.055,
                                            child: Icon(
                                              Icons.person,
                                              color: Colors.lightBlue
                                                  .withOpacity(0.9),
                                              size: size.width * 0.1,
                                            ),
                                          ),
                                          SizedBox(
                                            width: size.width * 0.02,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              TextUtils(
                                                  fontSize: size.width * 0.05,
                                                  fontWeight: FontWeight.bold,
                                                  text: snapshot_user.data!.name
                                                      .toString(), //'حسام', //'${Firebase.name}',
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
                                                      text:
                                                          ' ${snapshot_user.data!.num_travel} رحلة ', //'${Firebase.name}',
                                                      color: Colors.black54,
                                                      underLine:
                                                          TextDecoration.none),
                                                  SizedBox(
                                                    width: size.width * 0.03,
                                                  ),
                                                  TextUtils(
                                                      fontSize: size.width * 0.04,
                                                      fontWeight: FontWeight.bold,
                                                      text: snapshot_user
                                                          .data!.dateCreated,
                                                      //'مندوب منذ 2022 jun', //'${Firebase.name}',
                                                      color: Colors.black54,
                                                      underLine:
                                                          TextDecoration.none),
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
                                                      text: snapshot_order.data!
                                                          .distance_recive_deilvery, // '5.7 كم ', //'${Firebase.name}',
                                                      color: Colors.black54,
                                                      underLine:
                                                          TextDecoration.none),
                                                  SizedBox(
                                                    width: size.width * 0.03,
                                                  ),
                                                  TextUtils(
                                                      fontSize: size.width * 0.03,
                                                      fontWeight: FontWeight.bold,
                                                      text:
                                                          'بجوار موقع الاستلام', //'${Firebase.name}',
                                                      color: mainColor,
                                                      underLine:
                                                          TextDecoration.none),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'عرض التوصيل',
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: size.width * 0.05,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            '${snapshot_order.data!.price_deilvery_captain} ر.س ',
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          ElevatedButton(
                                            onPressed: () {
                                              Provider.of<order_vm>(context,
                                                      listen: false)
                                                  .approve_order_or_not(
                                                      snapshot_order
                                                          .data!,
                                                      true);
                                            },
                                            style: ElevatedButton.styleFrom(
                                              elevation: 0,
                                              primary: greyColor.withOpacity(0.5),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        size.width * 0.05),
                                              ), //Get.isDarkMode ? pinkClr : mainColor,
                                              minimumSize: Size(
                                                  size.height * 0.16,
                                                  size.width * 0.1),
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
                                              onPressed: () async {
                                               await Provider.of<order_vm>(context,
                                                        listen: false)
                                                        .approve_order_or_not(
                                                        snapshot_order.data!,
                                                        false);
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                    builder: (context) =>
                                                    ChatScreen(orderModel: orderModel,)));
                                              },
                                              style: ElevatedButton.styleFrom(
                                                elevation: 0,
                                                primary: mainColor,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          size.width * 0.05),
                                                ), //Get.isDarkMode ? pinkClr : mainColor,
                                                minimumSize: Size(
                                                    size.height * 0.23,
                                                    size.width * 0.1),
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
                                                    underLine:
                                                        TextDecoration.none,
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
                          ):Container();
                        });
                  },
                ),
              ),
            ),
            backgroundColor: greyColor,
          ),
        ),
      ),
    );
  }
}
