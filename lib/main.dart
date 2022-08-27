import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:raselne/logic/controller/main_controller.dart';
import 'package:raselne/logic/controller/mypage_controller.dart';
import 'package:raselne/logic/controller/order_vm.dart';
import 'package:raselne/logic/controller/store/category_store_controller.dart';
import 'package:raselne/logic/controller/store/store_controller.dart';
import 'package:raselne/logic/controller/types_Controller.dart';
import 'package:raselne/logic/repositories/order/order_firebase.dart';
import 'package:raselne/routes/routes.dart';
import 'logic/controller/auth_controller.dart';
import 'logic/repositories/store/store_firebase.dart';
import 'logic/repositories/users/user_firebase.dart';

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(providers: [

    ChangeNotifierProvider<AuthProvider_vm>(create: (context) =>
        AuthProvider_vm(userRepository: user_firebase())),

    ChangeNotifierProxyProvider<AuthProvider_vm,order_vm>(
      create: (_)=> order_vm(orderRepository: order_firebase()),
      update: (ctx,value,prev)=>prev!..setvalue(value.currentuser),
    ),
    ChangeNotifierProvider<CategoryStoreProvider>(
        create: (context) => CategoryStoreProvider()),

    ChangeNotifierProvider<StoreProvider_vm>(
        create: (context) => StoreProvider_vm(storeRepository: StoreFirebase())),

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
            : AppRoutes.mainScreen,
        getPages: AppRoutes.routes,
      ),
    );
  }
}
