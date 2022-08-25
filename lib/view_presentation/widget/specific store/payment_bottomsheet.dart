import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:raselne/utilis/theme.dart';

Widget paymentBottomSheet(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return Directionality(
    textDirection: TextDirection.rtl,
    child: Container(
        height: size.height * 0.34,
        width: double.infinity,
        margin: EdgeInsets.symmetric(
          vertical: size.height * 0.01,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.06, vertical: size.height * 0.014),
          child:
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              children: [
                Text('طريقة الدفع',
                    style: TextStyle(
                        fontSize: size.width * 0.05,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54)),
                IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.close, color: Colors.black54))
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
            const Divider(
              thickness: 0.5,
              color: Colors.black12,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('اختر طريقة الدفع',
                      style: TextStyle(
                          fontSize: size.width * 0.05,
                          fontWeight: FontWeight.normal,
                          color: Colors.black54)),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        Icon(
                          Icons.payments_rounded,
                          color: Colors.black54,
                          size: size.width * 0.08,
                        ),
                        SizedBox(
                          width: size.width * 0.03,
                        ),
                        Text('Apple pay',
                            style: TextStyle(
                              fontSize: size.width * 0.045,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54,
                            )),
                      ],
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        Icon(
                          Icons.payment,
                          color: Colors.black54,
                          size: size.width * 0.08,
                        ),
                        SizedBox(
                          width: size.width * 0.03,
                        ),
                        Text('Stc pay',
                            style: TextStyle(
                              fontSize: size.width * 0.045,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54,
                            )),
                      ],
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        Icon(
                          Icons.money,
                          color: Colors.black54,
                          size: size.width * 0.08,
                        ),
                        SizedBox(
                          width: size.width * 0.03,
                        ),
                        Text(
                            'cash',
                            style: TextStyle(
                              fontSize: size.width * 0.045,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54,
                            )),
                      ],
                    ),
                  )
                ],
              ),
            )
          ]),
        )),
  );
}