import 'package:flutter/cupertino.dart';

import 'package:raselne/view_presentation/screen/home_screen.dart';
import 'package:raselne/view_presentation/screen/my_page/mypage_user_screen.dart';

import 'package:raselne/view_presentation/screen/notification_screen.dart';
import 'package:raselne/view_presentation/screen/orders_screen.dart';

import '../../data_layer/model/user_model.dart';
import '../../view_presentation/screen_driver/home_driver_screen.dart';
import '../../view_presentation/screen_driver/my_page_driver/mypage_driver_screen.dart';
import '../../view_presentation/screen_driver/orders_driver_screen.dart';
import '../orderTrackingPage.dart';

class MainProvider extends ChangeNotifier {
  int currentIndex = 3;
//  final List<StatelessWidget> tabs = [];
  UserModel currentuser = UserModel(
      location: null,
      name: '',
      email: '',
      dateCreated: '',
      mobile: '',
      type: '',
      uid: '',
      Id_number: '',
      num_car: '',
      num_travel: 0,
      type_car: '', rataing: 0.0);
  setvalue(UserModel val) {
    currentuser = val;
    print('current ' + currentuser.name.toString());
    notifyListeners();
  }

  get() => currentIndex;
  void setCurrentIndex(value) {
    currentIndex = value;
    notifyListeners();
  }

  var tabs = [

    MyPageDriverScreen(),

    const NotificationScreen(),
    const OrdersScreen(),
    HomeScreen(),
  ];

  var tabscaptain = [

    MyPageDriverScreen(),
    const NotificationScreen(),
    OrdersDriverScreen(),
    OrdertrackingPage(idorder: '3A30MVhcYVvLm9DmMPPS'),

    // const HomeDriverScreen(),
  ];

  var title = [
    "صفحتي",
    "التنبيهات",
    'الطلبات',
    "المتاجر",
  ];
}
