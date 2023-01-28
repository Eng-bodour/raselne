import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:raselne/data_layer/model/orderModel.dart';
import 'package:raselne/logic/controller/auth_controller.dart';
import 'package:raselne/utilis/theme.dart';
import 'package:raselne/view_presentation/screen/chat/chat_screen.dart';
import 'package:raselne/view_presentation/widget/text_utilis.dart';

import '../../../constatnt.dart';
import '../../../data_layer/model/store_model.dart';
import '../../../logic/controller/store/store_controller.dart';
import '../../../utilis/global_method.dart';
import '../../screen_driver/waiting_approve_order.dart';
import '../mypage_driver/show_offers.dart';

class buildCardOrders extends StatefulWidget {
  buildCardOrders({required this.orderModel, required this.size, Key? key})
      : super(key: key);
  OrderModel orderModel;
  Size size;

  @override
  State<buildCardOrders> createState() => _buildCardOrdersState();
}

class _buildCardOrdersState extends State<buildCardOrders> {
  // late StoreModel? storeModel;
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((_) async {

    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<StoreProvider_vm>(context,listen: true)
        .getstoremodel(widget.orderModel.id_store);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: widget.size.width * 0.03,
        vertical: widget.size.width * 0.01,
      ),
      child: Card(
        child: SizedBox(
          height: widget.size.height * 0.35,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: widget.size.width * 0.04,
                    vertical: widget.size.height * 0.01),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          decoration:
                    widget.orderModel.isopen == true?
                    const BoxDecoration(

                        color: Colors.green)
                        : const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.red),

                          child: Icon(
                            widget.orderModel.isopen == true?Icons.check:  Icons.close,
                            color: Colors.white,
                            size: widget.size.width * 0.04,
                          ),
                        ),
                        SizedBox(
                          width: widget.size.width * 0.01,
                        ),
                        TextUtils(
                            fontSize: widget.size.width * 0.04,
                            fontWeight: FontWeight.normal,
                            text: getstate_order(widget.orderModel.state), //'ملغى',
                            color:widget.orderModel.isopen == true?
                            Colors.green: Colors.red,
                            underLine: TextDecoration.none)
                      ],
                    ),
                    TextUtils(
                        fontSize: widget.size.width * 0.04,
                        fontWeight: FontWeight.normal,
                        text: widget.orderModel.DateTimeorder.toString(), // 'سنة',
                        color: Colors.black54,
                        underLine: TextDecoration.none)
                  ],
                ),
              ),
              const Divider(
                thickness: 1,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Row(
                  children: [
                    TextUtils(
                        fontSize: widget.size.width * 0.04,
                        fontWeight: FontWeight.normal,
                        text: 'رقم الطلب : ', // 'سنة',
                        color: Colors.black54,
                        underLine: TextDecoration.none),
                    TextUtils(
                        fontSize: widget.size.width * 0.04,
                        fontWeight: FontWeight.normal,
                        text: widget.orderModel.id_order
                            .substring(0, 8).toString(), // 'سنة',
                        color: Colors.black54,
                        underLine: TextDecoration.none)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Provider.of<StoreProvider_vm>(context,listen: true)
                        .currentStore!=null?

                    Provider.of<StoreProvider_vm>(context,listen: true)
                    .currentStore!.imageStore==''?
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: widget.size.width * 0.08,
                      child: Icon(
                        Icons.person,
                        color: Colors.lightBlue.withOpacity(0.9),
                        size: widget.size.width * 0.06,
                      ),
                    ):
                    CircleAvatar(
                    radius: 23,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: CachedNetworkImage(
                        width: 100,
                        height: 100,
                        fit: BoxFit.fill,
                        imageUrl:  Provider.of<StoreProvider_vm>(context,listen: true)
                            .currentStore!.imageStore.toString(),
                        placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                      ),
                    ),
                  ): CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: widget.size.width * 0.08,
                      child: Icon(
                        Icons.person,
                        color: Colors.lightBlue.withOpacity(0.9),
                        size: widget.size.width * 0.06,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextUtils(
                            fontSize: widget.size.width * 0.04,
                            fontWeight: FontWeight.bold,
                            text: widget.orderModel
                                .titleStore==''?
                             private_order:
                            Provider.of<StoreProvider_vm>(context,listen: true)
                                .currentStore!.nameStore,
                             // widget.orderModel.titleStore,
                            //'اسم المطعم', //'${Firebase.name}',
                            color: Colors.black54,
                            underLine: TextDecoration.none),
                        Provider.of<StoreProvider_vm>(context,listen: true)
                            .currentStore!=null?
                      Row(
                          children: [
                            RatingBarIndicator(
                              // rating: rate,
                              //to do
                              rating: //2.5,
                              Provider.of<StoreProvider_vm>(context,listen: true)
                                  .currentStore!.rataing,
                              itemBuilder: (context, index) => Icon(
                                Icons.star,
                                color: Colors.orange.withOpacity(0.4),
                              ),
                              itemCount: 5,
                              itemPadding: const EdgeInsets.only(left: 4),
                              itemSize: 20.0,
                              direction: Axis.horizontal,
                            ),
                            TextUtils(
                                fontSize: widget.size.width * 0.02,
                                fontWeight: FontWeight.normal,
                                text: Provider.of<StoreProvider_vm>(context,listen: true)
                                    .currentStore!.rataing.toString(),
                                color: Colors.black54,
                                underLine: TextDecoration.none)
                          ],
                        ):Container(),
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: widget.size.width * 0.05),
                  child: TextUtils(
                      fontSize: widget.size.width * 0.04,
                      fontWeight: FontWeight.normal,
                      text: //'وصف الطلب',
                          widget.orderModel.content_order, //
                      color: Colors.black54,
                      underLine: TextDecoration.none),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: widget.size.width * 0.05),
                    child: Row(
                      children: [
                        TextUtils(
                            fontSize: widget.size.width * 0.04,
                            fontWeight: FontWeight.normal,
                            text: 'المجموع',
                            color: Colors.black54,
                            underLine: TextDecoration.none),
                        SizedBox(width: widget.size.width * 0.02),
                        TextUtils(
                            fontSize: widget.size.width * 0.04,
                            fontWeight: FontWeight.normal,
                            text: '${widget.orderModel.total.toString()} رس',
                            color: mainColor,
                            underLine: TextDecoration.none),
                      ],
                    ),
                  ),
                  widget.orderModel.distance_recive_deilvery==''?
                  Container():
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: widget.size.width * 0.05),
                    child: TextUtils(
                        fontSize: widget.size.width * 0.04,
                        fontWeight: FontWeight.normal,
                        text: 'كم ${widget.orderModel.distance_recive_deilvery}',
                        color: Colors.black54,
                        underLine: TextDecoration.none),
                  ),
                ],
              ),
              ElevatedButton(
                  onPressed: () {
                    // if(orderModel.isopen)

                    switch (widget.orderModel.state) {
                      case 'open':
                        // Provider.of<AuthProvider_vm>(context,listen: false)
                        // .currentuser.type=='user'?
                        Navigator.of(context).push(
                            MaterialPageRoute(
                            builder: (context) =>
                                ShowOffers(orderModel: widget.orderModel)));
                        // Navigator.of(context).push(
                        //     MaterialPageRoute(
                        //         builder: (context)=>
                        //             waiting_aprrove_order(orderModel: orderModel)
                        //     ));
                        break;
                      case 'approve':
                        // return 'مفتوح';
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                ChatScreen(orderModel: widget.orderModel)));
                        break;
                      case 'done invoice':
                        // return 'مفتوح';
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                ChatScreen(orderModel: widget.orderModel)));
                        break;
                      case 'done recive':
                        // return 'مفتوح';
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                ChatScreen(orderModel: widget.orderModel)));
                        break;
                      case 'done arrive':
                        // return 'مفتوح';
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                ChatScreen(orderModel: widget.orderModel)));
                        break;
                      case 'done':
                        // return 'مفتوح';
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                ChatScreen(orderModel: widget.orderModel)));
                        break;
                    }
                  },
                  style: ButtonStyle(
                      elevation: MaterialStateProperty.all(0),
                      backgroundColor: MaterialStateProperty.all(mainColor)),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: widget.size.width * 0.25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        widget.orderModel.isopen == true
                            ? Text('متابعة',
                                style: TextStyle(
                                  fontSize: widget.size.width * 0.045,
                                ))
                            : Text('إعادة الطلب',
                                style: TextStyle(
                                  fontSize: widget.size.width * 0.045,
                                )),
                        // SizedBox(
                        //   width: size.width * 0.02,
                        // ),
                        // orderModel.isopen == true
                        //     ? const Icon(
                        //         Icons.arrow_back_rounded,
                        //       )
                        //     : const Icon(
                        //         Icons.refresh_outlined,
                        //       ),
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
