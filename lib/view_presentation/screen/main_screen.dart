import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:raselne/data_layer/webServices/firebase.dart';
import 'package:raselne/logic/controller/auth_controller.dart';
import 'package:raselne/logic/controller/main_controller.dart';
import 'package:raselne/utilis/theme.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState()  {


    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Provider.of<AuthProvider_vm>(context,listen: false)
          .getuser_vm();
     });
    // FirebaseServices.name;
    // FirebaseServices().getNameuser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var mainProvider = Provider.of<MainProvider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white, //context.theme.backgroundColor,

        bottomNavigationBar: BottomNavigationBar(
          unselectedLabelStyle: const TextStyle(color: Colors.black),
          selectedItemColor: mainColor,
          backgroundColor:
              Colors.white, //Get.isDarkMode ? darkGreyClr : Colors.white,
          currentIndex: mainProvider.get(),
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.person,
                  color: mainColor //Get.isDarkMode ? pinkClr : mainColor,
                  ),
              icon: Icon(
                Icons.person,
                color: Colors
                    .black, //Get.isDarkMode ? Colors.white : Colors.black,
              ),
              label: 'صفحتي',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.notification_important,
                  color: mainColor //Get.isDarkMode ? pinkClr : mainColor,
                  ),
              icon: Icon(
                Icons.notification_important,
                color: Colors
                    .black, //Get.isDarkMode ? Colors.white : Colors.black,
              ),
              label: 'التنبيهات',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.car_rental_sharp,
                  color: mainColor //Get.isDarkMode ? pinkClr : mainColor,
                  ),
              icon: Icon(
                Icons.car_rental_sharp,
                color: Colors
                    .black, //Get.isDarkMode ? Colors.white : Colors.black,
              ),
              label: 'الطلبات',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.shopping_bag,
                  color: mainColor //Get.isDarkMode ? pinkClr : mainColor,
                  ),
              icon: Icon(Icons.shopping_bag,
                  color: Colors
                      .black //Get.isDarkMode ? Colors.white : Colors.black,
                  ),
              label: 'المتاجر',
            ),
          ],
          onTap: (index) {
            mainProvider.setCurrentIndex(index);
          },
        ),
        body: IndexedStack(
          index: mainProvider.get(),
          children: mainProvider.tabs,
        ),
      ),
      //  Obx(
      //   () {
      //     return Scaffold(
      //       backgroundColor: Colors.white, //context.theme.backgroundColor,

      //       bottomNavigationBar: BottomNavigationBar(
      //         unselectedLabelStyle: const TextStyle(color: Colors.black),
      //         selectedItemColor: mainColor,
      //         backgroundColor:
      //             Colors.white, //Get.isDarkMode ? darkGreyClr : Colors.white,
      //         currentIndex: controller.currentIndex.value,
      //         type: BottomNavigationBarType.fixed,
      //         items: const [
      //           BottomNavigationBarItem(
      //             activeIcon: Icon(Icons.person,
      //                 color: mainColor //Get.isDarkMode ? pinkClr : mainColor,
      //                 ),
      //             icon: Icon(
      //               Icons.person,
      //               color: Colors
      //                   .black, //Get.isDarkMode ? Colors.white : Colors.black,
      //             ),
      //             label: 'صفحتي',
      //           ),
      //           BottomNavigationBarItem(
      //             activeIcon: Icon(Icons.notification_important,
      //                 color: mainColor //Get.isDarkMode ? pinkClr : mainColor,
      //                 ),
      //             icon: Icon(
      //               Icons.notification_important,
      //               color: Colors
      //                   .black, //Get.isDarkMode ? Colors.white : Colors.black,
      //             ),
      //             label: 'التنبيهات',
      //           ),
      //           BottomNavigationBarItem(
      //             activeIcon: Icon(Icons.car_rental_sharp,
      //                 color: mainColor //Get.isDarkMode ? pinkClr : mainColor,
      //                 ),
      //             icon: Icon(
      //               Icons.car_rental_sharp,
      //               color: Colors
      //                   .black, //Get.isDarkMode ? Colors.white : Colors.black,
      //             ),
      //             label: 'الطلبات',
      //           ),
      //           BottomNavigationBarItem(
      //             activeIcon: Icon(Icons.shopping_bag,
      //                 color: mainColor //Get.isDarkMode ? pinkClr : mainColor,
      //                 ),
      //             icon: Icon(Icons.shopping_bag,
      //                 color: Colors
      //                     .black //Get.isDarkMode ? Colors.white : Colors.black,
      //                 ),
      //             label: 'المتاجر',
      //           ),
      //         ],
      //         onTap: (index) {
      //           controller.currentIndex.value = index;
      //         },
      //       ),
      //       body: IndexedStack(
      //         index: controller.currentIndex.value,
      //         children: controller.tabs,
      //       ),
      //     );
      //   },
      // ),
    );
  }
}
