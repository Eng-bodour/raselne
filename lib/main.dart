import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:raselne/routes/routes.dart';

import 'package:get/get.dart';

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
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
            ? AppRoutes.homeScreen
            : AppRoutes.welcome,
        getPages: AppRoutes.routes,
      ),
    );
  }
}
