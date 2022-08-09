import 'package:flutter/cupertino.dart';

import 'package:raselne/view_presentation/screen/home_screen.dart';
import 'package:raselne/view_presentation/screen/my_page/mypage_user_screen.dart';

import 'package:raselne/view_presentation/screen/notification_screen.dart';
import 'package:raselne/view_presentation/screen/orders_screen.dart';

class MainProvider extends ChangeNotifier {
  int currentIndex = 3;
//  final List<StatelessWidget> tabs = [];

  get() => currentIndex;
  void setCurrentIndex(value) {
    currentIndex = value;
    notifyListeners();
  }

  var tabs = [
    MyPageUserScreen(),
    const NotificationScreen(),
    const OrdersScreen(),
    HomeScreen(),
  ];
  var title = [
    "صفحتي",
    "التنبيهات",
    'الطلبات',
    "المتاجر",
  ];
}
