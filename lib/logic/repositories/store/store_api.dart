
import 'dart:io';

import 'package:raselne/data_layer/model/store_model.dart';
import 'package:raselne/logic/repositories/store/store_repo.dart';

class StoreAPI extends StoreRepository {

  @override
  Future<List<StoreModel>> getAllStores() {
    // TODO: implement getAllStores
    throw UnimplementedError();
  }

  @override
  Future<List<StoreModel>> getStoreById(String idowner,String typeStore) {
    // TODO: implement getStoreById
    throw UnimplementedError();
  }

  @override
  Future<List<StoreModel>> getStoreByType(String type,List<StoreModel> list) {
    // TODO: implement getStoreByType
    throw UnimplementedError();
  }

  @override
  Future<StoreModel> AddStore(File? fileimage,Map<String, dynamic> body,String TypeOperation) {
    // TODO: implement AddStore
    throw UnimplementedError();
  }

  @override
  Future<Itemstore> AddStoreItem(File? fileimage, Map<String, dynamic> body,String TypeOperation,String idStore) {
    // TODO: implement AddStoreItem
    throw UnimplementedError();
  }

  @override
  Future<void> deleteStoreItem( Map<String, dynamic> body, String idStore) {
    // TODO: implement deleteStoreItem
    throw UnimplementedError();
  }

  @override
  Future<void> rate_store(String value, String idstore, String id_currentUser) {
    // TODO: implement rate_store
    throw UnimplementedError();
  }

  @override
  Future<List<StoreModel>> searchStore(String idowner ) {
    // TODO: implement searchStore
    throw UnimplementedError();
  }



}