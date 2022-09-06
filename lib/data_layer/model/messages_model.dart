import 'package:raselne/data_layer/model/user_model.dart';

class MessageText {
  final UserModel? sender;
  final String senderId;
  late String? timeMessage; // Would usually be type DateTime or Firebase Timestamp in production apps
  final String? textMessage;
  final bool? isLiked;
  final bool? unread;

  MessageText({
    this.sender,
    required this.senderId,
    this.timeMessage,
    this.textMessage,
    this.isLiked,
    this.unread,
  });

  factory MessageText.fromSnapshot(Map<String, dynamic> doc) {
    return MessageText(
      senderId: doc['senderId'],
      timeMessage: doc['timeMessage'],
      textMessage: doc['textMessage'],
      isLiked: doc['isLiked']==null?false: doc['isLiked'],
      unread: doc['unread']==null?false: doc['unread'],
    );
  }

  Map<String, dynamic> toSnapchot() =>
      {
        "senderId": senderId,
        "timeMessage": timeMessage,
        "textMessage": textMessage,


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
