import 'package:get/get.dart';
import 'package:raselne/logic/controller/add_controller.dart';
import 'package:raselne/logic/controller/types_Controller.dart';
import 'package:get/instance_manager.dart';

class TypesBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(TypesController());
    Get.put(AddController());
  }
}
