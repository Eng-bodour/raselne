
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
  Future<StoreModel> AddStore(String nameCollecton,Map<String, dynamic> body) {
    // TODO: implement AddStore
    throw UnimplementedError();
  }



}