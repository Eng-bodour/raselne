

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../data_layer/model/store_model.dart';
import '../../repositories/store/store_repo.dart';
import 'dart:io';
class StoreProvider_vm extends ChangeNotifier {
  bool isUsedName = false;
  bool isloading = false;
  late LatLng location;
  String address_store='';
  StoreRepository storeRepository;
  StoreProvider_vm({required this.storeRepository});

  List<StoreModel> liststore =[];
  // late StoreModel? currentStore=null;
  void setlocation(LatLng? loc,String address) {
    location=loc!;
    address_store=address;
    notifyListeners();
  }
  int getindexStore(String id) {
    int index=-1;
    index= liststore.indexWhere((element) => element.IdStore==id);
    return index;
  }
  Future<void> getstoremodel(String id) async {
    if(liststore.isEmpty )
     await storeRepository.getAllStores();
    //notifyListeners();
    if(liststore.isNotEmpty  )
      for(int i=0;i<liststore.length;i++)
      {
        liststore[i].rataing=StoreModel.getrate( liststore[i].rating);
        // if(liststore[i].IdStore==id)
        //   currentStore=liststore[i];
      }
      // currentStore= liststore.firstWhere((element) =>element.IdStore==id
      //,orElse: null
      //);
      print('id '+id.toString());
      // else currentStore= null;

      notifyListeners();
  }

 Future<void> SaveStore({File? fileimage, required Map<String, dynamic> storeModel,
    required String type})
  async {
    isloading=true;
    notifyListeners();
    StoreModel store=await storeRepository.AddStore(fileimage , storeModel,type);
    if(type=='add')
    liststore.add(store);
    else //edit
   { int index=liststore.indexWhere((element) => element.IdStore==storeModel['IdStore']);
    if(index!=-1)
      liststore[index]=store;
   }
    isloading=false;
    notifyListeners();
  }

  Future<void> getstorefilter(String nameStore,String idowner) async {
    isloading=true;
    notifyListeners();
    // liststore=await storeRepository.searchStore(nameStore);
    if(liststore.isEmpty ) {
      if(idowner=='')
        liststore=await storeRepository.getAllStores();
      else
        liststore=await storeRepository.searchStore(idowner);

    }
    else
      for(int i=0;i<liststore.length-1;i++){
          if( liststore[i].isVisible==false)
          liststore[i].isVisible=true;
    }
    liststore.where((element) =>
         element.nameStore.contains(nameStore)
         // .startsWith(nameStore.substring(0,nameStore.length-1)

    );
    isloading=false;
    notifyListeners();
  }

 Future<void> SaveStoreItem({File? fileimage, required Map<String, dynamic> itemStore,
    required String idStore,
    required String type})
  async {
    isloading=true;
    notifyListeners();
    Itemstore item= await storeRepository.AddStoreItem(fileimage , itemStore,type,idStore);
    // int index=liststore.indexWhere((element) => element.IdStore==idStore);
    int index=liststore.indexWhere((element) => element.IdStore==idStore);
    if(index!=-1) {
      int index2 = liststore[index].itemstore.indexWhere((element) =>
      element.IdItemStore == itemStore['IdItemStore']);
      if(index2!=-1){
        liststore[index].itemstore[index2]=item;
      }else {
        liststore[index].itemstore.add(item);

      }
      // .add(Itemstore.fromJson(itemStore));
    }
    isloading=false;
    notifyListeners();
  }
  Future<void> deleteItemStore(Itemstore itemstore,String idStore)async{
    isloading=true;
    notifyListeners();
    await storeRepository.deleteStoreItem(itemstore.toJson(),idStore);
    isloading=false;
    notifyListeners();

  }

 void item_to_order(String IdItemStore ) {
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
     liststore[i].rataing=StoreModel.getrate( liststore[i].rating);
     print('typeStore  '+ liststore[i].typeStore);
     if(type!='')
     if(liststore[i].typeStore==type)
       liststore[i].isVisible=true;
   }

    isloading=false;
    notifyListeners();
  }
  Future<void> rateStore(String value,String idstore,String iduser) async {

    isloading=true;
    notifyListeners();
    await storeRepository.rate_store( value, idstore, iduser);

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
   for(int i=0;i<liststore.length-1;i++){
     liststore[i].rataing=StoreModel.getrate( liststore[i].rating);

   }
   isloading=false;
   notifyListeners();
  }
}
