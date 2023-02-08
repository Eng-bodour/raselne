


import 'package:get/get.dart';

import '../data_layer/model/orderModel.dart';
import '../view_presentation/screen/chat/chat_screen.dart';

route_notifyto(String type,String data){
  OrderModel orderModel;
  switch(type) {
    case 'order':
      orderModel=OrderModel(
          total:9 , id_store: 'id_store',
          captain_user: 'captain_user', content_order: 'content_order',
          detailorderList: [],
          from_user: '', id_order: data,
          is_arrive:false, isdone_recive: false,
          isdone_deilvery: false, isopen: true,
          ispause: true, price_deilvery: 'price_deilvery',
          titleStore: 'titleStore',
          state: 'state', DateTimeorder: 'DateTimeorder', type_order: '');
      Get.to(ChatScreen(orderModel: orderModel,));
      break;

  }

}
String getstate_order(String state){

  switch (state) {
    case 'open':
      return 'مفتوح';

    case 'approve':
      return 'مفتوح';

    case 'isclose':

      return 'مفلق';

    case 'iscancel':

      return 'ملغى';
  case 'done rate':

      return 'مغلق';

    case 'is_arrive':
      return 'قيد التوصيل';

    default :
      return '';
  }}