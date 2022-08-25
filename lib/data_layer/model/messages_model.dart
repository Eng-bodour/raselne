import 'package:raselne/data_layer/model/user_model.dart';

class Message {
  final UserModel? sender;
  final String?
      time; // Would usually be type DateTime or Firebase Timestamp in production apps
  final String? text;
  final bool? isLiked;
  final bool? unread;

  Message({
    this.sender,
    this.time,
    this.text,
    this.isLiked,
    this.unread,
  });
}

// YOU - current user
final UserModel currentUser = UserModel(
  uid: '0',
  email: 'bodour@gmail.com',
  name: 'bodour',
  mobile: '0567487703', location: null,
);

final UserModel nour = UserModel(
  uid: '1',
  email: 'nour@gmail.com',
  name: 'nour',
  mobile: '0567487703', location: null,
);
// USERS
// final UserModel aya = UserModel(
//   id: 1,
//   email: 'aya@gmail.com',
//   name: 'aya',
//   mobile: 0567487703,
// );

// EXAMPLE MESSAGES IN CHAT SCREEN
List<Message> messages = [
  Message(
    sender: currentUser,
    time: '6:30 PM',
    text: 'thanks',
    unread: true,
  ),
  Message(
    sender: nour,
    time: '5:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: true,
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '4:30 PM',
    text: 'Just walked my doge. She was super duper cute. The best pupper!!',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: nour,
    time: '3:45 PM',
    text: 'How\'s the doggo?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: nour,
    time: '3:15 PM',
    text: 'All the food',
    isLiked: true,
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '2:30 PM',
    text: 'Nice! What kind of food did you eat?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: nour,
    time: '2:00 PM',
    text: 'I ate so much food today.',
    isLiked: false,
    unread: true,
  ),
];
