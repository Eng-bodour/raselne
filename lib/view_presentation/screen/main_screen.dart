import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:provider/provider.dart';
import 'package:raselne/data_layer/webServices/firebase.dart';
import 'package:raselne/logic/controller/auth_controller.dart';
import 'package:raselne/logic/controller/main_controller.dart';
import 'package:raselne/logic/controller/order_vm.dart';
import 'package:raselne/utilis/theme.dart';
import 'package:raselne/view_presentation/screen/orders_screen.dart';

import '../../logic/controller/notify_vm.dart';
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
    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) {
      if (message != null) {
        print("in init getInitialMessage");
        //Provider.of<notifyvm>(context,listen: false).addcounter();
        // String typeNotify= message.data['Typenotify'];
        // String data_notify= message.data['Typenotify'];
        // route_notifyto(typeNotify,context,message.data,null);
      }
    });
    //FirebaseMessaging.onBackgroundMessage.call(message);
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      // try{
      // print('Got a message whilst in the foreground!');
      // print('Message data: ${message.data['idclient']}');

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
      }
      //Provider.of<notifyvm>(context,listen: false).getcounter();
      //if(message.data['data'])
      Provider.of<notifyvm>(context,listen: false).addcounter();
      // } catch(e){}
      //add notify to listnotify
    });
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      print('onMessageOpenedApp');
      Provider.of<notifyvm>(context,listen: false).addcounter();
      // Provider.of<notifyvm>(context,listen: false).getcounter();
      // String typeNotify= event.data['Typenotify'];
      // route_notifyto(typeNotify,context,event.data,null);
    });

  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var mainProvider = Provider.of<MainProvider>(context, listen: true);
    return Scaffold(
      backgroundColor: Colors.white, //context.theme.backgroundColor,
      floatingActionButton:
      Provider.of<AuthProvider_vm>(context, listen: true)
          .currentuser.type=='user'?
      Padding(
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
      ):Container(),
      floatingActionButtonLocation:
      Provider.of<AuthProvider_vm>(context, listen: true).currentuser.type=='user'?
      FloatingActionButtonLocation.centerDocked:null,
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