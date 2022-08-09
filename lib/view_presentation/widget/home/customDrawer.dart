import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:raselne/data_layer/model/user_model.dart';
import 'package:raselne/data_layer/webServices/firebase.dart';
import 'package:raselne/logic/controller/firebase_provider.dart';

import 'dart:io';

import 'package:raselne/utilis/theme.dart';
import 'package:raselne/view_presentation/screen/chat/chat_screen.dart';
import 'package:raselne/view_presentation/screen/store%20drawer/add_category_store.dart';
import 'package:raselne/view_presentation/widget/setting/add_category_wedgit.dart';
import 'package:raselne/view_presentation/widget/setting/add_store_widget.dart';
import 'package:raselne/view_presentation/widget/mypage/logout_widget.dart';
import 'package:raselne/view_presentation/widget/setting/chat_widget.dart';
import 'package:raselne/view_presentation/widget/setting/driver.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({Key? key}) : super(key: key);
  final controllrFirebase = Get.put(FirebaseProvider());

  @override
  Widget build(BuildContext context) {
    // var controllerUsers= Provider.of<user_vm_provider>(context,listen: true);

    return Drawer(
      child: Container(
          color: Colors.white,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountEmail: const Text(
                    '' //controllerUsers.currentUser!.email.toString(),
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
                      children: const <Widget>[
                        Text(
                          'Name User', //'${Firebase.name}',
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
                          '@User',
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

              AddStoreWidget(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              AddCategoryWidget(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              chatWidget(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Driver()

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
