

import 'package:raselne/data_layer/model/orderModel.dart';
import 'package:raselne/data_layer/model/user_model.dart';

import 'order_repo.dart';

class order_api extends OrderRepository {
  @override
  Future<String> AddOrder( Map<String, dynamic> body) {
    // TODO: implement AddOrder
    throw UnimplementedError();
  }

  @override
  Stream<List<OrderModel>> getAllorders() {
    // TODO: implement getAllorders
    throw UnimplementedError();
  }

  @override
  Future<OrderModel> getOrderById(String id) {
    // TODO: implement getOrderById

    throw UnimplementedError();
  }

  @override
  Stream<OrderModel> get_offer(String id_order) {
    // TODO: implement get_offer
    throw UnimplementedError();
  }

  @override
  Future<void> update_order(String idOrder,String idcaptain,String distance_recive_deilvery,String price_deilvery_captain) {
    // TODO: implement update_order
    throw UnimplementedError();
  }

  @override
  Stream<OrderModel> check_approve_order(String idOrder,String idcaptain) {
    // TODO: implement check_approve_order
    throw UnimplementedError();
  }

  @override
  Future<void> approve_order_or_not(String idOrder, bool isopen) {
    // TODO: implement approve_order_or_not
    throw UnimplementedError();
  }

  @override
  Future<List<OrderModel>> getAllorderUser(String id_user) {
    // TODO: implement getAllorderUser
    throw UnimplementedError();
  }

  @override
  Future<UserModel> getusercaptain(String uidcaptain) {
    // TODO: implement getusercaptain
    throw UnimplementedError();
  }

}
