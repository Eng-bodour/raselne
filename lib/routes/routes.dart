import 'package:get/get.dart';
import 'package:raselne/logic/binding/auth_biniding.dart';
import 'package:raselne/logic/binding/main_binding.dart';

import 'package:raselne/logic/binding/typs_binding.dart';

import 'package:raselne/view_presentation/screen/Auth/forgot_password_screen.dart';
import 'package:raselne/view_presentation/screen/Auth/login_screen.dart';
import 'package:raselne/view_presentation/screen/Auth/phone_screen.dart';
import 'package:raselne/view_presentation/screen/Auth/signup_screen.dart';
import 'package:raselne/view_presentation/screen/home_screen.dart';
import 'package:raselne/view_presentation/screen/main_screen.dart';
import 'package:raselne/view_presentation/screen/new_order_screen.dart';
import 'package:raselne/view_presentation/screen/store%20drawer/add_category_store.dart';
import 'package:raselne/view_presentation/screen/store%20drawer/add_store.dart';

import 'package:raselne/view_presentation/screen/welcome_screen.dart';

import '../logic/orderTrackingPage.dart';

class AppRoutes {
  //initialRoute

  static const welcome = Routes.welcomeScreen;
  //static const homeScreen = Routes.homeScreen;
  static const mainScreen = Routes.mainScreen;
  static const signup = Routes.signUpScreen;
  static const OrdertrackingPage1 = Routes.OrdertrackingPage;

  //getPages

  static final routes = [
    GetPage(
      name: Routes.welcomeScreen,
      page: () => const WelcomeScreen(),
    ),
    GetPage(
      name: Routes.OrdertrackingPage,
      page: () =>   OrdertrackingPage(idorder: '',),
    ),
    GetPage(
      name: Routes.loginScreen,
      page: () => LoginScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.signUpScreen,
      page: () => SignUpScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.forgotPasswordScreen,
      page: () => ForgotPasswordScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.homeScreen,
      page: () => HomeScreen(),
      bindings: [AuthBinding(), TypesBinding()],
    ),
    GetPage(
      name: Routes.phoneScreen,
      page: () => const PhoneScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.mainScreen,
      page: () => const MainScreen(),
      bindings: [
        MainBininding(),
      ],
    ),
    // GetPage(
    //   name: Routes.newOrderScreen,
    //   page: () => NewOrderScreen(),
    // ),
    // GetPage(
    //   name: Routes.addStore,
    //   page: () =>  AddStore(type: '',),
    // ),
    // GetPage(
    //   name: Routes.addCategory,
    //   page: () =>  AddCategory(),
    // ),

    // GetPage(
    //     name: Routes.imageSliderScreen, page: () => const ImageSliderScreen())
  ];
}

class Routes {
  static const welcomeScreen = '/welcomeScreen';
  static const loginScreen = '/loginScreen';
  static const signUpScreen = '/signUpScreen';
  static const forgotPasswordScreen = '/forgotPasswordScreen';
  static const homeScreen = '/homeScreen';
  static const phoneScreen = '/phoneScreen';
  static const mainScreen = '/mainScreen';
  static const newOrderScreen = '/newOrderScreen';
  static const addStore = '/addStore';
  static const addCategory = '/addCategory';
  static const OrdertrackingPage = '/OrdertrackingPage';
}
