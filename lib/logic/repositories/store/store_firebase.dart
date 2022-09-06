


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:raselne/data_layer/model/store_model.dart';
import 'package:raselne/data_layer/webServices/firebase.dart';
import 'package:raselne/logic/repositories/store/store_repo.dart';

class StoreFirebase extends StoreRepository {
  @override
  Future<List<StoreModel>> getAllStores() async{
    List<StoreModel> liststore=[];
    StoreModel storeModel;
    Itemstore itemstore;
    await  FirebaseServices("store").getQuerySnapshotFuture()
         .then((value) => value.docs.forEach(
             (element) {
              storeModel=StoreModel.fromSnapshot(element.data());
              storeModel.IdStore=element.id;
              print(' storeModel.IdStore '+element.id);
               FirebaseServices(
                   "store/"+element.id+"/items_store"
               ).getQuerySnapshotFuture().then((value) =>
                   value.docs.forEach((element) {
                     print(element.data());
                     itemstore=Itemstore.fromJson(element.data());
                     itemstore.IdItemStore=element.id;
                     print('itemstore.IdItemStore '+element.id);
                     storeModel.itemstore.add(itemstore);
                     print( storeModel.itemstore[0].description);
                   }));
              liststore.add(
                  storeModel
              );
             }));

     return liststore;
  }

  @override
  Future<StoreModel> getStoreById(int id) {
    // TODO: implement getStoreById
    throw UnimplementedError();
  }

  @override
  Future<List<StoreModel>> getStoreByType(String type) {
    // TODO: implement getStoreByType
    throw UnimplementedError();
  }

  @override
  Future<StoreModel> AddStore(String nameCollecton,Map<String, dynamic> body)async {
    FirebaseServices firestore =
     FirebaseServices("store");//.collection(nameCollecton);
    firestore.addtofirestore(body);
    throw UnimplementedError();
  }



}