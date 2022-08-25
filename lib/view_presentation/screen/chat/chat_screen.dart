import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raselne/data_layer/model/messages_model.dart';

import 'package:raselne/data_layer/model/user_model.dart';
import 'package:raselne/utilis/theme.dart';

import '../../../logic/controller/auth_controller.dart';

class ChatScreen extends StatefulWidget {

  // ignore: use_key_in_widget_constructors
  ChatScreen();

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late UserModel user;

  _buildMessage(Message message, bool isMe, Size size) {
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
            message.time!,
            style: TextStyle(
              color: Colors.black,
              fontSize: size.width * 0.035,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: size.height * 0.005),
          Text(
            message.text!,
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
            onPressed: () {},
          ),
          Expanded(
            child: TextField(
              cursorColor: mainColor,
              textCapitalization: TextCapitalization.sentences,
              onChanged: (value) {},
              decoration: const InputDecoration.collapsed(
                hintText: 'Send a message...',
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            iconSize: 25.0,
            color: mainColor,
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  @override void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      user = Provider.of<AuthProvider_vm>(context, listen: false)
          .currentuser;
    });}
      @override
  Widget build(BuildContext context) {
        user = Provider.of<AuthProvider_vm>(context, listen: true)
            .currentuser;
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
                  child: ListView.builder(
                    //to reverse message
                    reverse: true,
                    padding: EdgeInsets.only(top: size.height * 0.02),
                    itemCount: messages.length,
                    itemBuilder: (BuildContext context, int index) {
                      final Message message = messages[index];
                      final bool isMe = message.sender?.uid == currentUser.uid;
                      return _buildMessage(message, isMe, size);
                    },
                  ),
                ),
              ),
            ),
            _buildMessageComposer(size: size),
          ],
        ),
      ),
    );
  }
}
