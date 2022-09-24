


import '../../../data_layer/model/store_model.dart';

abstract class StoreRepository {
  Future<List<StoreModel>> getAllStores();
  Future<StoreModel> getStoreById(int id);
  Future<List<StoreModel>> getStoreByType(String type,List<StoreModel> list);
  Future<StoreModel> AddStore(String nameCollecton,Map<String,dynamic> body);

}



