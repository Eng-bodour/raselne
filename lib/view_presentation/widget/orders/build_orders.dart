import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:raselne/data_layer/model/orderModel.dart';
import 'package:raselne/utilis/theme.dart';
import 'package:raselne/view_presentation/widget/text_utilis.dart';

import '../../../utilis/global_method.dart';
import '../mypage_driver/show_offers.dart';

class buildCardOrders extends StatelessWidget {
   buildCardOrders({ required this. orderModel,
    required this. size,Key? key}) : super(key: key);
  OrderModel orderModel;
  Size size;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.03,
        vertical: size.width * 0.01,
      ),
      child: Card(
        child: SizedBox(
          height: size.height * 0.29,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.04, vertical: size.height * 0.01),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.red),
                          child: Icon(
                            Icons.close,
                            color: Colors.white,
                            size: size.width * 0.04,
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.01,
                        ),
                        TextUtils(
                            fontSize: size.width * 0.04,
                            fontWeight: FontWeight.normal,
                            text: getstate_order
                              ('isopen') , //'ملغى',
                            color: Colors.red,
                            underLine: TextDecoration.none)
                      ],
                    ),
                    TextUtils(
                        fontSize: size.width * 0.04,
                        fontWeight: FontWeight.normal,
                        text:orderModel.DateTimeorder.toString(),// 'سنة',
                        color: Colors.black54,
                        underLine: TextDecoration.none)
                  ],
                ),
              ),
              const Divider(
                thickness: 1,
              ),
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: size.width * 0.08,
                    child: Icon(
                      Icons.person,
                      color: Colors.lightBlue.withOpacity(0.9),
                      size: size.width * 0.06,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextUtils(
                          fontSize: size.width * 0.04,
                          fontWeight: FontWeight.bold,
                          text:orderModel.titleStore , //'اسم المطعم', //'${Firebase.name}',
                          color: Colors.black54,
                          underLine: TextDecoration.none),
                      Row(
                        children: [
                          RatingBarIndicator(
                            // rating: rate,
                            //to do
                            rating: 5,
                            itemBuilder: (context, index) => Icon(
                              Icons.star,
                              color: Colors.orange.withOpacity(0.4),
                            ),
                            itemCount: 5,
                            itemPadding: const EdgeInsets.only(left: 4),
                            itemSize: size.width * 0.03,
                            direction: Axis.horizontal,
                          ),
                          TextUtils(
                              fontSize: size.width * 0.02,
                              fontWeight: FontWeight.normal,
                              text: '4.6',
                              color: Colors.black54,
                              underLine: TextDecoration.none)
                        ],
                      ),
                    ],
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                child: TextUtils(
                    fontSize: size.width * 0.04,
                    fontWeight: FontWeight.normal,
                    text:'وصف الطلب',
                    //orderModel.content_order, //
                    color: Colors.black54,
                    underLine: TextDecoration.none),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                    child: Row(
                      children: [
                        TextUtils(
                            fontSize: size.width * 0.04,
                            fontWeight: FontWeight.normal,
                            text: 'المجموع',
                            color: Colors.black54,
                            underLine: TextDecoration.none),
                        SizedBox(width: size.width * 0.02),
                        TextUtils(
                            fontSize: size.width * 0.04,
                            fontWeight: FontWeight.normal,
                            text: '${orderModel.total.toString()} رس',
                            color: mainColor,
                            underLine: TextDecoration.none),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                    child: TextUtils(
                        fontSize: size.width * 0.04,
                        fontWeight: FontWeight.normal,
                        text: 'كم 2.7',
                        color: Colors.black54,
                        underLine: TextDecoration.none),
                  ),
                ],
              ),
              ElevatedButton(
                  onPressed: () {
                    if(orderModel.isopen)
                      Navigator.of(context).push(MaterialPageRoute(builder:
                          (context)=>
                              ShowOffers(id_order: orderModel.id_order)
                      )) ;

                  },
                  style: ButtonStyle(
                      elevation: MaterialStateProperty.all(0),
                      backgroundColor: MaterialStateProperty.all(mainColor)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.25),
                    child: Row(
                      children: [
                        orderModel.isopen==true?
                        Text('متابعة',
                            style: TextStyle(
                              fontSize: size.width * 0.045,
                            )):
                        Text('إعادة الطلب',
                            style: TextStyle(
                              fontSize: size.width * 0.045,
                            )),
                        SizedBox(
                          width: size.width * 0.02,
                        ),
                        const Icon(
                          Icons.refresh_outlined,
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}





