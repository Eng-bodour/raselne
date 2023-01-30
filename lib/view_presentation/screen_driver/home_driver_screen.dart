import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';
import 'package:raselne/data_layer/model/orderModel.dart';
import 'package:raselne/logic/controller/order_vm.dart';

import 'package:raselne/view_presentation/widget/text_utilis.dart';
import 'package:raselne/view_presentation/widget_driver/home_driver/buildCardDeleveryDrive.dart';

import '../../logic/controller/auth_controller.dart';
import '../../services/location_services.dart';

class HomeDriverScreen extends StatefulWidget {
  const HomeDriverScreen({Key? key}) : super(key: key);

  @override
  State<HomeDriverScreen> createState() => _HomeDriverScreenState();
}

class _HomeDriverScreenState extends State<HomeDriverScreen> {
  @override void initState() {
    // TODO: implement initState
  WidgetsBinding.instance.addPostFrameCallback((_) async {
    LocationData _myLocation = await LocationService().getLocation();
     LatLng(_myLocation.latitude!, _myLocation.longitude!);
    Provider.of<AuthProvider_vm>(context, listen: false)
        .updatelocation( LatLng(_myLocation.latitude!, _myLocation.longitude!));
  });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // var numOrder = 3;
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black87,
        title: const Text(
          'طلبات التوصيل',
          style: TextStyle(color: Colors.black87),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
      ),
      backgroundColor: Colors.grey.shade200,
      body: SingleChildScrollView(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              StreamBuilder(
                stream: Provider.of<order_vm>(context)
                    .get_orders(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<OrderModel>>
                    snapshot) {
               if(snapshot.hasError){
                 return Text('something went wrong'+snapshot.error.toString());
               }
               if(!snapshot.hasData){
                 return Center(child: Text("Loading"));
               }
                return

                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            right: size.width * 0.03,
                            top: size.height * 0.02,
                            bottom: size.height * 0.01),
                        child: TextUtils(
                            fontSize: size.width * 0.05,
                            fontWeight: FontWeight.bold,
                            text: '${snapshot.data!.length}     طلبات (جميع الخدمات)',
                            color: Colors.black54,
                            underLine: TextDecoration.none),
                      ),
                      ListView.separated(
                      controller: ScrollController(),
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) =>
                          card_deilvery(
                              //size: size,
                              order: snapshot.data![index]),

                        separatorBuilder: (context, index) =>
                            SizedBox(
                            height: size.height * 0.03,
                      ),
                ),
                    ],
                  );
                },

              )
            ],
          ),
        ),
      ),
    );
  }
}
