import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:raselne/utilis/theme.dart';
import 'package:raselne/view_presentation/widget/orders/build_orders.dart';
import 'package:raselne/view_presentation/widget/text_utilis.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('الطلبات'),
          backgroundColor: mainColor,
          centerTitle: true,
          elevation: 0,
        ),
        backgroundColor: Colors.grey.shade200,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.03),
                      child: TextUtils(
                          fontSize: size.width * 0.05,
                          fontWeight: FontWeight.bold,
                          text: 'جميع الطلبات',
                          color: Colors.black54,
                          underLine: TextDecoration.none),
                    ),
                    ListView.separated(
                      shrinkWrap: true,
                      controller: ScrollController(),
                      scrollDirection: Axis.vertical,
                      itemCount: 20,
                      itemBuilder: (context, index) {
                        return buildCardOrders(size: size);
                      },
                      separatorBuilder: (context, index) =>
                          SizedBox(height: size.height * 0.02),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
