import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:raselne/data_layer/model/user_model.dart';
import 'package:raselne/logic/controller/auth_controller.dart';

import 'package:raselne/logic/controller/firebase_provider.dart';

import 'package:raselne/utilis/theme.dart';
import 'package:raselne/view_presentation/screen_driver/orders_driver_screen.dart';

import 'package:raselne/view_presentation/widget/setting/add_category_wedgit.dart';
import 'package:raselne/view_presentation/widget/setting/add_store_widget.dart';

import 'package:raselne/view_presentation/widget/setting/chat_widget.dart';
import 'package:raselne/view_presentation/widget/setting/driver.dart';
import 'package:raselne/view_presentation/screen_driver/home_driver_screen.dart';

import '../text_utilis.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({Key? key}) : super(key: key);
  // final controllrFirebase = Get.put(FirebaseProvider());
  late UserModel current;
  @override
  Widget build(BuildContext context) {
    current= Provider.of<AuthProvider_vm>(context,listen: true).currentuser;

    return Drawer(
      child: Container(
          color: Colors.white,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountEmail:  Text(
                    current.email,// '' //controllerUsers.currentUser!.email.toString(),
                ),
                // currentAccountPicture: const Text(''),
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2) //Color(0xFF56ccf2),
                ),
                accountName: Row(
                  children: <Widget>[
                    Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(shape: BoxShape.circle),
                      child: const CircleAvatar(
                        radius: 8,
                        backgroundColor: mainColor,
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    // Obx(() {
                    //   return Column(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     children: <Widget>[
                    //       Text(
                    //         'hi :${controllrFirebase.name}',
                    //         style: const TextStyle(color: Colors.black),
                    //       ),
                    //       // GetBuilder<firebaseController>(
                    //       //   builder: (controller) {
                    //       //     print('hi : ${controller.name}');
                    //       //     return Text(
                    //       //       controller.name.toString(),
                    //       //       style: const TextStyle(color: Colors.black),
                    //       //     );
                    //       //   },
                    //       // ),
                    //       const Text(
                    //         '@User',
                    //         style: TextStyle(color: Colors.black),
                    //       ),
                    //     ],
                    //   );
                    // }),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  <Widget>[
                        Text(
                             current.name.toString(),
                          //  'Name User', //'${Firebase.name}',
                          style: TextStyle(color: Colors.black),
                        ),
                        // GetBuilder<firebaseController>(
                        //   builder: (controller) {
                        //     print('hi : ${controller.name}');
                        //     return Text(
                        //       controller.name.toString(),
                        //       style: const TextStyle(color: Colors.black),
                        //     );
                        //   },
                        // ),
                        Text(
                            current.email.toString(),//  '@User',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              //LogOutWidget(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              // TextButton(
              //   onPressed: () {
              //     Get.to(const AddCategory());
              //   },
              //   child: const Text('Add category'),
              // ),

              const AddStoreWidget(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              const AddCategoryWidget(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              const chatWidget(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              const Driver(),
              TextButton(
                  onPressed: () {
                    Get.to(const HomeDriverScreen());
                  },
                  child: const Text('home driver')),
              TextButton(
                  onPressed: () {
                    Get.to( OrdersDriverScreen());
                  },
                  child: const Text('ordersDrivers')),
              TextButton(
                  onPressed: () {},
                  child: const Text('show Dialoge for wait accept captain '))

              // TextButton(
              //     onPressed: () {
              //       Firebase().getuser();
              //     },
              //     child: const Text('tests'))
            ],
          )),
    );
  }
}