import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

// to add users collection to app
class FirebaseServices {
  static FirebaseAuth auth = FirebaseAuth.instance;
  static String uid ="YL4gwVLYe0dyr7y4CuiEcJIkt7A3";// auth.currentUser!.uid.toString();
  static String? name;

  final _firestore=FirebaseFirestore.instance;
  late final String namePath;
  late CollectionReference ref;
  FirebaseServices(this.namePath){
    ref= _firestore.collection(namePath);
  }

   Future<void> userSetUp(String dispalyName) async {
    //CollectionReference users = _firestore.collection('users');
    ref.add({'dispayName': dispalyName, 'uid': uid});

    return;
  }
  Future<DocumentReference> addtofirestore(Map<String,dynamic> data)async{
   return await ref.add(data);
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

  Future<QuerySnapshot> getQuerySnapshotFuture()=> ref.get();
  Stream<QuerySnapshot> getQuerySnapshotStream()=>ref.snapshots();
  Future<DocumentSnapshot> getDocuments(path)=>ref.doc(path).get();
  Stream<DocumentSnapshot> getStreamDocuments(path)=>ref.doc(path).snapshots();
  Future<QuerySnapshot> searchDocuments(searchKey,key)=>ref.orderBy(key)
      .startAt([searchKey])
      .endAt([searchKey + '\uf8ff']).get();

}

