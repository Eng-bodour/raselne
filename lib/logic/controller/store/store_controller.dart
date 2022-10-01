

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../data_layer/model/store_model.dart';
import '../../repositories/store/store_repo.dart';

class StoreProvider_vm extends ChangeNotifier {
  bool isUsedName = false;
  bool isloading = false;
  late LatLng location;
  String address_store='';
  StoreRepository storeRepository;
  StoreProvider_vm({required this.storeRepository});

  List<StoreModel> liststore =[];
  void setlocation(LatLng? loc,String address) {
    location=loc!;
    address_store=address;
    notifyListeners();
  }
  addStore({required String nameCollecton, required Map<String, dynamic> storeModel,})
  async {
    await storeRepository.AddStore(nameCollecton, storeModel);
    liststore.add(StoreModel.fromSnapshot(storeModel));
    notifyListeners();
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
  Future<void> getstoresbyOwner(String idowner, String typeStore) async {
   isloading=true;
   notifyListeners();
    liststore=await storeRepository.getStoreById(idowner, typeStore);
   // print('type  '+typeStore);
   // for(int i=0;i<liststore.length-1;i++){
   //   print('typeStore  '+liststore[i].typeStore);
   //   if(liststore[i].typeStore==typeStore)
   //     liststore[i].isVisible=true;
   // }

    isloading=false;
    notifyListeners();
  }
}
