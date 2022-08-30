


import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:raselne/data_layer/model/orderModel.dart';
import 'package:raselne/data_layer/model/store_model.dart';
import 'package:raselne/data_layer/model/user_model.dart';

import '../../data_layer/model/DetailOrder.dart';
import '../repositories/order/order_repo.dart';

class order_vm extends ChangeNotifier{
List<DetailOrder> list_itemorder=[];
late OrderModel order;
List<OrderModel> mylist_order=[];
OrderRepository orderRepository;
order_vm({required this.orderRepository});

// UserModel? currentuser;
// setvalue(UserModel val){
//
//  currentuser=val;
//  print('current '+currentuser!.name.toString());
//  notifyListeners();
// }
 get_item_is_ordered(){
  list_itemorder.forEach((element) {
    if(element.item.isorder==false)
      list_itemorder.remove(element);
  });
  //list_itemorder.removeWhere((element) => element.item.isorder==false);
  print(list_itemorder.length);
  notifyListeners();
 }
addlocation(LatLng location,String Address,String detailAddress){

  order.toLocation=location;
  order.AddresstoLocation=Address;
  order.detailAddress=detailAddress;
  notifyListeners();
}
Future<UserModel> getusercaptain(String uidcaptain)async{
return await orderRepository.getusercaptain(uidcaptain);
}
Stream<List<OrderModel>> get_orders() async* {
  yield* orderRepository.getAllorders();
  notifyListeners();
}

 Stream<OrderModel> get_offer(String id_order)async*{
  //ليظهر العرض من المندوب للمستخدم ليتم قبوله او رفضه
// print(currentuser.name.toString());
print('cxdcdvdf');
 yield*  orderRepository.get_offer(id_order);
}

prepareOrder(StoreModel storeModel,String id ) {
 double total=0;
 list_itemorder.forEach((element) {
  total+=double.parse( element.total_item);
 });

 order=OrderModel(
     total: total, captain_user: null,
     content_order: 'content_order', detailorderList: list_itemorder,
     from_user: id,//currentuser!.uid.toString(),
     // fromlocation: storeModel.location,
     id_order: '',
     is_arrive: false, isdone_recive: false,
     price_deilvery: 'price_deilvery',
     titleStore: storeModel.nameStore,
     // toLocation: currentuser.location,
     storeModel: storeModel, isopen: false, ispause: false, isdone_deilvery: false,
     id_store: storeModel.IdStore.toString(),
       DateTimeorder: null, state: 'create', );
     notifyListeners();
}
bool isloading=false;
Future<void> addOrder() async {
 isloading=true;
 notifyListeners();
 String listdetail='';
 // for(int i=0;i<list_itemorder.length;i++)
 //   list_itemorder=list_itemorder[i].item.description;//+" عدد "+list_itemorder[i].quaintity.toString()+"\n";
 //
 list_itemorder.forEach((element) {
   listdetail+=element.item.description.toString()+" عدد "+element.quaintity.toString()+"\n";
 });
  order.content_order=order.storeModel!.nameStore +"\n"+listdetail;
  order.fromlocation=order.storeModel!.location;
  order.isopen=true;
  order.state='open';
  order.id_order=await orderRepository.AddOrder(order.toSnapchot());
 isloading=false;
 notifyListeners();
}
// Future< void > getoffertouser()async {
//   //
//  await orderRepository.get_offer(order.id_order);
//   notifyListeners();
// }
Future<void> get_myorder(String id)async{
  isloading=true;
  notifyListeners();
  // print('current user is '+currentuser.uid.toString());
  //طلباتي
  mylist_order= await orderRepository
      .getAllorderUser(id
    //currentuser!.uid.toString(),
      // 'uyHNE4qdzlZekuu6R6a4JYgMUTs2'
  );
  isloading=false;
  notifyListeners();
}
 Future<void> update_order(String id_order,String distance_recive_deilvery,
     String price_deilvery_captain,String id ) async {
  //عندما يقدم المندوب على العرض سيتم تحويل قيمة المتحول ispause إلى true
  //وذلك لكي لايظهر الطلب لمندوب آخر
   isloading=true;
   notifyListeners();

   await orderRepository.update_order(
       id_order,
       id, //currentuser!.uid.toString(),
       distance_recive_deilvery,
       price_deilvery_captain);
   isloading=false;
  notifyListeners();
 }
Future<void> approve_order_or_not(String idOrder, bool isopen)async {
  await orderRepository.approve_order_or_not(idOrder, isopen);
}
Stream<OrderModel> check_approve_order(String idorder,String id) async* {
  print(idorder);
  // print(currentuser!.uid.toString());
  yield*  orderRepository.check_approve_order(idorder,
     id// currentuser!.uid.toString()
  );
  // notifyListeners();
}
 DetailOrder? get_obj_detailorder(DetailOrder value){
   int index=list_itemorder.indexWhere((element) => element.item.IdItemStore==value.item.IdItemStore);

   if(index!=-1)
     return list_itemorder[index];
   else null;
 }
  int addto_order (DetailOrder value){
  int index=list_itemorder.indexWhere((element) => element.item.IdItemStore==value.item.IdItemStore);

  if(index==-1)
  {
    list_itemorder.add(value);
    index=list_itemorder.length-1;

  }
  list_itemorder[index].item.isorder=true;
    notifyListeners();

    print( index.toString()+'index');

    return index;

}

 add_quaintity(String IdItemStore) {
  int index=list_itemorder.indexWhere(
          (element) => element.item.IdItemStore==IdItemStore);
  list_itemorder[index].quaintity++;
  double val=double.parse( list_itemorder[index].item.price) * list_itemorder[index].quaintity;
  list_itemorder[index].total_item=val.toString();

  notifyListeners();

 }
 // checkaddtolist(DetailOrder value){
 // int index=list_itemorder.indexWhere((element) => element.item.IdItemStore==value.item.IdItemStore);
 // if(index==-1)
 //  addto_order (value);
 // }
 clear() {
 list_itemorder.clear();

 notifyListeners();
 }
 remove_quaintity(String IdItemStore){

  int index=list_itemorder.indexWhere(
          (element) => element.item.IdItemStore==IdItemStore);
  if(list_itemorder[index].quaintity-1>=1) {
   list_itemorder[index].quaintity--;
   double val= double.parse( list_itemorder[index].item.price) * list_itemorder[index].quaintity;
   list_itemorder[index].total_item =val.toString();

  }
  notifyListeners();
 }



}