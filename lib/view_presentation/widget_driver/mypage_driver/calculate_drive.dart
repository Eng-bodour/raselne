import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:raselne/logic/controller/auth_controller.dart';
import 'package:raselne/view_presentation/widget/text_utilis.dart';
import 'package:provider/provider.dart';


Widget CalculateDriver({required Size size,required BuildContext context}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            TextUtils(
                fontSize: size.width * 0.04,
                fontWeight: FontWeight.bold,
                text: 'الطلبات الموصلة',
                color: Colors.black87,
                underLine: TextDecoration.none),
            TextUtils(
                fontSize: size.width * 0.05,
                fontWeight: FontWeight.normal,
                text: ' ${Provider.of<AuthProvider_vm>(context,listen:true)
                .currentuser.num_travel } طلب ',
                color: Colors.black54,
                underLine: TextDecoration.none),
          ],
        ),
        Column(
          children: [
            TextUtils(
                fontSize: size.width * 0.04,
                fontWeight: FontWeight.bold,
                text: 'إجمالي الإيرادات',
                color: Colors.black87,
                underLine: TextDecoration.none),
            TextUtils(
                fontSize: size.width * 0.05,
                fontWeight: FontWeight.normal,
                text: ' ${Provider.of<AuthProvider_vm>(context,listen:true)
                    .currentuser.eradat }  ر.س ',
                color: Colors.black54,
                underLine: TextDecoration.none),
          ],
        )
      ],
    ),
  );
}
