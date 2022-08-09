import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:raselne/data_layer/webServices/types_services.dart';
import 'package:raselne/data_layer/model/typs_model.dart';

class TypesProvider extends ChangeNotifier {
  var docTyps = <TypsModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    getTyps();
  }

  void getTyps() async {
    var types = await TypesServices.getTypes('types');
    try {
      isLoading(true);
      if (types.isNotEmpty) {
        docTyps.addAll(types);
      }
    } finally {
      isLoading(false);
    }
  }
}
