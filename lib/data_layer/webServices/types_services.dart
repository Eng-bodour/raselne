import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:raselne/data_layer/model/typs_model.dart';

class TypesServices {
  static Future<List<TypsModel>> getTypes(String collectionPath) async {
    CollectionReference ref =
        FirebaseFirestore.instance.collection(collectionPath);
    QuerySnapshot querySnapshot = await ref.get();
    List<QueryDocumentSnapshot> list = querySnapshot.docs;
    var typList = list.map((e) => TypsModel.fromJson(e.data())).toList();
    return typList;
  }
}
