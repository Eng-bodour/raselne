

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:raselne/data_layer/model/orderModel.dart';
import 'package:raselne/data_layer/model/user_model.dart';

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
  print(id_order);

      // FirebaseServices("orders").ref.where(
      //   'isopen', isEqualTo: true,)
      //     .where('ispause' ,isEqualTo: true).snapshots()
      //     .map((snap) =>
      //
      //     OrderModel.fromSnapshot(snap.docs[0].data(),
      //         snap.docs[0].id ));
  OrderModel _ord
  =OrderModel(
      total:9 , id_store: 'id_store',
      captain_user: 'captain_user', content_order: 'content_order',
      detailorderList: [],
      from_user: 'from_user', id_order: id_order,
      is_arrive:false, isdone_recive: false,
      isdone_deilvery: false, isopen: true,
      ispause: true, price_deilvery: 'price_deilvery',
      titleStore: 'titleStore',
      state: 'state', DateTimeorder: 'DateTimeorder');
  //
  // _orderModel.forEach((element) async {
  //   element.user_captain=await
  //   getusercaptain(element.captain_user.toString());
  //   print('ord '+element.user_captain.name.toString());
  //   _ord=element;
  // });

  Stream<OrderModel> _orderModel=
  FirebaseServices("orders")
      .ref.doc(id_order).snapshots().where(
          (event) => OrderModel.fromSnapshot(
      event.data() as Map<String, dynamic>, event.id).ispause==true)
  .map((snap)  {
    print('bbbbb');
     _ord=
    OrderModel.fromSnapshot(
        snap.data() as Map<String, dynamic>, snap.id);
    // _ord.user_captain=
    //     FirebaseServices("users")
    //     .ref.where('uid',isEqualTo: _ord.captain_user ).get()
    // .then((value) => UserModel.fromJson(
    //      value.docs[0].data())) as UserModel;
    // print('_ord.user_captain '+_ord.user_captain.name.toString() );
    // _ord.user_captain=
    // FirebaseServices("users")
    //     .ref.doc(_ord.captain_user ).get()
    //     .then((value) => UserModel.fromJson(
    //     value.data()))  ;
    return _ord;
  });
  _orderModel.map((element)async {
    print('insid ');
   _ord.user_captain=
   await FirebaseServices("users")
        .ref.doc(element.captain_user ).get()
        .then((value) => UserModel.fromJson(
        value.data()))  ;
   return _ord;
  });
  // _orderModel.listen((event) {
  //   event=_ord;
  // });

  // _orderModel.map((event) async  {
  //   _ord=event;
  //   print('sdsdssssssssss'+_ord.captain_user.toString());
  //   _ord.user_captain =await  FirebaseServices("users")
  //       .ref.where('uid',isEqualTo: _ord.captain_user ).get()
  //   .then((value) => UserModel.fromJson(
  //        value.docs[0].data()));
  //   print('nnnnnnnnnnname '+ _ord.user_captain .name.toString());
  // });

      return _orderModel;
  }
 Future<UserModel> getusercaptain(String uidcaptain)async{
    print(uidcaptain);

      UserModel us= await FirebaseServices("users")
        .ref.where('uid',isEqualTo: uidcaptain).limit(1).get()
        .then((value) {
          return UserModel.fromJson(
         value.docs.map((e) => e.data()).first);
        });
      print('us ${us.name}');
      return us;
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

  @override
  Future<List<OrderModel>> getAllorderUser(String id_user) {
    // TODO: implement getAllorderUser
    return
      FirebaseServices("orders").ref.where(
        'from_user', isEqualTo: id_user,).get()
          .then((snap) => snap.docs
          .map((doc) =>
          OrderModel.fromSnapshot( doc.data(),doc.id )).toList()
      );
  }

}