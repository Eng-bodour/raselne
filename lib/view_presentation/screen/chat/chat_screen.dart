import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raselne/data_layer/model/messages_model.dart';
import 'package:raselne/data_layer/model/orderModel.dart';

import 'package:raselne/data_layer/model/user_model.dart';
import 'package:raselne/utilis/theme.dart';

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
                                      child: Image.network(
                                          snapshot.data![index].textMessage.toString())):
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
            user.type=='captain'?
            InkWell(
              onTap: () {
                // widget.orderModel.isstart
              Navigator.push(context,
                  MaterialPageRoute(
                      builder: (context)=> InvoiceImage(
                        orderModel: widget.orderModel,),
                      fullscreenDialog: true)
              );
              },
              child: Container(
                width: size.width * 1,
                height: size.height * 0.1,
                decoration: const BoxDecoration(color: greyColor),
                child: Center(
                    child: TextUtils(
                        fontSize: size.width * 0.05,
                        fontWeight: FontWeight.bold,
                        text: 'اصدار فاتورة',
                        // widget.orderModel.isstart? 'اصدار فاتورة':
                        // widget.orderModel.isdone_recive?'استلمت الطلب':'',
                        color: Colors.white,
                        underLine: TextDecoration.none)),
              ),
            ):Container(),
            _buildMessageComposer(size: size),
          ],
        ),
      ),
    );
  }
}