


import '../../../data_layer/model/store_model.dart';

abstract class StoreRepository {
  Future<List<StoreModel>> getAllStores();
  Future<List<StoreModel>> getStoreById(String idowner,String typeStore);//للحصول على المتاجر الخاصة بمتجر معين لكي يضيف عليهم منتجاته والاصناف الخاصة بكل متجر
  Future<List<StoreModel>> getStoreByType(String type,List<StoreModel> list);
  Future<StoreModel> AddStore(String nameCollecton,Map<String,dynamic> body);

}



