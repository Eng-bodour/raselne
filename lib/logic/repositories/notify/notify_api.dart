


import 'package:raselne/data_layer/model/notifyModel.dart';
import 'package:raselne/logic/notify_vm.dart';

import 'notify_repo.dart';

class notify_api extends NotifyRepository{
  @override
  Future<void> addNotify(Map<String,dynamic> body) {
    // TODO: implement addNotify
    throw UnimplementedError();
  }

  @override
  Future<List<NotificationModel>> getnotify(String uid) {
    // TODO: implement getnotify
    throw UnimplementedError();
  }

  @override
  Future<List<NotificationModel>> setReadNotify(String uid) {
    // TODO: implement setReadNotify
    throw UnimplementedError();
  }


}