import 'package:firebase_dart/auth.dart';
import 'package:flutter/material.dart';
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
  card_deilvery({required this.order,Key? key}) : super(key: key);
  OrderModel order;
  @override
  State<card_deilvery> createState() => _card_deilveryState();
}

class _card_deilveryState extends State<card_deilvery> {


  late  Size size;

  late UserModel user;

  @override void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((_) async {
    user= Provider.of<AuthProvider_vm>(context,listen: false).currentuser;

    widget. order.distance_me_recive=PolylineService().calcDistance(
        [LatLng(user.location!.latitude, user.location!.longitude),
          LatLng( widget.order.fromlocation.latitude,  widget.order.fromlocation.longitude)]);
   widget.order.distance_recive_deilvery=PolylineService().calcDistance(
        [LatLng( widget.order.fromlocation.latitude,  widget.order.fromlocation.longitude),
          LatLng( widget.order.toLocation.latitude, widget. order.toLocation.longitude)]);
    print( widget.order.distance_me_recive);
    print( widget.order.distance_recive_deilvery);});
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    user= Provider.of<AuthProvider_vm>(context,listen: true).currentuser;
    size= MediaQuery.of(context).size;
    return  Container(
      height: size.height * 0.3,
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
                        text: 'أرسلها عني',
                        color: Colors.black87,
                        underLine: TextDecoration.none),
                    TextUtils(
                        fontSize: size.width * 0.03,
                        fontWeight: FontWeight.bold,
                        text: '#123349599',
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
                color: Colors.black38,
                underLine: TextDecoration.none),
            TextUtils(
                fontSize: size.width * 0.03,
                fontWeight: FontWeight.bold,
                text:  widget.order.content_order,//'محل نسبريسو 10 علب  قهوة',
                color: Colors.black45,
                underLine: TextDecoration.none),
            SizedBox(height: size.height * 0.01),
            Row(
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
                    text: widget.order.distance_me_recive,// '--   3.55 كم   --',//distance_me_recive
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
                    text: widget.order.distance_recive_deilvery,// '--   13 كم   --',//distance_recive_deilvery
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
            SizedBox(
              height: size.height * 0.03,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.09),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: size.width * 0.3,
                      height: size.height * 0.03,
                      decoration: BoxDecoration(
                          color: Colors.yellow[50],
                          borderRadius: BorderRadius.circular(size.width * 0.1)),
                      child: Center(
                        child: TextUtils(
                          color: Colors.black54,
                          text: 'عرض آخر',
                          fontSize: size.width * 0.03,
                          fontWeight: FontWeight.bold,
                          underLine: TextDecoration.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.05,
                  ),
                  InkWell(
                    onTap: () {
                   Navigator.push(context,
                       MaterialPageRoute(
                           builder: (context)=>
                               bottomsheet_offer( order: widget.order,)));
                    },
                    child: Container(
                      width: size.width * 0.4,
                      height: size.height * 0.03,
                      decoration: BoxDecoration(
                          color: Colors.yellow,
                          borderRadius: BorderRadius.circular(size.width * 0.1)),
                      child: Center(
                        child: TextUtils(
                          color: Colors.black,
                          text: 'قدم عرض 20 ر.س',
                          fontSize: size.width * 0.03,
                          fontWeight: FontWeight.bold,
                          underLine: TextDecoration.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            TextUtils(
              color: Colors.black26,
              text: 'من 20 رس إلى 22 رس',
              fontSize: size.width * 0.03,
              fontWeight: FontWeight.bold,
              underLine: TextDecoration.none,
            ),
          ],
        ),
      ),
    );
  }
}
