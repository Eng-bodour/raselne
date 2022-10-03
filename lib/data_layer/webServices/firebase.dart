import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:raselne/data_layer/model/user_model.dart';

import '../../services/location_services.dart';
import 'package:intl/intl.dart';
// to add users collection to app
class FirebaseServices {
  static FirebaseAuth auth = FirebaseAuth.instance;
  static String uid = auth.currentUser!.uid.toString();
  static String? name;

  final _firestore=FirebaseFirestore.instance;
  late final String namePath;
  late CollectionReference ref;
  FirebaseServices(this.namePath){
    ref= _firestore.collection(namePath);
  }

   Future<void> userSetUp(String dispalyName,String email)//,String uid)
   async {
    //CollectionReference users = _firestore.collection('users');
     LocationData _myLocation=await LocationService().getLocation();

    ref.add(
    UserModel(
        name:dispalyName,
        location: LatLng(_myLocation.latitude!, _myLocation.longitude!),
        uid: uid,
        mobile: '0', email: email,
        dateCreated:  DateFormat('yyyy-MM-dd hh:mm:ss')
            .format(DateTime.now()) ,
        type: '', rataing: 0.0,num_travel: 0,
        type_car: '',num_car: '',Id_number: '',
        balance: '0',eradat: '0'
    ).toJson()
    );
//        {'dispayName': dispalyName, 'uid': uid});
    return;
  }
  Future<DocumentReference> addtofirestore(Map<String,dynamic> data)async{
    DocumentReference vv=await ref.add(data);
   return vv;
  }

  //  Future<UserModel?> getNameuser() async {
  //
  //   //  FirebaseFirestore.instance
  //   //     .collection('users')
  //   //     .where('uid', isEqualTo: uid)
  //   //     .snapshots()
  //   //     .listen((event) {
  //   //   for (var element in event.docs) {
  //   //     // print(element.data()['dispayName']);
  //   //     // print('====================');
  //   //     return UserModel.fromJson(element.data());//['dispayName'];
  //   //   }
  //   // });
  //   return  FirebaseFirestore.instance
  //        .collection('users')
  //        .where('uid', isEqualTo: uid)
  //        .get().then((value) =>
  //         UserModel.fromJson(value.docs[0].data()));
  // }
  Future<QuerySnapshot> getQuerySnapshotFuture()=> ref.get(
      GetOptions(source: Source.server));
  Stream<QuerySnapshot> getQuerySnapshotStream()=>ref.snapshots();
  Future<DocumentSnapshot> getDocuments(path)=>ref.doc(path).get();
  Stream<DocumentSnapshot> getStreamDocuments(path)=>ref.doc(path).snapshots();
  Future<QuerySnapshot> searchDocuments(searchKey,key)=>ref.orderBy(key)
      .startAt([searchKey])
      .endAt([searchKey + '\uf8ff']).get();

}

