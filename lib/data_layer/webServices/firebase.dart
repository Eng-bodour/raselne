import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:raselne/data_layer/model/user_model.dart';

// to add users collection to app
class Firebase {
  static FirebaseAuth auth = FirebaseAuth.instance;
  static String uid = auth.currentUser!.uid.toString();
  static String? name;
  static Future<void> userSetUp(String dispalyName) async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    users.add({'dispayName': dispalyName, 'uid': uid});
    return;
  }

  static Future<String?> getNameuser() async {
    var users = FirebaseFirestore.instance
        .collection('users')
        .where('uid', isEqualTo: uid)
        .snapshots()
        .listen((event) {
      for (var element in event.docs) {
        // print(element.data()['dispayName']);
        // print('====================');
        return name = element.data()['dispayName'];
      }
    });
  }
}
