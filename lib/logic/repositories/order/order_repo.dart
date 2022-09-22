import 'dart:io';

import 'package:raselne/data_layer/model/messages_model.dart';
import 'package:raselne/data_layer/model/orderModel.dart';

import '../../../data_layer/model/user_model.dart';

abstract class OrderRepository {
  Stream<List<OrderModel>> getAllorders();
  Future<List<OrderModel>> getAllorderUser(String id_user);//تحميل الطلبات التي طلبها المستخدم
  Future<List<OrderModel>> getAllorderCaptain(String id_Captain);//تحميل الطلبات التي استلمها المندوب لكي يوصلها
  Future<OrderModel> getOrderById(String id);
  Stream<OrderModel> get_offer(String id_order);
  Future<UserModel> getusercaptain(String uidcaptain);
  Future<String> AddOrder(Map<String,dynamic> body);
  Stream<OrderModel> check_approve_order(String idOrder,String idcaptain);
  Stream<List<MessageText>> getChatOrder(String id_order);
  Future<void> update_order( String idOrder,String idcaptain,String distance_recive_deilvery,String price_deilvery_captain);
  Future<void> update_state( String idOrder,String state,String idSender);
  Future<void> approve_order_or_not( OrderModel orderModel,bool isopen);
  //عندما يقدم المندوب على العرض سيتم تحويل قيمة المتحول ispause إلى true
 Future<void> sendMessage(MessageText message,String id_order);
 Future<void> addInvoice(File? fileimageinvoice,String senderId, MessageText message,String id_order);

}