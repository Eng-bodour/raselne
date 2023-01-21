

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:raselne/data_layer/model/messages_model.dart';
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
  Future<void> update_order(String idOrder,String idcaptain,
      String distance_recive_deilvery,
      String price_deilvery_captain,
      GeoPoint trackingloc
      ) {
    // TODO: implement update_order
    throw UnimplementedError();
  }

  @override
  Stream<OrderModel> check_approve_order(String idOrder,String idcaptain) {
    // TODO: implement check_approve_order
    throw UnimplementedError();
  }

  @override
  Future<void> approve_order_or_not(OrderModel orderModel, bool isopen) {
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

  @override
  Stream<List<MessageText>> getChatOrder(String id_order) {
    // TODO: implement getChatOrder
    throw UnimplementedError();
  }

  @override
  Future<void> sendMessage(MessageText message, String id_order)async {
    // TODO: implement sendMessage
  }

  @override
  Future<void> addInvoice(File? fileimageinvoice,String senderId, MessageText message, String id_order) {
    // TODO: implement addInvoice
    throw UnimplementedError();
  }

  @override
  Future<void> update_state(String idOrder, String state,String idSender) {
    // TODO: implement update_state
    throw UnimplementedError();
  }

  @override
  Future<List<OrderModel>> getAllorderCaptain(String id_Captain) {
    // TODO: implement getAllorderCaptain
    throw UnimplementedError();
  }

  @override
  Future<void> done_order(String idOrder, String state, String idSender,int numtravel,String balance,String eradat,String docIdUser) {
    // TODO: implement done_order
    throw UnimplementedError();
  }



}
