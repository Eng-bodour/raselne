import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:raselne/data_layer/model/DetailOrder.dart';
import 'package:raselne/data_layer/model/store_model.dart';
import 'package:raselne/logic/controller/store/store_controller.dart';
import 'package:raselne/routes/routes.dart';
import 'package:raselne/utilis/theme.dart';
import 'package:raselne/view_presentation/screen/new_order_screen.dart';
import 'package:raselne/view_presentation/screen/orders_screen.dart';
import 'package:raselne/view_presentation/widget/text_utilis.dart';

import '../../../logic/controller/order_vm.dart';

class bottomsheet extends StatefulWidget {
  bottomsheet({required this.orderitem, Key? key}) : super(key: key);
  DetailOrder orderitem;
  @override
  State<bottomsheet> createState() => _Statebottomsheet();
}

class _Statebottomsheet extends State<bottomsheet> {
  int index = 0;
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      DetailOrder? ord = Provider.of<order_vm>(context, listen: false)
          .get_obj_detailorder(widget.orderitem);
      if (ord != null) {
        setState(() {
          widget.orderitem = ord;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
          height: size.height * 0.9,
          width: double.infinity,
          margin: EdgeInsets.symmetric(
            vertical: size.height * 0.01,
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.06,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextUtils(
                        fontSize: size.width * 0.05,
                        fontWeight: FontWeight.bold,
                        text: widget.orderitem.item.description,
                        //Provider.of<order_vm>(context,listen:true ).list_itemorder[index].item.description, //'تفاح أميركي أحمر سوبر',
                        color: Colors.black54,
                        underLine: TextDecoration.none),
                    IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(
                          Icons.close,
                          size: size.width * 0.08,
                          color: Colors.black54,
                        ))
                  ],
                ),
              ),
              widget.orderitem.image==''?
              CircleAvatar(
                backgroundColor: Colors.white,
                radius:  size.width * 0.08,
                child: Icon(
                  Icons.work,
                  color: Colors.lightBlue.withOpacity(0.9),
                  size: size.width * 0.06,
                ),
              ):
              // CircleAvatar(
              //    // radius: 30,
              //   child: ClipRRect(
              //      // borderRadius: BorderRadius.circular(5),
              //     child:
              //     CachedNetworkImage(
              //       width: 500,
              //       height: 500,
              //       fit: BoxFit.fill,
              //       imageUrl:  widget.orderitem.image.toString(),
              //       placeholder: (context, url) =>
              //       const CircularProgressIndicator(),
              //       errorWidget: (context, url, error) =>
              //       const Icon(Icons.error),
              //     ),
              //   ),
              // ),
              Container(
                height: size.height * 0.26,
                width: size.width,
                child: CachedNetworkImage(
                  // width: 500,
                  // height: 500,
                  fit: BoxFit.fill,
                  imageUrl:  widget.orderitem.image.toString(),
                  placeholder: (context, url) =>
                  const CircularProgressIndicator(),
                  errorWidget: (context, url, error) =>
                  const Icon(Icons.error),
                ) ,
                // decoration: const BoxDecoration(
                //
                //   image: DecorationImage(
                //       image: AssetImage("assets/services/sweet.png"),
                //       fit: BoxFit.cover),
                // ),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              Center(
                child:
                Padding(
                  padding: EdgeInsets.only(
                     // left: size.width * 0.27,
                     right: size.width * 0.27,

                      // vertical: size.height * 0.04
                  ),
                  child: Row(
                    children: [
                      // IconButton(
                      //     onPressed: () {},
                      //     icon: const Icon(Icons.add, color: Colors.black45)),
                      IconButton(
                          onPressed: () {
                            // String id= Provider.of<order_vm>(context,listen:false )
                            //     .list_itemorder[index].item.IdItemStore;
                            //
                            // Provider.of<order_vm>(context,listen:false ).add_quaintity(id);
                            setState(() {
                              widget.orderitem.quaintity++;
                              widget.orderitem.total_item = (widget
                                          .orderitem.quaintity *
                                      double.parse(widget.orderitem.item.price))
                                  .toString();
                            });
                          },
                          icon: Container(
                            child: const Icon(
                              Icons.add,
                              color: Colors.black45,
                            ),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(20)),
                          )),
                      SizedBox(
                        width: size.width * 0.05,
                      ),
                      Column(
                        children: [
                          TextUtils(
                              fontSize: size.width * 0.06,
                              fontWeight: FontWeight.bold,
                              //Provider.of<order_vm>(context,listen:true ).list_itemorder[index]
                              text: widget.orderitem.quaintity.toString(),
                              //Provider.of<order_vm>(context,listen: true).list_itemorder[index].quaintity.toString(),
                              color: Colors.blueAccent.shade100,
                              underLine: TextDecoration.none),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          TextUtils(
                              fontSize: size.width * 0.03,
                              fontWeight: FontWeight.bold,
                              text: widget.orderitem.total_item.toString(),
                              //Provider.of<order_vm>(context,listen: true).list_itemorder[index].total_item.toString(),  //'22.00 SAR',
                              color: Colors.black45,
                              underLine: TextDecoration.none),
                        ],
                      ),
                      SizedBox(
                        width: size.width * 0.05,
                      ),
                      // IconButton(
                      //     onPressed: () {},
                      //     icon: const Icon(Icons.minimize, color: Colors.black45)),
                      IconButton(
                          onPressed: () {
                            // String id= Provider.of<order_vm>(context,listen:false ).list_itemorder[index]
                            //     .item.IdItemStore;
                            // Provider.of<order_vm>(context,listen:false ).remove_quaintity(id);
                            setState(() {
                              if (widget.orderitem.quaintity - 1 >= 1) {
                                widget.orderitem.quaintity--;
                                widget.orderitem.total_item = (widget
                                            .orderitem.quaintity *
                                        double.parse(widget.orderitem.item.price))
                                    .toString();
                              }
                            });
                          },
                          icon: Container(
                            // margin: const EdgeInsets.only(bottom: 2),
                            child: const Icon(Icons.remove, color: Colors.red),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              shape: BoxShape.circle,
                            ),
                          )),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              Container(
                width: size.width * 0.9,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), color: mainColor),
                child: Center(
                  child: InkWell(
                    onTap: () {
                      // String id= Provider.of<order_vm>(context,listen:false ).list_itemorder[index]
                      //     .item.IdItemStore;
                      // print('id '+id);
                      Provider.of<StoreProvider_vm>(context, listen: false)
                          .item_to_order(widget.orderitem.item.IdItemStore);

                      Provider.of<order_vm>(context, listen: false)
                          .addto_order(widget.orderitem);

                      Navigator.pop(context);
                      // Get.toNamed(Routes.newOrderScreen);
                    },
                    child: TextUtils(
                      color: Colors.white,
                      text: 'إضافة',
                      fontSize: f18,
                      fontWeight: FontWeight.bold,
                      underLine: TextDecoration.none,
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
