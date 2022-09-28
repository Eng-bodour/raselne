


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:raselne/data_layer/model/store_model.dart';
import 'package:raselne/data_layer/webServices/firebase.dart';
import 'package:raselne/logic/repositories/store/store_repo.dart';

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
                      itemstore: storeModel.itemstore
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
    Future<StoreModel> getStoreById(int id) {
      // TODO: implement getStoreById
      throw UnimplementedError();
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
    Future<StoreModel> AddStore(String nameCollecton,
        Map<String, dynamic> body) async {
      FirebaseServices firestore =
      FirebaseServices("store"); //.collection(nameCollecton);
    DocumentReference ref= await firestore.addtofirestore(body);
      body.addAll({'IdStore':ref.id});
     return StoreModel.fromSnapshot(body);
      // throw UnimplementedError();
    }
  }