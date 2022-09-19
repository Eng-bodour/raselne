
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:raselne/data_layer/model/store_model.dart';
import 'package:raselne/data_layer/model/user_model.dart';

import 'DetailOrder.dart';
import 'package:location/location.dart';
class OrderModel {

late UserModel user_captain=UserModel(
    location: LatLng(14,50), uid: 'uid', name: 'name',
    email: 'email', mobile: 'mobile', dateCreated: '', type: '');

late UserModel user;//المستخدم الذي طلب اوردر
late Stream<UserModel> usertest;//المستخدم الذي طلب اوردر
// late String id_itemstore='';
 late String id_store='';
late String id_order='';
bool isdone_deilvery=false;//هل تم التوصيل
bool isdone_recive=false;//هل تم الاستلام
bool isopen=false;//هل الطلب مازال مفتوح او متاح للمندوبين
bool ispause=false;//ألطلب مفتوح ولكن قيد التفاوض مع المندوب
bool isapprove=false;
String detailAddress='';
String detailorder='';
String distance_me_recive='';
String distance_recive_deilvery='';
late String from_user='';
late String? captain_user='';
late LatLng fromlocation;
late String Addressdfromlocation='';
late LatLng toLocation=LatLng(30,20);
late String AddresstoLocation='';
String price_deilvery='0';
String price_deilvery_captain='0';//السعر الذي قام بوضعه المندوب
double total=0;
String cost_purchases='';
String? DateTimeorder=null;
bool is_arrive=false;//t
List<DetailOrder> detailorderList=[];//
String titleStore='';
String content_order='';// محتويات المنتج الذي طلبه العميل
StoreModel? storeModel;
String state='';
bool isclose=false;
bool isstart=false;
bool iscancel=false;//ملغى

OrderModel({required this.total,required this.id_store,
  required this.captain_user,required this.content_order,
 required this.detailorderList,required this.from_user,
    // required this.fromlocation,
  price_deilvery_captain,
  required this.id_order,distance_recive_deilvery,
  required this.is_arrive,required this.isdone_recive,
  required this.isdone_deilvery,required this.isopen,
  required this.ispause,
  required this.price_deilvery,
 required this.titleStore,
  this.storeModel,required this.state,
  required this.DateTimeorder,
  //required this.toLocation
});
Map<String, dynamic> toSnapchot() => {
  "total": total,
  "captain_user": captain_user,
  "content_order": content_order,
  "distance_recive_deilvery": distance_recive_deilvery,
  "price_deilvery_captain": price_deilvery_captain,

  // "content_order": content_order,
  "state":state,
  "from_user": from_user,
  "fromlocation":GeoPoint(
      fromlocation.latitude,
      fromlocation.longitude) ,//fromlocation,
  "is_arrive": is_arrive,
  "isdone_recive": isdone_recive,
  "isdone_deilvery": isdone_deilvery,
  "isopen":isopen,
  "isapprove":isapprove,
  "ispause":ispause,
  "price_deilvery":price_deilvery,
  "titleStore":titleStore,
  "toLocation":GeoPoint(toLocation.latitude,toLocation.longitude) ,
  "idStore":id_store,
  "DateTimeorder":DateTimeorder,
};
 factory OrderModel.fromSnapshot(Map<String,dynamic> doc,String id) {

     OrderModel order= OrderModel(
       total:doc["total"],
       // fromlocation:doc["total"],
       distance_recive_deilvery:doc["distance_recive_deilvery"],
       price_deilvery_captain:doc["price_deilvery_captain"],
       captain_user:doc["captain_user"],
       content_order:doc["content_order"],
       from_user:doc["from_user"],
       // fromlocation:LatLng(gloacationfrom.latitude,gloacationfrom.longitude),
       //LatLng(doc["fromlocation"]
       //:GeoPoint(toLocation.latitude,toLocation.longitude) ,//fromlocation,
       is_arrive:doc["is_arrive"],//وصل لموقع العميل
       isdone_recive:doc["isdone_recive"],//تم استلام الطلب

       isdone_deilvery:doc["isdone_deilvery"],//تم التسليم
     isopen:doc["isopen"],
     ispause:doc["ispause"],
     price_deilvery:doc["price_deilvery"],
     titleStore:doc["titleStore"],
     // toLocation:doc["toLocation"],//:GeoPoint(toLocation.latitude,toLocation.longitude) ,
     id_store:doc["idStore"],
     DateTimeorder:doc["DateTimeorder"],
     id_order: id, storeModel: null,
     detailorderList: [],
       state:  doc['state']==null?'':doc['state'],
   );
     // order.user_captain=
     //calcDistance(List<LatLng> polylineCoordinates)
  order.isstart=doc['isstart']==null?false:doc['isstart'];
  order.isapprove=doc['isapprove'];
   GeoPoint gloacationfrom=doc["fromlocation"];
   order.fromlocation=LatLng(gloacationfrom.latitude,gloacationfrom.longitude);
   gloacationfrom=doc["toLocation"];
   order.toLocation=LatLng(gloacationfrom.latitude,gloacationfrom.longitude);
       print('content : '+order.content_order);
     return order;
 }


}