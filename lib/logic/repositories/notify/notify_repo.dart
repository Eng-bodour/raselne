

import 'package:raselne/data_layer/model/notifyModel.dart';

abstract class NotifyRepository {

 Future<void> addNotify(Map<String,dynamic> body);
 Future<List<NotificationModel>> setReadNotify(String uid);
 Future<List<NotificationModel>> getnotify(String uid);

}