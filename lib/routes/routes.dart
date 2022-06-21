import 'package:get/get.dart';
import 'package:raselne/logic/binding/auth_biniding.dart';
import 'package:raselne/view/screen/Auth/forgot_password_screen.dart';
import 'package:raselne/view/screen/Auth/login_screen.dart';
import 'package:raselne/view/screen/Auth/phone_screen.dart';
import 'package:raselne/view/screen/Auth/signup_screen.dart';
import 'package:raselne/view/screen/home_screen.dart';
import 'package:raselne/view/screen/welcome_screen.dart';

class AppRoutes {
  //initialRoute

  static const welcome = Routes.welcomeScreen;
  static const homeScreen = Routes.homeScreen;

  //getPages

  static final routes = [
    GetPage(
      name: Routes.welcomeScreen,
      page: () => const WelcomeScreen(),
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
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.phoneScreen,
      page: () => const PhoneScreen(),
      binding: AuthBinding(),
    ),
  ];
}

class Routes {
  static const welcomeScreen = '/welcomeScreen';
  static const loginScreen = '/loginScreen';
  static const signUpScreen = '/signUpScreen';
  static const forgotPasswordScreen = '/forgotPasswordScreen';
  static const homeScreen = '/homeScreen';
  static const phoneScreen = '/phoneScreen';
}
