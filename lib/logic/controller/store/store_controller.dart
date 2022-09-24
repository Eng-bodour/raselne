

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../data_layer/model/store_model.dart';
import '../../repositories/store/store_repo.dart';

class StoreProvider_vm extends ChangeNotifier {
  bool isUsedName = false;
  bool isloading = false;
  StoreRepository storeRepository;
  StoreProvider_vm({required this.storeRepository});

  List<StoreModel> liststore =[];
  addStore({required String nameCollecton, required Map<String, dynamic> storeModel,})
  async {
    storeRepository.AddStore(nameCollecton, storeModel);
  }
  item_to_order(String IdItemStore ) {
    // int index = liststore.indexWhere(
    //         (element) =>
    // element.itemstore.indexWhere((item) => item.IdItemStore==IdItemStore));
    //
print('IdItemStore '+IdItemStore);
    for(int i=0;i<liststore.length;i++) {

      liststore[i].itemstore.forEach((element) {

        if(element.IdItemStore==IdItemStore){
          // liststore[i].isorderd=true;
          element.isorder=true;
        }
      }
      );
    }
    // isorder
    notifyListeners();
  }
  getNameStore({required String nameCollecton, required String name}) async {
    CollectionReference firestore =
        FirebaseFirestore.instance.collection(nameCollecton);
    await firestore
        .where("nameStore", isEqualTo: name)
        .get()
        .then((value) => value.docs.forEach((element) {
              isUsedName = true;
              print('this name is used');
            }));
  }

 Future<void> getstores(String type) async {
   isloading=true;
   notifyListeners();
    liststore=await storeRepository.getAllStores();
   print('type  '+type);
   for(int i=0;i<liststore.length-1;i++){
     print('typeStore  '+liststore[i].typeStore);
     if(liststore[i].typeStore==type)
       liststore[i].isVisible=true;
   }

   isloading=false;
    notifyListeners();
  }
}
