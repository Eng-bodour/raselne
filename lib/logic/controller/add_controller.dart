import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class AddController extends GetxController {
  addStore(
      {required String nameCollecton,
      required String typename,
      required String nameStore,
      required String mobile,
      required String location}) async {
    CollectionReference firestore =
        FirebaseFirestore.instance.collection(nameCollecton);
    firestore.add({
      'location': location,
      'mobile': mobile,
      'nameStore': nameStore,
      'typeStore': typename,
    });
  }
}
