

import 'dart:io';
import '../../../data_layer/model/store_model.dart';

abstract class StoreRepository {
  Future<List<StoreModel>> getAllStores();
  Future<List<StoreModel>> getStoreById(String idowner,String typeStore);//للحصول على المتاجر الخاصة بمتجر معين لكي يضيف عليهم منتجاته والاصناف الخاصة بكل متجر
  Future<List<StoreModel>> getStoreByType(String type,List<StoreModel> list);
  Future<StoreModel> AddStore(File? fileimage ,
      Map<String,dynamic> body,String TypeOperation);
  Future<Itemstore> AddStoreItem(File? fileimage,
      Map<String,dynamic> body,String TypeOperation,String idStore);
  Future<void> deleteStoreItem( Map<String,dynamic> body,String idStore);

}



