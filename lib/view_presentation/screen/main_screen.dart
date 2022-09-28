import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:provider/provider.dart';
import 'package:raselne/data_layer/webServices/firebase.dart';
import 'package:raselne/logic/controller/auth_controller.dart';
import 'package:raselne/logic/controller/main_controller.dart';
import 'package:raselne/logic/controller/order_vm.dart';
import 'package:raselne/utilis/theme.dart';
import 'package:raselne/view_presentation/screen/orders_screen.dart';

import 'custom_new_order.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      await Provider.of<AuthProvider_vm>(context, listen: false).getuser_vm();
    });
    // FirebaseServices.name;
    // FirebaseServices().getNameuser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var mainProvider = Provider.of<MainProvider>(context, listen: true);
    return Scaffold(
      backgroundColor: Colors.white, //context.theme.backgroundColor,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: SizedBox(
          height: size.height * 0.1,
          width: size.width * 0.2,
          child: FloatingActionButton(
            backgroundColor: Colors.transparent,
            elevation: 0,
            onPressed: () {
              // Provider.of<order_vm>(context,listen: false)
              // .se
              Provider.of<order_vm>
                (context, listen: false)
                  .prepareCustomOrder();
              Get.to(Custom_order());
              // when click this button
            },
            child: Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 4),
                shape: BoxShape.circle,
                gradient: const LinearGradient(
                  begin: Alignment(0.7, -0.5),
                  end: Alignment(0.6, 0.5),
                  colors: [
                    Color.fromRGBO(230, 120, 23, 100),
                    Color.fromRGBO(218, 37, 28, 100)
                  ],
                ),
              ),
              child: Icon(Icons.fastfood_rounded, size: size.width * 0.1),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation:
      FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        unselectedLabelStyle: const TextStyle(color: Colors.black),
        selectedItemColor: mainColor,
        backgroundColor:
        Colors.white, //Get.isDarkMode ? darkGreyClr : Colors.white,
        currentIndex: mainProvider.get(),
        type: BottomNavigationBarType.fixed,
        items: [
          const BottomNavigationBarItem(
            activeIcon: Icon(Icons.person,
                color: mainColor //Get.isDarkMode ? pinkClr : mainColor,
            ),
            icon: Icon(
              Icons.person,
              color:
              Colors.black, //Get.isDarkMode ? Colors.white : Colors.black,
            ),
            label: 'صفحتي',
          ),
          const BottomNavigationBarItem(
            activeIcon: Icon(Icons.notification_important,
                color: mainColor //Get.isDarkMode ? pinkClr : mainColor,
            ),
            icon: Icon(
              Icons.notification_important,
              color:
              Colors.black, //Get.isDarkMode ? Colors.white : Colors.black,
            ),
            label: 'التنبيهات',
          ),
          const BottomNavigationBarItem(
            activeIcon: Icon(Icons.car_rental_sharp,
                color: mainColor //Get.isDarkMode ? pinkClr : mainColor,
            ),
            icon: Icon(
              Icons.car_rental_sharp,
              color:
              Colors.black, //Get.isDarkMode ? Colors.white : Colors.black,
            ),
            label: 'الطلبات',
          ),
          BottomNavigationBarItem(
            activeIcon: const Icon(Icons.shopping_bag,
                color: mainColor //Get.isDarkMode ? pinkClr : mainColor,
            ),
            icon: const Icon(Icons.shopping_bag,
                color:
                Colors.black //Get.isDarkMode ? Colors.white : Colors.black,
            ),
            label: Provider.of<AuthProvider_vm>(context, listen: false)
                .currentuser
                .type ==
                'captain'
                ? 'الرئيسية'
                : 'المتاجر',
          ),
        ],
        onTap: (index) {
          mainProvider.setCurrentIndex(index);
        },
      ),
      body: IndexedStack(
        index: mainProvider.get(),
        children: Provider.of<AuthProvider_vm>(context, listen: false)
            .currentuser
            .type ==
            'captain'
            ? mainProvider.tabscaptain
            : mainProvider.tabs,
      ),
    );
  }
}

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, 20); // Start
    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
    path.arcToPoint(Offset(size.width * 0.60, 20),
        radius: const Radius.circular(20.0), clockwise: false);
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 20);
    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}