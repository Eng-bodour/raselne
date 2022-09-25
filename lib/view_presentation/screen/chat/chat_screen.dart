import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:raselne/data_layer/model/messages_model.dart';
import 'package:raselne/data_layer/model/orderModel.dart';

import 'package:raselne/data_layer/model/user_model.dart';
import 'package:raselne/utilis/theme.dart';
import 'package:raselne/view_presentation/screen_driver/driver_rating.dart';

import '../../../logic/controller/auth_controller.dart';
import '../../../logic/controller/order_vm.dart';
import '../../widget/text_utilis.dart';
import '../../widget/widget_location_map.dart';
import '../invoiceImage.dart';
import 'invoicechat.dart';

class ChatScreen extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  ChatScreen({required this.orderModel});
  OrderModel orderModel;
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController messagecontrol=TextEditingController();
  String textmessage='';
  late UserModel user;

  _buildMessage(MessageText message, bool isMe, Size size) {
    final Container msg = Container(
      margin: isMe
          ? EdgeInsets.only(
        top: size.height * 0.01,
        bottom: size.height * 0.01,
        left: size.width * 0.3,
        right: size.width * 0.03,
      )
          : EdgeInsets.only(
        top: size.height * 0.01,
        left: size.width * 0.03,
        bottom: size.height * 0.01,
      ),
      padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.06, vertical: size.height * 0.03),
      width: size.width * 0.75,
      decoration: BoxDecoration(
        color: isMe ? greyColor.withOpacity(0.1) : mainColor.withOpacity(0.3),
        borderRadius: isMe
            ? BorderRadius.only(
          topLeft: Radius.circular(size.width * 0.1),
          topRight: Radius.circular(size.width * 0.02),
          bottomLeft: Radius.circular(size.width * 0.02),
          bottomRight: Radius.circular(size.width * 0.1),
        )
            : BorderRadius.only(
          topRight: Radius.circular(size.width * 0.1),
          topLeft: Radius.circular(size.width * 0.02),
          bottomRight: Radius.circular(size.width * 0.02),
          bottomLeft: Radius.circular(size.width * 0.1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            message.timeMessage!,
            style: TextStyle(
              color: Colors.black,
              fontSize: size.width * 0.035,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: size.height * 0.005),
          Text(
            message.textMessage!,
            style: TextStyle(
              color: Colors.black,
              fontSize: size.width * 0.035,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
    if (isMe) {
      return msg;
    }
    return Row(
      children: <Widget>[
        msg,
        // IconButton(
        //   icon: message.isLiked!
        //       ? const Icon(Icons.favorite)
        //       : const Icon(Icons.favorite_border),
        //   iconSize: 30.0,
        //   color: message.isLiked!
        //       ? Theme.of(context).primaryColor
        //       : Colors.blueGrey,
        //   onPressed: () {},
        // )
      ],
    );
  }

  _buildMessageComposer({required Size size}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
      height: size.height * 0.1,
      color: Colors.white,
      child: Row(
        children: <Widget>[
          IconButton(
            icon: const Icon(Icons.photo),
            iconSize: 25.0,
            color: mainColor,
            onPressed: () {

            },
          ),
          Expanded(
            child: TextField(
              cursorColor: mainColor,
              controller: messagecontrol,
              textCapitalization: TextCapitalization.sentences,
              onChanged: (value) {textmessage=value;},
              decoration: const InputDecoration.collapsed(
                hintText: 'Send a message...',
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            iconSize: 25.0,
            color: mainColor,
            onPressed: ()
            async {
              messagecontrol.text='';
           await   Provider.of<order_vm>(context,listen: false)
                  .sendMessage(
                  MessageText(
                  senderId: user.uid.toString(),
                  textMessage:textmessage,
                  timeMessage: DateTime.now().toString(),
                  type_message: 'text'
                  ), widget.orderModel.id_order);
           setState(() {
             textmessage='';
             messagecontrol.text='';
           });
           },
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      user = Provider.of<AuthProvider_vm>(context, listen: false)
          .currentuser;
      Provider.of<order_vm>(context, listen: false).order=widget.orderModel;
    });
  }

  @override
  Widget build(BuildContext context) {
    user = Provider.of<AuthProvider_vm>(context, listen: true).currentuser;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(
        backgroundColor: mainColor,
        centerTitle: true,
        title: Text(
          user.name,
          style: TextStyle(
              fontSize: size.width * 0.06,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.more_horiz),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: () {},
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: ModalProgressHUD(
          inAsyncCall: Provider.of<order_vm>(context,listen: true).isloading,
          child: Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    ),
                    child:
                          StreamBuilder(
                            stream: Provider.of<order_vm>(context,listen: false)
                                .getchat(widget.orderModel.id_order),
                            builder: (BuildContext context,
                                AsyncSnapshot<List<MessageText>> snapshot)
                            {
                              if(snapshot.hasError) {
                                return Text('something went wrong' +
                                    snapshot.error
                                    .toString());
                              }
                              if(!snapshot.hasData){
                                return Text("Loading");
                              }
                              return
                               Expanded(
                                 child: ListView.builder(
                            //to reverse message
                            //   reverse: true,
                              padding: EdgeInsets.only(top: size.height * 0.02),
                              itemCount:snapshot.data!.length,
                              itemBuilder: (BuildContext context, int index) {
                                  // final MessageText message = messages[index];
                                  bool isMe = snapshot.data![index].senderId ==user.uid;
                                  return
                                    snapshot.data![index].type_message=='text'?
                                    _buildMessage( snapshot.data![index], isMe, size):
                                    snapshot.data![index].type_message=='map'?
                                    mapLocationMessage(
                                    message: snapshot.data![index],
                                    size: size,):
                                    snapshot.data![index].type_message=='image'?
                                    Container(
                                       margin:  EdgeInsets.only(
                                         top: size.height * 0.01,
                                         left: size.width * 0.03,
                                         bottom: size.height * 0.01,
                                       ),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: size.width * 0.06, vertical: size.height * 0.03),
                                        width: size.width * 0.75,
                                        decoration: BoxDecoration(
                                          color: isMe ? greyColor.withOpacity(0.1) : mainColor.withOpacity(0.3),
                                          borderRadius: isMe
                                              ? BorderRadius.only(
                                            topLeft: Radius.circular(size.width * 0.1),
                                            topRight: Radius.circular(size.width * 0.02),
                                            bottomLeft: Radius.circular(size.width * 0.02),
                                            bottomRight: Radius.circular(size.width * 0.1),
                                          )
                                              : BorderRadius.only(
                                            topRight: Radius.circular(size.width * 0.1),
                                            topLeft: Radius.circular(size.width * 0.02),
                                            bottomRight: Radius.circular(size.width * 0.02),
                                            bottomLeft: Radius.circular(size.width * 0.1),
                                          ),
                                        ),
                                        child: CachedNetworkImage(
                                          imageUrl:  snapshot.data![index].textMessage.toString(),
                                          placeholder: (context, url) => CircularProgressIndicator(),
                                          errorWidget: (context, url, error) => Icon(Icons.error),
                                        ),
                                        // Image.network(
                                        //     snapshot.data![index].textMessage.toString(),
                                        //   width: 30,
                                        //   height: 35,
                                        // )
                                    ):
                                    invoice_chat(
                                      size:size ,
                                      messageText:   snapshot.data![index],
                                    );//invoice
                              },
                            ),
                               );
                            },
                          ),

                  ),
                ),
              ),
              user.type=='captain' && widget.orderModel.state!='done rate'?
              InkWell(
                onTap: () {
                      // Navigator.push(context,
                      //     MaterialPageRoute(
                      //         builder: (context)=> InvoiceImage(
                      //           orderModel: widget.orderModel,),
                      //         fullscreenDialog: true)
                      // );
                  // widget.orderModel.isstart

               switch( Provider.of<order_vm>(context, listen: false)
                   .order.state) {
                 case 'approve':
                   Navigator.push(context,
                       MaterialPageRoute(
                           builder: (context)=> InvoiceImage(
                             orderModel:  Provider.of<order_vm>(context, listen: false).order,),
                           fullscreenDialog: true)
                   );
                   break;
                 case 'done invoice':
                   // return 'استلمت الطلب';
                   Provider.of<order_vm>(context,listen: false)
                   .update_state( Provider.of<order_vm>(context, listen: false).order.id_order,
                       'done recive');
                   break;
                 case 'done recive':
                   // return 'وصلت لموقع العميل';
                   Provider.of<order_vm>(context,listen: false)
                       .update_state( Provider.of<order_vm>(context, listen: false).order.id_order,
                       'done arrive');
                   break;
                 case 'done arrive':
                   // return 'تم التسليم';
                   Provider.of<order_vm>(context,listen: false)
                       .update_state( Provider.of<order_vm>(context, listen: false).order.id_order,
                       'done');
                   break;
                   case 'done':
                   // return 'تم التسليم';
                            showModalBottomSheet<dynamic>(
                              backgroundColor: Colors.grey.shade200,
                              //  backgroundColor: Colors.transparent,
                              elevation: 0,
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  )),
                              context: context,
                              isScrollControlled: true,
                              builder: ((context) =>
                                  DriverRating(
                                    typeUser:  user.type ,
                                    iduser:
                                    user.type=='captain'?
                                    widget.orderModel.from_user.toString():
                                    widget.orderModel.captain_user.toString(),
                                  )),
                              // builder: ((context) => bottomSheetWithChoiseMealAdditions(context)),
                            );
                   break;
               }
               setState(() {
                 Provider.of<order_vm>(context,listen: false).order;
               });
                },
                child: Container(
                  width: size.width * 1,
                  height: size.height * 0.1,
                  decoration: const BoxDecoration(color: greyColor),
                  child: Center(
                      child: TextUtils(
                          fontSize: size.width * 0.05,
                          fontWeight: FontWeight.bold,
                          text: //'اصدار فاتورة',
                          switch_button(),//
                          // widget.orderModel.isstart? 'اصدار فاتورة':
                          // widget.orderModel.isdone_recive?'استلمت الطلب':'',
                          color: Colors.white,
                          underLine: TextDecoration.none)),
                ),
              ):Container(),
              // Provider.of<order_vm>(context,listen: true)
              //     .order.state=='done'?
              //    RaisedButton(
              //      child: Text('قيم'),
              //        onPressed: (){
              //          showModalBottomSheet<dynamic>(
              //            backgroundColor: Colors.grey.shade200,
              //            //  backgroundColor: Colors.transparent,
              //            elevation: 0,
              //            shape: const RoundedRectangleBorder(
              //                borderRadius: BorderRadius.only(
              //                  topLeft: Radius.circular(20),
              //                  topRight: Radius.circular(20),
              //                )),
              //            context: context,
              //            isScrollControlled: true,
              //            builder: ((context) => DriverRating()),
              //            // builder: ((context) => bottomSheetWithChoiseMealAdditions(context)),
              //          );
              //    }) :Container(),
              widget.orderModel.state!='done rate' ||
              widget.orderModel.state!='done'?
              _buildMessageComposer(size: size):
              Container(),//done order... close order
            ],
          ),
        ),
      ),
    );
  }

  String switch_button() {

    switch( Provider.of<order_vm>(context, listen: true).order.state) {
      case 'approve':
        return 'اصدار فاتورة';

      case 'done invoice':
        return 'استلمت الطلب';

      case 'done recive':
        return 'وصلت لموقع العميل';

      case 'done arrive':
        return 'تم التسليم';
        case 'done':
        return 'قيم ';
    }
    return '';
  }
}