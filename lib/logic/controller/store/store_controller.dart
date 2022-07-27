import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:raselne/data_layer/model/store_model.dart';

class AddStoreController extends GetxController {
  bool isUsedName = false;

  addStore({
    required String nameCollecton,
    required String typename,
    required String nameStore,
    required String mobile,
    required String location,
    //  required int storeId
  }) async {
    CollectionReference firestore =
        FirebaseFirestore.instance.collection(nameCollecton);
    firestore.add({
      // 'user_id': Random(),
      'location': location,
      'mobile': mobile,
      'nameStore': nameStore,
      'typeStore': typename,
      //  'storeID': storeId
    });
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
}
