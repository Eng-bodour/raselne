import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:raselne/data_layer/webServices/firebase.dart';

class FirebaseProvider extends GetxController {
  RxString name = ''.obs;
  getName() {
    name.value = Firebase.name!;
    update();
  }
}
