import 'package:firebase_dart/auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:raselne/data_layer/model/orderModel.dart';
import 'package:raselne/data_layer/model/user_model.dart';
import 'package:raselne/logic/controller/order_vm.dart';
import 'package:raselne/services/polyline_service.dart';
import 'package:raselne/utilis/theme.dart';
import 'package:raselne/view_presentation/widget/text_utilis.dart';

import '../../../logic/controller/auth_controller.dart';
import 'bottom_sheet_home_drive.dart';

class card_deilvery extends StatefulWidget {
  card_deilvery({required this.order, Key? key}) : super(key: key);
  OrderModel order;
  @override
  State<card_deilvery> createState() => _card_deilveryState();
}

class _card_deilveryState extends State<card_deilvery> {
  TextEditingController valueController = TextEditingController();
  late Size size;

  late UserModel user;

  @override
  void initState() {
    // TODO: implement initState
    //WidgetsBinding.instance.addPostFrameCallback((_) async {

    user = Provider.of<AuthProvider_vm>(context, listen: false).currentuser;
    super.initState();

    // widget.order.distance_me_recive = PolylineService().calcDistance([
    //   LatLng(user.location!.latitude, user.location!.longitude),
    //   LatLng(widget.order.fromlocation.latitude,
    //       widget.order.fromlocation.longitude)
    // ]);
    // widget.order.distance_recive_deilvery = PolylineService().calcDistance([
    //   LatLng(widget.order.fromlocation.latitude,
    //       widget.order.fromlocation.longitude),
    //   LatLng(
    //       widget.order.toLocation.latitude,
    //       widget.order.toLocation.longitude)
    // ]);
    //
    // setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    widget.order.distance_recive_deilvery =
        PolylineService().calcDistance([
      LatLng(user.location!.latitude, user.location!.longitude),
      LatLng(widget.order.fromlocation!.latitude,
          widget.order.fromlocation!.longitude)
    ]);
    widget.order.distance_me_recive = PolylineService().calcDistance([
      LatLng(widget.order.fromlocation!.latitude,
          widget.order.fromlocation!.longitude),
      LatLng(
          widget.order.toLocation!.latitude, widget.order.toLocation!.longitude)
    ]);
    print(widget.order.distance_me_recive);
    print(widget.order.distance_recive_deilvery);
    user = Provider.of<AuthProvider_vm>(context, listen: true).currentuser;
    size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.39,
      decoration: const BoxDecoration(color: Colors.white),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.03, vertical: size.height * 0.02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  maxRadius: size.width * 0.045,
                  backgroundColor: Colors.grey.shade200,
                  child: Icon(
                    Icons.person,
                    size: size.width * 0.07,
                    color: mainColor,
                  ),
                ),
                SizedBox(
                  width: size.width * 0.02,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextUtils(
                        fontSize: size.width * 0.04,
                        fontWeight: FontWeight.bold,
                        text: widget.order.type_order,//'أرسلها عني',
                        color: Colors.black,
                        underLine: TextDecoration.none),
                    TextUtils(
                        fontSize: size.width * 0.03,
                        fontWeight: FontWeight.bold,
                        text: widget.order.id_order
                            .substring(0, 8), //'#123349599',
                        color: Colors.black54,
                        underLine: TextDecoration.none),
                  ],
                )
              ],
            ),
            //  SizedBox(height: size.height * 0.01),
            TextUtils(
                fontSize: size.width * 0.03,
                fontWeight: FontWeight.bold,
                text: 'تفاصيل الطلب',
                color: Colors.black,
                underLine: TextDecoration.none),
            TextUtils(
                fontSize: size.width * 0.03,
                fontWeight: FontWeight.bold,
                text: widget.order.content_order, //'محل نسبريسو 10 علب  قهوة',
                color: Colors.black45,
                underLine: TextDecoration.none),
            SizedBox(height: size.height * 0.01),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
              child: Row(
                children: [
                  Column(
                    children: [
                      Icon(
                        Icons.car_rental,
                        color: mainColor,
                        size: size.width * 0.08,
                      ),
                      TextUtils(
                          fontSize: size.width * 0.03,
                          fontWeight: FontWeight.bold,
                          text: 'موقعك الحالي',
                          color: Colors.black87,
                          underLine: TextDecoration.none),
                    ],
                  ),
                  TextUtils(
                      fontSize: size.width * 0.04,
                      fontWeight: FontWeight.bold,
                      text: widget.order
                          .distance_recive_deilvery, // '--   3.55 كم   --',//distance_me_recive
                      color: Colors.black45,
                      underLine: TextDecoration.none),
                  Column(
                    children: [
                      Icon(
                        Icons.business_outlined,
                        color: mainColor,
                        size: size.width * 0.08,
                      ),
                      TextUtils(
                          fontSize: size.width * 0.03,
                          fontWeight: FontWeight.bold,
                          text: 'موقع الاستلام',
                          color: Colors.black87,
                          underLine: TextDecoration.none),
                    ],
                  ),
                  TextUtils(
                      fontSize: size.width * 0.04,
                      fontWeight: FontWeight.bold,
                      text: widget.order
                          .distance_me_recive, // '--   13 كم   --',//distance_recive_deilvery
                      color: Colors.black45,
                      underLine: TextDecoration.none),
                  Column(
                    children: [
                      Icon(
                        Icons.bungalow_outlined,
                        color: mainColor,
                        size: size.width * 0.08,
                      ),
                      TextUtils(
                          fontSize: size.width * 0.03,
                          fontWeight: FontWeight.bold,
                          text: 'موقع التسليم',
                          color: Colors.black87,
                          underLine: TextDecoration.none),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.09),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      // Provider.of<order_vm>(context,listen: false)
                      // .setvaluePriceCaptain(valueController.text);
                      widget.order.price_deilvery_captain =
                          valueController.text;
                      // Get.to(bottomsheet_offer(
                      //   order: widget.order,
                      // ));
                      // showModalBottomSheet<dynamic>(
                      //   backgroundColor: Colors.grey.shade200,
                      //   //  backgroundColor: Colors.transparent,
                      //   elevation: 0,
                      //   shape: const RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.only(
                      //     topLeft: Radius.circular(20),
                      //     topRight: Radius.circular(20),
                      //   )),
                      //   context: context,
                      //   isScrollControlled: true,
                      //   builder: ((context) => bottomsheet_offer(
                      //         order: widget.order,
                      //       )),
                      //   // builder: ((context) => bottomSheetWithChoiseMealAdditions(context)),
                      // );
                      Get.to(
                          bottomsheet_offer(
                          order: widget.order,
                      ));
                    },
                    child: Container(
                      width: size.width * 0.4,
                      height: size.height * 0.05,
                      decoration: BoxDecoration(
                          color: mainColor,
                          borderRadius:
                              BorderRadius.circular(size.width * 0.1)),
                      child: Center(
                        child: TextUtils(
                          color: Colors.white,
                          text: 'قدم عرض',
                          fontSize: size.width * 0.05,
                          fontWeight: FontWeight.bold,
                          underLine: TextDecoration.none,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      cursorColor: mainColor,
                      controller: valueController,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        hintText: ' تقديم عرض السعر',
                        hintStyle: TextStyle(
                          color: Colors.black45,
                          fontSize: size.width * 0.04,
                          fontWeight: FontWeight.w500,
                        ),
                        filled: true,
                        enabledBorder: const UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white), //<-- SEE HERE
                        ),
                        // enabledBorder: OutlineInputBorder(
                        //   borderSide: const BorderSide(color: mainColor),
                        //   borderRadius: BorderRadius.circular(10),
                        // ),
                        // focusedBorder: OutlineInputBorder(
                        //   borderSide: const BorderSide(color: mainColor),
                        //   borderRadius: BorderRadius.circular(10),
                        // ),
                        // errorBorder: OutlineInputBorder(
                        //   borderSide: const BorderSide(color: mainColor),
                        //   borderRadius: BorderRadius.circular(10),
                        // ),
                        // focusedErrorBorder: OutlineInputBorder(
                        //   borderSide: const BorderSide(color: mainColor),
                        //   borderRadius: BorderRadius.circular(10),
                        // ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // TextUtils(
            //   color: Colors.black26,
            //   text: 'من 20 رس إلى 22 رس',
            //   fontSize: size.width * 0.03,
            //   fontWeight: FontWeight.bold,
            //   underLine: TextDecoration.none,
            // ),
          ],
        ),
      ),
    );
  }
}
