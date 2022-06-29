import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'dart:io';

import 'package:raselne/utilis/theme.dart';
import 'package:raselne/view/widget/setting/logout_widget.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);
  //final controllerUsers = Get.find<AllUserVMController>();

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
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        Text(
                          'Bodour Majadmi',
                          style: TextStyle(color: Colors.black),
                        ),
                        Text(
                          '@User',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              LogOutWidget(),
              
            ],
          )),
    );
  }
}
