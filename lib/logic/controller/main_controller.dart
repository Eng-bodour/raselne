import 'package:get/get.dart';

import 'package:raselne/view_presentation/screen/home_screen.dart';
import 'package:raselne/view_presentation/screen/my_page/mypage_user_screen.dart';

import 'package:raselne/view_presentation/screen/notification_screen.dart';
import 'package:raselne/view_presentation/screen/orders_screen.dart';

class MainController extends GetxController {
  RxInt currentIndex = 3.obs;

  var tabs = [
    MyPageUserScreen(),
    const NotificationScreen(),
    const OrdersScreen(),
    HomeScreen(),

    // CategoryScreen(),
    // FavoritesScreen(),
    // SettingsScreen(),
  ].obs;

  var title = [
    "صفحتي",
    "التنبيهات",
    'الطلبات',
    "المتاجر",
  ].obs;
}
