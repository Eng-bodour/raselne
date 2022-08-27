
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:raselne/data_layer/model/store_model.dart';
import 'package:raselne/data_layer/model/user_model.dart';

import 'DetailOrder.dart';
import 'package:location/location.dart';
class OrderModel {

late UserModel user_captain=UserModel(
    location: LatLng(14,50), uid: 'uid', name: 'name',
    email: 'email', mobile: 'mobile', dateCreated: '');
late UserModel user;//المستخدم الذي طلب اوردر
// late String id_itemstore='';
 late String id_store='';
late String id_order='';
bool isdone_deilvery=false;//هل تم التوصيل
bool isdone_recive=false;//هل تم الاستلام
bool isopen=false;//هل الطلب مازال مفتوح او متاح للمندوبين
bool ispause=false;//ألطلب مفتوح ولكن قيد التفاوض مع المندوب
String detailAddress='';
String detailorder='';
String distance_me_recive='';
String distance_recive_deilvery='';
late String from_user='';
late String? captain_user='';
late LatLng fromlocation;
late String Addressfromlocation='';
late LatLng toLocation;
late String AddresstoLocation='';
String price_deilvery='';
String price_deilvery_captain='';//السعر الذي قام بوضعه المندوب
double total=0;
String? DateTimeorder=null;
bool is_arrive=false;//
List<DetailOrder> detailorderList=[];//
String titleStore='';
String content_order='';// محتويات المنتج الذي طلبه العميل
StoreModel? storeModel;

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
  this.storeModel,
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

  "from_user": from_user,
  "fromlocation":GeoPoint(toLocation.latitude,toLocation.longitude) ,//fromlocation,
  "is_arrive": is_arrive,
  "isdone_recive": isdone_recive,
  "isdone_deilvery": isdone_deilvery,
  "isopen":isopen,
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
       // fromlocation:GeoPoint(doc["fromlocation"]),
       //LatLng(doc["fromlocation"],
       //:GeoPoint(toLocation.latitude,toLocation.longitude) ,//fromlocation,
       is_arrive:doc["is_arrive"],
       isdone_recive:doc["isdone_recive"],
       isdone_deilvery:doc["isdone_deilvery"],
       isopen:doc["isopen"],
       ispause:doc["ispause"],
       price_deilvery:doc["price_deilvery"],
       titleStore:doc["titleStore"],
       // toLocation:doc["toLocation"],//:GeoPoint(toLocation.latitude,toLocation.longitude) ,
     id_store:doc["idStore"],
     DateTimeorder:doc["DateTimeorder"],
     id_order: id, storeModel: null,
     detailorderList: [],
   );
     // order.user_captain=
     //calcDistance(List<LatLng> polylineCoordinates)
       print('content : '+order.content_order);
     return order;
 }


}