import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:raselne/logic/controller/main_controller.dart';
import 'package:raselne/logic/controller/mypage_controller.dart';
import 'package:raselne/logic/controller/store/category_store_controller.dart';
import 'package:raselne/logic/controller/store/store_controller.dart';
import 'package:raselne/logic/controller/types_Controller.dart';
import 'package:raselne/routes/routes.dart';
import 'logic/controller/auth_controller.dart';

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<AuthProvider>(create: (context) => AuthProvider()),
    ChangeNotifierProvider<CategoryStoreProvider>(
        create: (context) => CategoryStoreProvider()),
    ChangeNotifierProvider<AddStoreProvider>(
        create: (context) => AddStoreProvider()),
    ChangeNotifierProvider<TypesProvider>(create: (context) => TypesProvider()),
    ChangeNotifierProvider<MyPageProvider>(
        create: (context) => MyPageProvider()),
    ChangeNotifierProvider<MainProvider>(create: (context) => MainProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Raselne',
        //home: WelcomeScreen(),

        initialRoute: FirebaseAuth.instance.currentUser != null ||
                GetStorage().read<bool>('auth') == true
            ? AppRoutes.mainScreen
            : AppRoutes.welcome,
        getPages: AppRoutes.routes,
      ),
    );
  }
}
