


import 'dart:io';
import 'dart:math';
import 'package:path/path.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
// import 'package:firebase_dart/firebase_dart.dart';
import 'package:raselne/data_layer/model/messages_model.dart';
import 'package:raselne/data_layer/model/orderModel.dart';
import 'package:raselne/data_layer/model/user_model.dart';

import '../../../data_layer/webServices/firebase.dart';
import 'order_repo.dart';
import 'package:intl/intl.dart';
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

  }

  @override
  Stream<List<OrderModel>> getAllorders() {
    // TODO: implement getAllorders
   return  
     FirebaseServices("orders").ref.where(
       'isopen', isEqualTo: true,)
         .where('ispause' ,isEqualTo: false)
         .snapshots(
         // includeMetadataChanges: true
         )
       .map((snap) => snap.docs
       .map((doc) =>
         OrderModel.fromSnapshot(
             doc.data(),doc.id))
         .toList()
     );

  }

  @override
  Future<OrderModel> getOrderById(String id) {
    // TODO: implement getOrderById
    return
      FirebaseServices("orders").ref
      .doc(id)
          .get(
        // includeMetadataChanges: true
      )
          .then((doc) =>
          OrderModel.fromSnapshot(
          doc.data() as Map<String, dynamic>,doc.id)

         );

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
      state: 'state', DateTimeorder: 'DateTimeorder', type_order: '');
  //
  // _orderModel.forEach((element) async {
  //   element.user_captain=await
  //   getusercaptain(element.captain_user.toString());
  //   print('ord '+element.user_captain.name.toString());
  //   _ord=element;
  // });

  Stream<OrderModel> _orderModel=
  FirebaseServices("orders")
      .ref.doc(id_order).snapshots(includeMetadataChanges: true).where(
          (event) => OrderModel.fromSnapshot(
      event.data() as Map<String, dynamic>, event.id).ispause==true)
      .where((event) =>OrderModel.fromSnapshot(
      event.data() as Map<String, dynamic>, event.id).isopen==true )
      .map((snap)  {
      _ord= OrderModel.fromSnapshot(
      snap.data() as Map<String, dynamic>, snap.id);
   // _ord.user_captain=
    //     FirebaseServices("users")
    //     .ref.where('uid',isEqualTo: _ord.captain_user ).get()
    // .then((value) => UserModel.fromJson(
    //      value.docs[0].data())) as UserModel;
    // print('_ord.user_captain '+_ord.user_captain.name.toString() );

   /* FirebaseServices("users")
        .ref.doc(_ord.captain_user ).get()
        .then((value) =>
        UserModel.fromJson(value.data()))
        .then((value) =>
        _ord.user_captain=
        UserModel.fromJson(value as Map<String, dynamic> ))  ;*/
      // FirebaseServices("users")
      //       .ref.where('uid', isEqualTo: _ord.captain_user.toString(),)
      //      .get()
      //      .then((snap) =>
      //      snap.docs.map((doc) =>
      //      UserModel.fromJson(doc.data())).first).then(
      //         (value) {
      //           _ord.user_captain=
      //             UserModel.fromJson(value.toJson());
      //            print('mappp ' +_ord.user_captain.name.toString());
      //         }
      // );
      // _ord.user_captain= getusercaptain(_ord.captain_user.toString());
       return _ord;
  });
  // db.settings = const Settings(
  //   persistenceEnabled: true,
  //   cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED,
  // );
   /* _orderModel.forEach((element)async {
      element.user_captain=  await FirebaseServices("users")
          .ref.where('uid', isEqualTo: _ord.captain_user.toString(),)
          .get()
          .then((snap) =>
      snap.docs.map((doc) =>
          UserModel.fromJson(doc.data())).first).then(
              (value) {
         return
                UserModel.fromJson(value.toJson());
              });
////////////////////////////////////////////////
      // _orderModel.listen((event) {
      //   event=element;
      //   print('listen');
      // });

      print('mappp ' +element.user_captain.name.toString());

    });*/
   // _orderModel.forEach((value) {
   //   print('insid ');
   //   print(value.user_captain.name);
   // });
  //  print('insid ');
  //  _ord.user_captain=
  //  await FirebaseServices("users")
  //       .ref.where(
  //       'uid', isEqualTo: element.captain_user.toString(),).get()
  //      .then((snap) =>
  //      snap.docs.map((doc) =>
  //      UserModel.fromJson(doc.data())).first);
  //
  //  // .then((value) => UserModel.fromJson(
  //       // value.data()))  ;
  //  // FirebaseServices("orders").ref.where(
  //  //   'from_user', isEqualTo: id_user,).get()
  //  //     .then((snap) => snap.docs
  //  //     .map((doc) =>
  //  //     OrderModel.fromSnapshot( doc.data(),doc.id )).toList()
  //  // );
  //  return _ord;
  // });
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
 @override
  Future<UserModel> getusercaptain(String uidcaptain) async {
    print(uidcaptain);

      UserModel us= await FirebaseServices("users")
        .ref.where('uid',isEqualTo: uidcaptain).limit(1).get()
        .then((value) {
          return UserModel.fromJson(
         value.docs.map((e) => e.data()).first,  value.docs.map((e) => e.id).first);
        });
      print('us ${us.name}');
      return us;
 }

  @override
 Future<void> update_order(String idOrder,String idcaptain,
      String distance_recive_deilvery,
      String price_deilvery_captain,GeoPoint trackingloc)async {
//عندما المندوب يقدم على الطلب
    // TODO: implement update_order
   await FirebaseServices("orders").ref
        .doc(idOrder)
        .update({
       'ispause': true,
       'distance_recive_deilvery':distance_recive_deilvery,
       'price_deilvery_captain':price_deilvery_captain,
       'price_deilvery':price_deilvery_captain,
       'captain_user':idcaptain,
       'trackingLocation':trackingloc,

    })
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }


  @override
  Stream<OrderModel> check_approve_order(String idOrder,
      String idcaptain) {
    print('dsaaaaaaaaaaaaaaaaaaaaaaaaaaaa'
    );
    print(idcaptain);
    print(idOrder);
    // TODO: implement check_approve_order
  return  FirebaseServices("orders").ref.doc(idOrder).snapshots()
        .where(
          (event) => OrderModel.fromSnapshot(
          event.data() as
          Map<String, dynamic>, event.id).captain_user==idcaptain
      // 'captain_user', isEqualTo: idcaptain,
    )
      .map((snap) =>
    //.map((doc) =>
    OrderModel.fromSnapshot(
        snap.data() as Map<String, dynamic>, snap.id));
   // throw UnimplementedError();
  // FirebaseServices("orders")
  //     .ref.doc(id_order).snapshots().where(
  //         (event) => OrderModel.fromSnapshot(
  //         event.data() as Map<String, dynamic>, event.id).ispause==true)
  //     .where((event) =>OrderModel.fromSnapshot(
  //     event.data() as Map<String, dynamic>, event.id).isopen==true )
  //     .map((snap)  {
  //   _ord= OrderModel.fromSnapshot(
  //       snap.data() as Map<String, dynamic>, snap.id);
  }

  @override
  Future<void> approve_order_or_not(OrderModel orderModel, bool isopen)async {
    // TODO: implement approve_order_or_not
    if( isopen)//refuse order
   await FirebaseServices("orders").ref
        .doc(orderModel.id_order)
        .update({
      //refuse offer
      'ispause': false,
      'isopen':isopen,
      'isapprove':false,
    });
else {
      MessageText message=
      MessageText(senderId: orderModel.from_user, type_message: 'map',
          textMessage:' مكان الاستلام '+orderModel.detailAddressfrom.toString(),
          timeMessage: DateFormat('yyyy-MM-dd HH:mm:ss')
              .format(DateTime.now()).toString(),
          location:GeoPoint(
              orderModel.fromlocation!.latitude,
              orderModel.fromlocation!.longitude)
      );
      message=
          MessageText(senderId: orderModel.from_user, type_message: 'map',
              textMessage:' مكان التسليم '+orderModel.detailAddressTo.toString(),
              timeMessage: DateTime.now().toString(),
              location:GeoPoint(
                  orderModel.toLocation!.latitude,
                  orderModel.toLocation!.longitude)
          );
      await
      FirebaseServices('orders').ref.doc(orderModel.id_order)
          .collection('chat')
          .add(message.toSnapchot());

  await FirebaseServices("orders").ref
        .doc(orderModel.id_order)
        .update({
      // 'isopen':false,//ليتم ايقاف ظهور الطلب عند باقي المندوبين لانه تم قبوله
      'isopen':true,
      'isapprove':true,
      'ispause': true,
      'state':'approve',
      'startorder':
      //DateTime.now().toString(),
      DateFormat('yyyy-MM-dd hh:mm:ss')
          .format(DateTime.now()),
  });
}
    /////////////////////////////////////////////////
    // message=
    //     MessageText(senderId: orderModel.from_user, type_message: 'map',
    //         textMessage:orderModel.detailAddress,//address tolocation
    //         timeMessage: DateTime.now().toString(),
    //         location:GeoPoint( orderModel.fromlocation.latitude, orderModel.fromlocation.longitude)
    //     );
    // await
    // FirebaseServices('orders').ref.doc(orderModel.id_order)
    //     .collection('chat').doc()
    //     .set(message.toSnapchot());
  }

  @override
  Future<List<OrderModel>> getAllorderUser(String id_user) {
    // TODO: implement getAllorderUser
    return
      FirebaseServices("orders").ref
          //.orderBy('DateTimeorder',descending: true)
          .where(
          'from_user', isEqualTo: id_user,)
          .get(  GetOptions(source: Source.server))
          .then((snap) => snap.docs
          .map((doc) =>
          OrderModel.fromSnapshot( doc.data(),doc.id )).toList()
      );
  }

  @override
  Stream<List<MessageText>> getChatOrder(String id_order) {
    // TODO: implement getChatOrder
    return   FirebaseServices("orders")
        .ref.doc(id_order).collection('chat')
        .orderBy('timeMessage' )
        .snapshots().map((event) =>
         event.docs.map((element) {
       return
         MessageText.fromSnapshot( element.data());
      }).toList());

    // })
    //     .map((event) =>
    //     event.docs.forEach  ((doc) =>
    //     Message.fromSnapshot(doc.data() as Map<String,dynamic>)));

}

  @override
  Future<void> sendMessage(MessageText message, String id_order)async {
    // TODO: implement sendMessage
   await FirebaseServices('orders').ref.doc(id_order).collection('chat').doc()
        .set(message.toSnapchot());
  }

  Future<String> uploadImageToFirebase(File imageFile) async {
    String nameimage=basename(imageFile.path);
    // Create the file metadata
    final metadata = SettableMetadata(
        contentType: "image/jpg");


    var random=Random().nextInt(100000);
    var storageRef=FirebaseStorage.instance.
    ref('images/$random${nameimage}');

    String urlimage='';
    final uploadTask = await storageRef.putFile(imageFile,metadata);
    if(uploadTask.state==TaskState.success)
      urlimage =await storageRef.getDownloadURL();

    // Upload file and metadata to the path 'images/mountains.jpg'
    // Uint8List data=fileimageinvoice.

    // = storageRef
    //     .child("images/${nameimage}")
    //     .putFile(imageFile,metadata);
    // Listen for state changes, errors, and completion of the upload.
    // String urlimage='';
    //
    // uploadTask.snapshotEvents.listen((TaskSnapshot taskSnapshot) async {
    //   switch (taskSnapshot.state) {
    //     case TaskState.running:
    //       final progress =
    //           100.0 * (taskSnapshot.bytesTransferred / taskSnapshot.totalBytes);
    //       print("Upload is $progress% complete.");
    //       break;
    //     case TaskState.paused:
    //       print("Upload is paused.");
    //       break;
    //     case TaskState.canceled:
    //       print("Upload was canceled");
    //       break;
    //     case TaskState.error:
    //     // Handle unsuccessful uploads
    //       break;
    //     case TaskState.success:
    //     // Handle successful uploads on complete
    //     // ...
    //       urlimage=await storageRef.getDownloadURL();
    //       break;
    //   }
    // });
    return urlimage;
  }
  @override
  Future<void> addInvoice(File? fileimageinvoice,String senderId,MessageText message, String id_order)
  async {
    // TODO: implement addInvoice
    String imagurl='';
    if(fileimageinvoice!=null){
      imagurl= await  uploadImageToFirebase(fileimageinvoice);
    MessageText messageText =MessageText(
      senderId: senderId, type_message: 'image');
      messageText.textMessage=imagurl.toString();
      messageText.type_message='image';
      messageText.timeMessage=DateFormat('yyyy-MM-dd HH:mm:ss')
          .format(DateTime.now()) .toString();
      await FirebaseServices('orders').ref.doc(id_order)
          .collection('chat')
          .add(messageText.toSnapchot());
    }

   message.senderId=senderId;
   message.timeMessage=DateFormat('yyyy-MM-dd HH:mm:ss')
       .format(DateTime.now()) .toString();
   await FirebaseServices('orders').ref.doc(id_order)
       .collection('chat').doc()
       .set(message.toSnapchot());
     await FirebaseServices('orders').ref.doc(id_order)
       .update({
       'state':'done invoice'
     });

  }

  @override
  Future<void> update_state(String idOrder, String state,String idSender) async {
    // TODO: implement update_state
    if(state=='done')
   {

   }
  else
    {
      if (state=='done arrive')
        await
        FirebaseServices("orders").ref
        .doc(idOrder)
        .update({
        'state':state,
        'endorder':
          //DateTime.now().toString(),
          DateFormat('yyyy-MM-dd hh:mm:ss')
              .format(DateTime.now()),
    })
        .then((value) => print("state order Updated"))
        .catchError((error) => print("Failed to update user: $error"));
 else  await
      FirebaseServices("orders").ref
          .doc(idOrder)
          .update({
        'state':state,

      })
          .then((value) => print("state order Updated"))
          .catchError((error) => print("Failed to update user: $error"));
  }
    String state_message='';
    switch( state) {
      case 'done recive':
        state_message= 'تم استلام طلبك ';
        break;

      case 'done arrive':
        state_message=  'طلبك رقم 23882 وصل , المندوب عند موقع التسليم الآن';
        break;
      case 'done':
        state_message=  'تم التسليم';
        break;
    }
    MessageText messageText =MessageText(
        senderId: idSender, type_message: 'text');
    messageText.textMessage=state_message;
    messageText.timeMessage=DateFormat('yyyy-MM-dd HH:mm:ss')
        .format(DateTime.now()).toString();
    sendMessage(messageText, idOrder);

  }

  @override
  Future<List<OrderModel>> getAllorderCaptain(String id_Captain) {
    // TODO: implement getAllorderCaptain
   // throw UnimplementedError();
    return
      FirebaseServices("orders").ref.where(
          'captain_user', isEqualTo: id_Captain,).get()
          .then((snap) => snap.docs
          .map((doc) =>
          OrderModel.fromSnapshot( doc.data(),doc.id )).toList()
      );
  }

  @override
  Future<void> done_order(String idOrder, String state, String idSender,
      int numtravel,String balance,String eradat,String docIdUser) async {
    // TODO: implement done_order
    await FirebaseServices("orders").ref
        .doc(idOrder)
        .update({
      'state':state,
      'isopen':false,
      'isdone_deilvery':true,
      'endorder':
      DateFormat('yyyy-MM-dd HH:mm:ss')
      .format(DateTime.now())
      //DateTime.now().toString(),
    })
        .then((value) => print("state order Updated"))
        .catchError((error) => print("Failed to update user: $error"));

await FirebaseServices("users").ref
        .doc(docIdUser)
        .update({
      'num_travel':numtravel,
      'eradat':eradat,
      // 'balance':balance,
    })
        .then((value) => print("state order Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }

}