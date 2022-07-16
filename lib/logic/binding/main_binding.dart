import 'package:get/instance_manager.dart';
import 'package:raselne/logic/controller/main_controller.dart';
import 'package:raselne/logic/controller/mypage_controller.dart';

import 'package:raselne/logic/controller/types_Controller.dart';

class MainBininding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
    Get.put(TypesController());
    Get.lazyPut(() => MyPageController());
  }
}
