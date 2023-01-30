import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:raselne/view_presentation/screen_driver/waiting_approve_order.dart';

import '../../constatnt.dart';
import '../../data_layer/model/orderModel.dart';
import '../../logic/controller/store/store_controller.dart';
import '../../utilis/theme.dart';
import '../screen/chat/chat_screen.dart';
import '../widget/text_utilis.dart';

class buildMyDelevery extends StatefulWidget {
   buildMyDelevery({required this.indexStore, required this.orderModel, required this.size,Key? key}) : super(key: key);
  OrderModel orderModel;
  Size size;
  int indexStore;
   late DateTime  datanext;
   late DateTime  datanext2;
  @override
  _buildMyDeleveryState createState() => _buildMyDeleveryState();
}

class _buildMyDeleveryState extends State<buildMyDelevery> {
  @override
  Widget build(BuildContext context) {

    // Provider.of<StoreProvider_vm>(context,listen: true)
    //   .getstoremodel(widget.orderModel.id_store);
    if(widget.orderModel.startorder !=null && widget.orderModel.endorder !=null)
    {
      widget.datanext=
          DateTime(
            widget.orderModel.startorder!.year,
            widget.orderModel.startorder!.month,
            widget.orderModel.startorder!.day,
            widget.orderModel.startorder!.hour,
            widget.orderModel.startorder!.minute,
            widget.orderModel.startorder!.second,
          ) ;
      widget.datanext2=DateTime(
        widget.orderModel.endorder!.year,
        widget.orderModel.endorder!.month,
        widget.orderModel.endorder!.day,
        widget.orderModel.endorder!.hour,
        widget.orderModel.endorder!.minute,
        widget.orderModel.endorder!.second,
      ) ;
      //
      // timestamp1 = strtotime($date1);
      // timestamp2 = strtotime($date2);
      // hour = abs($timestamp2 - $timestamp1)/(60*60);
      // int peroidtime= int.parse(peroid.value_config);
      // datanext=Jiffy().diff(input)//.add(days: peroidtime).dateTime;

    }

    // print(datanext.toString());
    // $timestamp1 = strtotime($date1);
    // $timestamp2 = strtotime($date2);
    // $hour = abs($timestamp2 - $timestamp1)/(60*60);
    // $hour=Round($hour);

    return InkWell(
      onTap: () {
        //
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal:    widget.size.width * 0.03,
          // vertical: size.height * 0.01,
        ),
        child: Card(
          child: SizedBox(
            // height: size.height * 0.25,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal:    widget.size.width * 0.02,
                  vertical:    widget.size.height * 0.01
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          widget.indexStore!=-1 ?
                          Provider.of<StoreProvider_vm>(context,listen: true)
                              .liststore[widget.indexStore].imageStore!=''?
                          //orderModel.i.imageuser !=''?
                          CircleAvatar(
                            radius: widget.size.width * 0.06,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: CachedNetworkImage(
                                width: 150,
                                height: 150,
                                fit: BoxFit.fill,
                                imageUrl:  Provider.of<StoreProvider_vm>(context,listen: true)
                                    .liststore[widget.indexStore].imageStore.toString(),
                                placeholder: (context, url) =>
                                const CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                              ),
                            ),
                          )
                              :
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius:    widget.size.width * 0.08,
                            child: Icon(
                              Icons.person,
                              color: Colors.lightBlue.withOpacity(0.9),
                              size:    widget.size.width * 0.15,
                            ),
                          ):
                          CircleAvatar(
                             backgroundColor: mainColor,
                            radius:    widget.size.width * 0.05,
                            child: Icon(
                              Icons.person,
                              // color: Colors.lightBlue.withOpacity(0.9),
                              size:    widget.size.width * 0.06,
                            ),
                          ),
                          SizedBox(
                            width:    widget.size.width * 0.03,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextUtils(
                                  fontSize:    widget.size.width * 0.04,
                                  fontWeight: FontWeight.bold,
                                  text:   widget.orderModel.titleStore.isEmpty?
                                  private_order:   widget.orderModel.titleStore,
                                  // 'صيدلية مستشفى الحبيب', //'${Firebase.name}',
                                  color: Colors.black54,
                                  underLine: TextDecoration.none),
                              TextUtils(
                                  fontSize:    widget.size.width * 0.03,
                                  fontWeight: FontWeight.bold,
                                  text:   widget.orderModel.content_order,
                                  // 'وصفة من الصيدلية', //'${Firebase.name}',
                                  color: Colors.black38,
                                  underLine: TextDecoration.none),
                            ],
                          ),
                        ],
                      ),
                      TextUtils(
                          fontSize:    widget.size.width * 0.04,
                          fontWeight: FontWeight.normal,
                          text:    widget.orderModel.id_order.substring(0,8),//'#123456777',
                          color: Colors.black54,
                          underLine: TextDecoration.none)
                    ],
                  ),
                  SizedBox(height:    widget.size.height * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.access_time_rounded,
                            color: Colors.black38,
                            size:    widget.size.width * 0.04,
                          ),
                          SizedBox(width:    widget.size.width * 0.01),
                          widget. orderModel.isopen==true?
                          TextUtils(
                              fontSize:    widget.size.width * 0.035,
                              fontWeight: FontWeight.bold,
                              text: ' جاري التوصيل ...', //'${Firebase.name}',
                              color: Colors.black38,
                              underLine: TextDecoration.none):
                          TextUtils(
                              fontSize:    widget.size.width * 0.035,
                              fontWeight: FontWeight.bold,
                              text:

                              //' تم التوصيل  ${  (Jiffy(datanext2).diff(datanext).hours.inHours/60).round()} ساعة  ', //'${Firebase.name}',
                              ' تم التوصيل   ${ ((
                                  widget.datanext2
                                      .difference(   widget.datanext)
                                      .inMinutes/60).hours.toString()
                                  .substring(0,4))} ساعة  ', //'${Firebase.name}',
                              color: Colors.black38,
                              underLine: TextDecoration.none),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.price_change,
                            color: Colors.black38,
                            size:    widget.size.width * 0.04,
                          ),
                          SizedBox(width:   widget. size.width * 0.01),
                          TextUtils(
                              fontSize:   widget. size.width * 0.035,
                              fontWeight: FontWeight.bold,
                              text:    widget.orderModel.price_deilvery_captain,
                              // 'سعر التوصيل 35.75 رس', //'${Firebase.name}',
                              color: Colors.black38,
                              underLine: TextDecoration.none),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height:   widget. size.height * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          switch (   widget.orderModel.state) {
                            case 'open':
                            // Provider.of<AuthProvider_vm>(context,listen: false)
                            // .currentuser.type=='user'?
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context)=>
                                          waiting_aprrove_order(orderModel:    widget.orderModel)
                                  ));

                              break;
                            case 'approve':
                            // return 'مفتوح';
                              Get.to(ChatScreen(orderModel:    widget.orderModel));

                              break;
                            case 'done invoice':
                            // return 'مفتوح';
                              Get.to(ChatScreen(orderModel:    widget.orderModel));

                              break;
                            case 'done recive':
                            // return 'مفتوح';
                              Get.to(ChatScreen(orderModel:    widget.orderModel));

                              break;
                            case 'done arrive':
                            // return 'مفتوح';
                              Get.to(ChatScreen(orderModel:    widget.orderModel));

                              break;
                            case 'done':
                              Get.to(ChatScreen(orderModel:    widget.orderModel));
                              // return 'مفتوح';
                              //   Navigator.of(context).push(
                              //       MaterialPageRoute(
                              //           builder: (context)=>
                              //               ChatScreen(orderModel: orderModel)
                              //       )) ;
                              break;
                          // case 'done rate':
                          // Get.to(ChatScreen(orderModel: orderModel));
                          // break;

                          }
                        },
                        child: Container(
                          width:    widget.size.width * 0.8,
                          height:    widget.size.height * 0.05,
                          decoration: BoxDecoration(
                              color:
                              widget.orderModel.isopen==true?
                              mainColor:mainColor,
                              borderRadius:
                              BorderRadius.circular(   widget.size.width * 0.05)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child:
                                widget.orderModel.isopen==true?
                                TextUtils(
                                  color: Colors.white,
                                  text: 'متابعة',
                                  fontSize:    widget.size.width * 0.04,
                                  fontWeight: FontWeight.bold,
                                  underLine: TextDecoration.none,
                                ):TextUtils(
                                  color: Colors.white,
                                  text: 'تم التوصيل',
                                  fontSize:    widget.size.width * 0.04,
                                  fontWeight: FontWeight.bold,
                                  underLine: TextDecoration.none,
                                ),
                              ),
                              SizedBox(width: 10),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Colors.white,
                                size:   widget. size.width * 0.03,
                              )
                            ],
                          ),
                        ),
                      ),

                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
