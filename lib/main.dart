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
import 'package:raselne/view_presentation/screen/main_screen.dart';
import 'package:raselne/view_presentation/screen/welcome_screen.dart';
import 'data_layer/model/user_model.dart';
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

    // ChangeNotifierProvider<order_vm>(
    //     create: (context) => order_vm(orderRepository: order_firebase())),
    //
    ChangeNotifierProvider<CategoryStoreProvider>(
        create: (context) => CategoryStoreProvider()),

    ChangeNotifierProvider<StoreProvider_vm>(
        create: (context) => StoreProvider_vm(storeRepository: StoreFirebase())),

    ChangeNotifierProvider<TypesProvider>(create: (context) => TypesProvider()),

    ChangeNotifierProvider<MyPageProvider>(
        create: (context) => MyPageProvider()),
    ChangeNotifierProvider<MainProvider>(create: (context) => MainProvider()),
  ], child:  MyApp()));
}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child:FutureBuilder<UserModel?>(
          future: Provider.of<AuthProvider_vm>(context)
              .isAuthuser() ,
          builder:(context, snapshot) {
            print('in main builder');
            if (!snapshot.hasData) {
              print(snapshot.hasData);
              //Center(child: CircularProgressIndicator(),)
              return MaterialApp(
                home: Scaffold(
                  body: Center(
                    child: Text('Loading....'),
                  ),
                ),
              );
            }
            else {
              return
                GetMaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'Raselne',
                  //home: WelcomeScreen(),
                  initialRoute: snapshot.data?.uid !=null
                      ? AppRoutes.mainScreen
                      : AppRoutes.welcome,
                  getPages: AppRoutes.routes,
                );
                // MaterialApp(
                //   home: Directionality(
                //     textDirection: TextDirection.rtl,
                //     child: snapshot.data?.uid !=null ? MainScreen() : WelcomeScreen(),
                //   ),
                // )
              //       StreamBuilder(
              //         stream: Provider.of<order_vm>(context).getchat(widget.orderModel.id_order),
              //         builder: (BuildContext context,
              //             AsyncSnapshot<List<MessageText>> snapshot)
              //         {
              //           if(snapshot.hasError) {
              //             return Text('something went wrong' + snapshot.error
              //                 .toString());
              //           }
              //           if(!snapshot.hasData){
              //             return Text("Loading");
              //           }
              //           return
              //            ListView.builder(
              //         //to reverse message
              //         reverse: true,
              //           padding: EdgeInsets.only(top: size.height * 0.02),
              //           itemCount: 3,
              //           itemBuilder: (BuildContext context, int index) {
              //             // final MessageText message = messages[index];
              //             bool isMe = snapshot.data![index].senderId ==user.uid;
              //             return _buildMessage( snapshot.data![index], isMe, size);
              //           },
              //         )
              //         },
              //       ),
              //),
              // ),
              // user.type=='captain'?
              // InkWell(
              //   onTap: () {
              //     // widget.orderModel.isstart
              //   },
              //   child: Container(
              //     width: size.width * 1,
              //     height: size.height * 0.1,
              //     decoration: const BoxDecoration(color: greyColor),
              //     child: Center(
              //         child: TextUtils(
              //             fontSize: size.width * 0.05,
              //             fontWeight: FontWeight.bold,
              //             text: 'اصدار فاتورة',
              //             // widget.orderModel.isstart? 'اصدار فاتورة':
              //             // widget.orderModel.isdone_recive?'استلمت الطلب':'',
              //             color: Colors.white,
              //             underLine: TextDecoration.none)),
              //   ),
              // ):Container(),
             }
          }),
      // GetMaterialApp(
      //   debugShowCheckedModeBanner: false,
      //   title: 'Raselne',
      //   //home: WelcomeScreen(),
      //
      //   initialRoute: FirebaseAuth.instance.currentUser != null ||
      //           GetStorage().read<bool>('auth') == true
      //       ? AppRoutes.mainScreen
      //       : AppRoutes.welcome,
      //   getPages: AppRoutes.routes,
      // ),
    );
  }
}
