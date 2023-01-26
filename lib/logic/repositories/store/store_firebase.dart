


import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_dart/firebase_dart.dart';
import 'package:raselne/data_layer/model/store_model.dart';
import 'package:raselne/data_layer/webServices/firebase.dart';
import 'package:raselne/logic/repositories/store/store_repo.dart';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:raselne/services/imageservice.dart';

class StoreFirebase extends StoreRepository {
  @override
  Future<List<StoreModel>> getAllStores() async {
    List<StoreModel> liststore = [];
    List<StoreModel> liststoreNew = [];
    StoreModel storeModel, tempstore;
    List<Itemstore> itemstore = [];
   await FirebaseServices("store").getQuerySnapshotFuture()
        .then((value) =>
        value.docs.forEach(
                (doc) async {
              itemstore = [];
              int idex_itemStore = 0;
              storeModel = StoreModel.fromSnapshot(doc.data());
              storeModel.IdStore = doc.id;
              print(' storeModel.IdStore ' + doc.id);

              //  FirebaseServices(
              //     "store/"+storeModel.IdStore.toString()+"/items_store"
              // ).getQuerySnapshotFuture()
              // await  FirebaseFirestore.instance
              //       .collectionGroup('items_store')
              //       // .collection("items_store")
              //       .get() .then((value) =>
              //      value.docs.forEach((element) {
              //        print(element.data());
              //        print(' storeModel.IdStore '+storeModel.IdStore.toString());
              //        itemstore.add(Itemstore.fromJson(element.data()));
              //        itemstore[idex_itemStore].IdItemStore=element.id;
              //        print('itemstore.IdItemStore '+element.id);
              //        storeModel.itemstore=List.from(itemstore);
              //        print( storeModel.itemstore[0].description);
              //        idex_itemStore++;
              //        print('idex_itemStore '+idex_itemStore.toString());
              //      }
              //      ));

              liststore.add(
                  StoreModel(
                      nameStore: storeModel.nameStore,
                      descStore: storeModel.descStore,
                      typeStore: storeModel.typeStore,
                      mobileStore: storeModel.mobileStore,
                      offer_value: storeModel.offer_value,
                      rating: storeModel.rating,
                      IdStore: storeModel.IdStore,
                      itemstore: storeModel.itemstore,
                      idowner: storeModel.idowner,
                      isVisible: false,
                      stateStore: storeModel.stateStore,
                      location: storeModel.location,
                      imageStore: storeModel.imageStore
                  )
              );
            }));

    for (var item in liststore) {
      itemstore = [];
      int idex_itemStore = 0;
      print(' item  IdStore: ' + item.IdStore.toString());
      print('----------------------------------------------');
      var valueitem = await  FirebaseFirestore.instance
          .doc('store/'+item.IdStore.toString())
            //.collectionGroup('items_store')
            .collection("items_store")
            .get();
      // FirebaseServices(
      //     "store/" + item.IdStore.toString() + "/items_store"
      // ).getQuerySnapshotFuture();

      valueitem.docs.forEach((element) {
        print(element.data());
        itemstore.add(Itemstore.fromJson(element.data()));
        itemstore[idex_itemStore].IdItemStore = element.id;
        print('itemstore.IdItemStore ' + element.id);
        print(' item -- IdStore: ' + item.IdStore.toString());

        item.itemstore = List.from(itemstore);
        print(item.itemstore[0].description);
        idex_itemStore++;
      });
      // liststoreNew.add(item);
    }
      return liststore;
    }

    @override
    Future<List<StoreModel>> getStoreById(String idowner,String typeStore) async {
    //get owner stores
      // TODO: implement getStoreById
      List<StoreModel> liststore = [];
      List<StoreModel> liststoreNew = [];
      StoreModel storeModel, tempstore;
      List<Itemstore> itemstore = [];
      await FirebaseServices("store").ref
          .where('idowner',isEqualTo: idowner)
          .where('typeStore',isEqualTo: typeStore)
          .get()
          .then((value) =>
          value.docs.forEach(
                  (doc) async {
                itemstore = [];
                int idex_itemStore = 0;
                storeModel = StoreModel.fromSnapshot(doc.data());
                storeModel.IdStore = doc.id;
                print(' storeModel.IdStore ' + doc.id);

                //  FirebaseServices(
                //     "store/"+storeModel.IdStore.toString()+"/items_store"
                // ).getQuerySnapshotFuture()
                // await  FirebaseFirestore.instance
                //       .collectionGroup('items_store')
                //       // .collection("items_store")
                //       .get() .then((value) =>
                //      value.docs.forEach((element) {
                //        print(element.data());
                //        print(' storeModel.IdStore '+storeModel.IdStore.toString());
                //        itemstore.add(Itemstore.fromJson(element.data()));
                //        itemstore[idex_itemStore].IdItemStore=element.id;
                //        print('itemstore.IdItemStore '+element.id);
                //        storeModel.itemstore=List.from(itemstore);
                //        print( storeModel.itemstore[0].description);
                //        idex_itemStore++;
                //        print('idex_itemStore '+idex_itemStore.toString());
                //      }
                //      ));

                liststore.add(
                    StoreModel(
                        nameStore: storeModel.nameStore,
                        descStore: storeModel.descStore,
                        typeStore: storeModel.typeStore,
                        mobileStore: storeModel.mobileStore,
                        offer_value: storeModel.offer_value,
                        rating: storeModel.rating,
                        IdStore: storeModel.IdStore,
                        itemstore: storeModel.itemstore,
                        idowner: storeModel.idowner,
                        isVisible: true,
                        stateStore: storeModel.stateStore,
                        location: storeModel.location,
                        imageStore: storeModel.imageStore

                    )
                );
              }));

      for (var item in liststore) {
        itemstore = [];
        int idex_itemStore = 0;
        print(' item  IdStore: ' + item.IdStore.toString());
        print('----------------------------------------------');
        var valueitem = await  FirebaseFirestore.instance
            .doc('store/'+item.IdStore.toString())
        //.collectionGroup('items_store')
            .collection("items_store")
            .get();
        // FirebaseServices(
        //     "store/" + item.IdStore.toString() + "/items_store"
        // ).getQuerySnapshotFuture();

        valueitem.docs.forEach((element) {
          print(element.data());
          itemstore.add(Itemstore.fromJson(element.data()));
          itemstore[idex_itemStore].IdItemStore = element.id;
          print('itemstore.IdItemStore ' + element.id);
          print(' item -- IdStore: ' + item.IdStore.toString());

          item.itemstore = List.from(itemstore);
          print(item.itemstore[0].description);
          idex_itemStore++;
        });
        // liststoreNew.add(item);
      }
      return liststore;

    }

    @override
    Future<List<StoreModel>> getStoreByType(String type,
        List<StoreModel> list) {
      // TODO: implement getStoreByType
      print('type  ' + type);
      for (int i = 0; i < list.length; i++) {
        if (list[i].typeStore == type)
          list[i].isVisible = true;
      }

      throw UnimplementedError();
    }

    @override
    Future<StoreModel> AddStore(File? fileimage,
        Map<String, dynamic> body,String TypeOperation) async {
      String imagurl='';
      if(TypeOperation=='add'){
      if(fileimage!=null) {
        imagurl = await image_service().uploadImageToFirebase(fileimage,'imageStore');//imageUser
        body.addAll({'imageStore':imagurl});
      }
      FirebaseServices firestore =
      FirebaseServices("store"); //.collection(nameCollecton);
      DocumentReference ref= await firestore.addtofirestore(body);
      body.addAll({'IdStore':ref.id});
      }
      else{
        if(fileimage!=null) {//upload image
        await  FirebaseStorage.instance.refFromURL(body['imageStore']).delete();
          imagurl = await image_service(). uploadImageToFirebase(fileimage,'imageStore');
          body.addAll({'imageStore':imagurl});
        }
        FirebaseFirestore.instance.collection('store').doc(
          body['IdStore']
        ).update(body);
        // FirebaseServices firestore =
        // FirebaseServices("store"); //.collection(nameCollecton);
        // DocumentReference ref= await firestore.(body);
        // body.addAll({'IdStore':ref.id});
      }

      return StoreModel.fromSnapshot(body);
    }

  @override
  Future<Itemstore> AddStoreItem(File? fileimage, Map<String, dynamic> body,String TypeOperation,String idStore)async {
    // TODO: implement AddStoreItem
    String imagurl='';
    if(TypeOperation=='add'){
      if(fileimage!=null) {
        imagurl = await image_service().uploadImageToFirebase(fileimage,'imageItemStore');
        body.addAll({'image':imagurl});
      }
      DocumentReference ref= await FirebaseFirestore.instance
          .collection('store').doc(idStore)
          .collection('items_store').add(body);
      // FirebaseServices firestore =
      // FirebaseServices("store"); //.collection(nameCollecton);
      // DocumentReference ref= await firestore.addtofirestore(body);
      body.addAll({'IdItemStore':ref.id});
    }
    else{
      if(fileimage!=null) {//upload image
        await  FirebaseStorage.instance.refFromURL(body['image']).delete();
        imagurl = await image_service().uploadImageToFirebase(fileimage,'imageItemStore');
        body.addAll({'image':imagurl});
      }
      FirebaseFirestore.instance.collection('store').doc(idStore)
          .collection('items_store').doc(body['IdItemStore']).update(body);
      // FirebaseServices firestore =
      // FirebaseServices("store"); //.collection(nameCollecton);
      // DocumentReference ref= await firestore.(body);
      // body.addAll({'IdStore':ref.id});
    }

    return Itemstore.fromJson(body);
  }

  @override
  Future<void> deleteStoreItem( Map<String, dynamic> body, String idStore)async {
    // TODO: implement deleteStoreItem
    await  FirebaseStorage.instance.refFromURL(body['image']).delete();//لحذف صورة الصنف
    await FirebaseFirestore.instance.collection('store').doc(idStore)
        .collection('items_store').doc(body['IdItemStore']).delete();
  }

  @override
  Future<void> rate_store(String value, String idstore, String id_currentUser) async{
    // TODO: implement rate_store
    List<Map<String, String>> myData = [
      {
        'id_user': id_currentUser,
        'value_rate': value
      },
      // {'question': 'How much?', 'answer': 'five dollars'},
    ];
    // String doc='';
    // await  FirebaseServices("store").ref.where(
    //   'uid', isEqualTo: idstore,).get().then(
    //         (value) =>
    //     doc= value.docs[0].id
    // );
    await FirebaseFirestore.instance
        .collection('store').doc(idstore).update({
      'rate': myData
      // .doc('users/$doc')
      // .update({'rate': myData});
      // throw UnimplementedError();
    });

  }

  @override
  Future<List<StoreModel>> searchStore(String idowner )async {
    // TODO: implement searchStore
    List<StoreModel> liststore = [];
    List<StoreModel> liststoreNew = [];
    StoreModel storeModel, tempstore;
    List<Itemstore> itemstore = [];
    await FirebaseServices("store").ref
        .where('idowner',isEqualTo: idowner)
        .get()
        .then((value) =>
        value.docs.forEach(
                (doc) async {
              itemstore = [];
              int idex_itemStore = 0;
              storeModel = StoreModel.fromSnapshot(doc.data());
              storeModel.IdStore = doc.id;
              print(' storeModel.IdStore ' + doc.id);

              //  FirebaseServices(
              //     "store/"+storeModel.IdStore.toString()+"/items_store"
              // ).getQuerySnapshotFuture()
              // await  FirebaseFirestore.instance
              //       .collectionGroup('items_store')
              //       // .collection("items_store")
              //       .get() .then((value) =>
              //      value.docs.forEach((element) {
              //        print(element.data());
              //        print(' storeModel.IdStore '+storeModel.IdStore.toString());
              //        itemstore.add(Itemstore.fromJson(element.data()));
              //        itemstore[idex_itemStore].IdItemStore=element.id;
              //        print('itemstore.IdItemStore '+element.id);
              //        storeModel.itemstore=List.from(itemstore);
              //        print( storeModel.itemstore[0].description);
              //        idex_itemStore++;
              //        print('idex_itemStore '+idex_itemStore.toString());
              //      }
              //      ));

              liststore.add(
                  StoreModel(
                      nameStore: storeModel.nameStore,
                      descStore: storeModel.descStore,
                      typeStore: storeModel.typeStore,
                      mobileStore: storeModel.mobileStore,
                      offer_value: storeModel.offer_value,
                      rating: storeModel.rating,
                      IdStore: storeModel.IdStore,
                      itemstore: storeModel.itemstore,
                      idowner: storeModel.idowner,
                      isVisible: true,
                      stateStore: storeModel.stateStore,
                      location: storeModel.location,
                      imageStore: storeModel.imageStore

                  )
              );
            }));

    for (var item in liststore) {
      itemstore = [];
      int idex_itemStore = 0;
      print(' item  IdStore: ' + item.IdStore.toString());
      print('----------------------------------------------');
      var valueitem = await  FirebaseFirestore.instance
          .doc('store/'+item.IdStore.toString())
      //.collectionGroup('items_store')
          .collection("items_store")
          .get();
      // FirebaseServices(
      //     "store/" + item.IdStore.toString() + "/items_store"
      // ).getQuerySnapshotFuture();

      valueitem.docs.forEach((element) {
        print(element.data());
        itemstore.add(Itemstore.fromJson(element.data()));
        itemstore[idex_itemStore].IdItemStore = element.id;
        print('itemstore.IdItemStore ' + element.id);
        print(' item -- IdStore: ' + item.IdStore.toString());

        item.itemstore = List.from(itemstore);
        print(item.itemstore[0].description);
        idex_itemStore++;
      });
      // liststoreNew.add(item);
    }
    return liststore;

    // await FirebaseServices("store").searchDocuments(nameStore, '');
  }
}