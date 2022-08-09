import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class CategoryStoreProvider extends ChangeNotifier {
  addCategory({
    required String nameCollection,
    required String nameCategory,
    required String description,
    required String price,
    required String image,

    //  required int storeId
  }) async {
    CollectionReference firestore =
        FirebaseFirestore.instance.collection(nameCollection);
    firestore.add({
      'nameCategory': nameCategory,
      'description': description,
      'price': price,
      'image': image,
    });
  }
}
