import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:raselne/data_layer/model/user_model.dart';

class MessageText {
  final UserModel? sender;
  late  String  senderId;
  late  String? timeMessage; // Would usually be type DateTime or Firebase Timestamp in production apps
  late  String? textMessage;
   bool? isLiked;
   bool? unread;
  GeoPoint? location;
  String type_message;
  String? valueCost;
  String? nameSenderInvoice;

  MessageText({
    this.sender,
    required this.senderId,
    this.timeMessage,
    this.textMessage,
    this.isLiked,
    this.unread,
    this.location,
    this.nameSenderInvoice,
    required this.type_message,
  });

  factory MessageText.fromSnapshot(Map<String, dynamic> doc) {
    MessageText messageText= MessageText(
      senderId: doc['senderId'],
      timeMessage: doc['timeMessage'],
      location: doc['location']==null?null:doc['location'],
      // valueCost: doc['valueCost']==null?null:doc['valueCost'],
      textMessage: doc['textMessage'],
      type_message: doc['type_message'],
      // isLiked: doc['isLiked']==null?false: doc['isLiked'],
      // unread: doc['unread']==null?false: doc['unread'],
      nameSenderInvoice: doc['nameSenderInvoice']==null?'': doc['nameSenderInvoice'],

    );
    messageText.valueCost=doc['valueCost']==null?'0':doc['valueCost'];
    return messageText;
  }

  Map<String, dynamic> toSnapchot() =>
      {

        "senderId": senderId,
        "timeMessage": timeMessage,
        "textMessage": textMessage,
        "location":location,
        "type_message":type_message,
        "nameSenderInvoice":nameSenderInvoice,

      };

}
// YOU - current user
// final UserModel currentUser = UserModel(
//   uid: '0',
//   email: 'bodour@gmail.com',
//   name: 'bodour',
//   mobile: '0567487703', location: null, dateCreated: '',
// );
//
// final UserModel nour = UserModel(
//   uid: '1',
//   email: 'nour@gmail.com',
//   name: 'nour',
//   mobile: '0567487703', location: null, dateCreated: '',
// );
// USERS
// final UserModel aya = UserModel(
//   id: 1,
//   email: 'aya@gmail.com',
//   name: 'aya',
//   mobile: 0567487703,
// );

// EXAMPLE MESSAGES IN CHAT SCREEN
