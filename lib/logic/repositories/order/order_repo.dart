import 'package:raselne/data_layer/model/orderModel.dart';

abstract class OrderRepository {
  Stream<List<OrderModel>> getAllorders();
  Future<OrderModel> getOrderById(String id);
  Stream<OrderModel> get_offer(String id_order);

  Future<String> AddOrder(Map<String,dynamic> body);
  Stream<OrderModel> check_approve_order(String idOrder,String idcaptain);

  Future<void> update_order( String idOrder,String idcaptain,String distance_recive_deilvery,String price_deilvery_captain);
  Future<void> approve_order_or_not( String idOrder,bool isopen);
  //عندما يقدم المندوب على العرض سيتم تحويل قيمة المتحول ispause إلى true
}