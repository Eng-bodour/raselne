class NotificationModel {
  NotificationModel({
    required this.idNotify,
    required this.message,
    required this.fromUser,
    required this.toUser,
    required this.typeNotify,
    required this.isread,
    required this.tonameuser,
    required this.fromNameuser,
    required this.data,
    required this.dateNotify,
  });
  late final String idNotify;
  late final String message;
  late final String fromUser;
  late final String toUser;
  late final String typeNotify;
  late  final String isread;
  late final String tonameuser;
  String? fromNameuser;
  late final String data;
  late  String dateNotify;

  NotificationModel.fromJson(Map<String, dynamic> json){
    idNotify = json['id_notify'];
    message = json['message'];
    fromUser = json['from_user'];
    toUser = json['to_user'];
    typeNotify = json['type_notify'];
    isread = json['isread'];
    tonameuser = json['tonameuser'];
    fromNameuser = json['fromNameuser'];
    data = json['data'];
    dateNotify = json['dateNotify'];
  }

  Map<String, dynamic> toJson()=> {
    // final _data = <String, dynamic>{};
     'id_notify': idNotify,
    'message': message,
    'from_user': fromUser,
    'to_user': toUser,
    'type_notify': typeNotify,
    'isread': isread,
    'tonameuser': tonameuser,
    'fromNameuser': fromNameuser,
    'data':data,
    'dateNotify': dateNotify,
   // return _data;
  };
}