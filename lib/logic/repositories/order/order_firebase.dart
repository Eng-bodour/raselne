

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:raselne/data_layer/model/orderModel.dart';

import '../../../data_layer/webServices/firebase.dart';
import 'order_repo.dart';

class order_firebase extends OrderRepository{
  @override
  Future<String> AddOrder( Map<String, dynamic> body) async{
    // final moviesRef = FirebaseFirestore.instance.collection('orders').withConverter<OrderModel>(
    //   fromFirestore: (snapshot, _) => Movie.fromJson(snapshot.data()!),
    //   toFirestore: (movie, _) => movie.toJson(),
    // );
    FirebaseServices firestore =
    FirebaseServices("orders");//.collection(nameCollecton);
    DocumentReference doc=await firestore.addtofirestore(body);
    return  doc.id;
    // throw UnimplementedError();
  }

  @override
  Stream<List<OrderModel>> getAllorders() {
    // TODO: implement getAllorders
   return  
     FirebaseServices("orders").ref.where(
       'isopen', isEqualTo: true,).where('ispause' ,isEqualTo: false).snapshots()
       .map((snap) => snap.docs
       .map((doc) =>
         OrderModel.fromSnapshot( doc.data(),doc.id )).toList()
     );
    throw UnimplementedError();
  }

  @override
  Future<OrderModel> getOrderById(String id) {
    // TODO: implement getOrderById

    throw UnimplementedError();
  }

  @override
  Stream<OrderModel> get_offer(String id_order) {
    //ليظهر العرض المقدم من قبل المندوب ليتم قبوله من المستخدم
    // TODO: implement get_offer
    return
      FirebaseServices("orders/$id_order").ref.where(
        'isopen', isEqualTo: true,)
          .where('ispause' ,isEqualTo: true).snapshots()
          .map((snap) =>
          //.map((doc) =>
          OrderModel.fromSnapshot(snap.docs[0].data(),
              snap.docs[0].id ));

    throw UnimplementedError();
  }

  @override
 Future<void> update_order(String idOrder,String idcaptain,String distance_recive_deilvery,String price_deilvery_captain)async {
//عندما المندوب يقدم على الطلب
    // TODO: implement update_order
   await FirebaseServices("orders").ref
        .doc(idOrder)
        .update({
      'ispause': true,
       'distance_recive_deilvery':distance_recive_deilvery,
     'price_deilvery_captain':price_deilvery_captain,
      'captain_user':idcaptain,
    })
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }

  @override
  Stream<OrderModel> check_approve_order(String idOrder,String idcaptain) {
    // TODO: implement check_approve_order
    //

    FirebaseServices("orders/$idOrder").ref.where(
      'captain_user', isEqualTo: idcaptain,).snapshots()
        .map((snap) =>
    //.map((doc) =>
    OrderModel.fromSnapshot(snap.docs[0].data(),
        snap.docs[0].id ));
    throw UnimplementedError();
  }

  @override
  Future<void> approve_order_or_not(String idOrder, bool isopen) {
    // TODO: implement approve_order_or_not
    if(isopen)//refuse order
    FirebaseServices("orders").ref
        .doc(idOrder)
        .update({
     // 'isopen':false,//ليتم ايقاف ظهور الطلب عند باقي المندوبين لانه تم قبوله
      'ispause': false,
      'isopen':isopen,
    });
else  FirebaseServices("orders").ref
        .doc(idOrder)
        .update({
      // 'isopen':false,//ليتم ايقاف ظهور الطلب عند باقي المندوبين لانه تم قبوله
      'isopen':isopen,
    });
    throw UnimplementedError();
  }

}