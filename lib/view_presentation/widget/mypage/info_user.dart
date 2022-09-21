
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:raselne/data_layer/webServices/firebase.dart';
import 'package:raselne/logic/controller/auth_controller.dart';
import 'package:raselne/utilis/theme.dart';
import 'package:raselne/view_presentation/widget/mypage/logout_widget.dart';
import 'package:raselne/view_presentation/widget/mypage/notification_widget.dart';
import 'package:raselne/view_presentation/widget/text_utilis.dart';

Widget InfoUser({required Size size}) {

  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: size.width * 0.08,
            child: Icon(
              Icons.person,
              color: Colors.lightBlue.withOpacity(0.9),
              size: size.width * 0.15,
            ),
          ),
          SizedBox(
            width: size.width * 0.04,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextUtils(
                  fontSize: size.width * 0.05,
                  fontWeight: FontWeight.bold,
                  text:
                  //Provider.of<AuthProvider_vm>(context)
                  'Name Driver', //'${Firebase.name}',
                  color: Colors.black,
                  underLine: TextDecoration.none),
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
                itemSize: 20.0,
                direction: Axis.horizontal,
              ),
            ],
          )
        ],
      ),
      Row(
        children: [
          InkWell(
            child: const Icon(Icons.notifications, color: mainColor),
            onTap: () {
              Get.to(const NotificationWidget());
            },
          ),
          SizedBox(
            width: size.width * 0.02,
          ),
           LogOutWidget(),
        ],
      ),
    ],
  );
}