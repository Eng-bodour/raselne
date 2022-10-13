


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:raselne/data_layer/model/notifyModel.dart';

import 'notify_repo.dart';

class notify_firebase extends NotifyRepository{
  @override
  Future<void> addNotify(Map<String,dynamic> body) {
    // TODO: implement addNotify
    FirebaseFirestore.instance.collection('notification')
        .add(body);

    throw UnimplementedError();
  }

  @override
  Future<List<NotificationModel>> getnotify(String uid) async{
    // TODO: implement getnotify

   return await FirebaseFirestore.instance.collection('notification')
    .where('toUser',isEqualTo: uid).get()
        .then((value) => value.docs.map((e) =>
    NotificationModel.fromJson(
        e.data())).toList());
   // throw UnimplementedError();
  }

  @override
  Future<List<NotificationModel>> setReadNotify(String uid) async{
    // TODO: implement setReadNotify
   await FirebaseFirestore.instance.collection('notification')
        .doc(uid).update({'isread':true});

    throw UnimplementedError();
  }


}