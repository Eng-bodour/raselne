
import 'package:http/http.dart' as http;
import 'package:firebase_messaging/firebase_messaging.dart';
class FCM {

  static const String server_token='AAAALMgGKuo:APA91bEUFshx1bT9urp-Zmsxrw04a8oL_xqF8cDS6nRO4kqgdYaGy51DNWn5eJhUOjs3lTOoC6JRWn15pW87TVN7nOvHAMTw2ePoV8J8TYuQLSS5z38o2fbrEIO34sKozJK-nUmi1boO';


  //BLHC6fhpHX_VBbufktusXDMRhLtLI764Ic_ZcCc9Lh2puYzPEvwOpvxDfBmHKtRQu38OU_hUoalT42PxzHc8JPg
  // String token = await messaging.getToken(
  // vapidKey: "BLHC6fhpHX_VBbufktusXDMRhLtLI764Ic_ZcCc9Lh2puYzPEvwOpvxDfBmHKtRQu38OU_hUoalT42PxzHc8JPg",
  // );
  Future<void> sendnotification(Map<String,dynamic> data,String title,String message,List<String> arratoken) async {
     FirebaseMessaging messaging = FirebaseMessaging.instance;
    try{
      String? token = await messaging.getToken(
      vapidKey: "BLHC6fhpHX_VBbufktusXDMRhLtLI764Ic_ZcCc9Lh2puYzPEvwOpvxDfBmHKtRQu38OU_hUoalT42PxzHc8JPg",
      );
       //https://fcm.googleapis.com/fcm/send
      //https://fcm.googleapis.com/v1/projects/myproject-b5ae1/messages:send
      var body={
        //'token': "token",
        // "to":"",
        'registration_ids' :arratoken,
        "direct_boot_ok" : true,
        "notification":{
        "title": title,
        "body":  message,
        // "image"=> "https://aya.epaysadaka.com/api/imagesApp/smart_icon1.jpg",//Optional
        'click_action':'FLUTTER_NOTIFICATION_CLICK',
        },
        'priority':'high',
        "data": data
        // {
        //
        //   // 'id':'1',
        //   // 'name':'aya',
        //   // 'Typenotify':
        // },
        //'to': FirebaseMessaging.instance.getToken()
      };
       http.Response response = await http.post(
        Uri.parse('https://fcm.googleapis.com/fcm/send'),
        body: body,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "key=$server_token"//"Bearer $"
        },
      );
    }
    catch(e) {

    }
    // "data":data,
    // "notification":{
    // "title":"FCM Message",
    // "body":"This is an FCM notification message!",
    // },

  }

  void getmessge(){
    FirebaseMessaging.onMessage.listen(
            (message) {
             print( message.notification!.title);
            print( message.notification!.body);
            print(  message.data['iduser']);
            print(  message.data['nameuser']);
            });
    FirebaseMessaging.onMessageOpenedApp.listen(
            (message) {
          print( message.notification!.title);
          print( message.notification!.body);
          print(  message.data['iduser']);
          print(  message.data['nameuser']);
        });
  }

}