import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:raselne/data_layer/model/orderModel.dart';
import 'package:raselne/routes/routes.dart';
import 'package:raselne/utilis/theme.dart';
import 'package:raselne/view_presentation/screen_driver/waiting_approve_order.dart';

import 'package:raselne/view_presentation/widget/text_utilis.dart';

import '../../../data_layer/model/user_model.dart';
import '../../../logic/controller/auth_controller.dart';
import '../../../logic/controller/order_vm.dart';
import '../../../services/polyline_service.dart';

class bottomsheet_offer extends StatefulWidget {
  bottomsheet_offer({required this.order, Key? key}) : super(key: key);
  OrderModel order;

  @override
  State<bottomsheet_offer> createState() => _bottomsheet_offerState();
}

class _bottomsheet_offerState extends State<bottomsheet_offer> {
  final Set<Polyline> _polylines = {};
  // late UserModel user;

  static late final LatLng location_init;
  final Completer<GoogleMapController> _controller = Completer();
  final Set<Marker> _markers = {};
  static late    CameraPosition _inialCameraPosition = const CameraPosition(
      target: LatLng(33.55, 36.28), // widget.order.toLocation,
      zoom: 10);
  LatLng currentLocation = _inialCameraPosition.target;
  TextEditingController valueController = TextEditingController();
  BitmapDescriptor? _locationIcon;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    // location_init=widget.order.fromlocation;
    // print('long '+location_init.longitude.toString());
    // _inialCameraPosition  = CameraPosition(
    // target:location_init,// widget.order.toLocation,
    // zoom: 17.47
    // );\
    // user= Provider.of<AuthProvider_vm>(context,listen: false).currentuser;
    _animateCamera(widget.order.fromlocation);
    _buildMarkerFromAssets();
    _drawPolyline(widget.order.fromlocation, widget.order.toLocation);
    super.initState();
  }

  Future<void> _animateCamera(LatLng _location) async {
    final GoogleMapController controller = await _controller.future;
    CameraPosition _cameraPosition = CameraPosition(
      target: _location,
      zoom: 13.00,
    );
    print(
        "animating camera to (lat: ${_location.latitude}, long: ${_location.longitude}");
    controller.animateCamera(CameraUpdate.newCameraPosition(_cameraPosition));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ModalProgressHUD(
      inAsyncCall: Provider.of<order_vm>(context, listen: true).isloading,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
            height: size.height * 0.9,
            width: double.infinity,
            margin: EdgeInsets.symmetric(
              vertical: size.height * 0.01,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.06,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: greyColor.withOpacity(0.2),
                            radius: size.width * 0.05,
                            child: Icon(
                              Icons.shopping_bag_rounded,
                              color: Colors.lightBlue.withOpacity(0.9),
                              size: size.width * 0.09,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextUtils(
                                  fontSize: size.width * 0.04,
                                  fontWeight: FontWeight.bold,
                                  text: widget.order.titleStore,
                                  color: Colors.black54,
                                  underLine: TextDecoration.none),
                              TextUtils(
                                  fontSize: size.width * 0.04,
                                  fontWeight: FontWeight.bold,
                                  text: widget.order.id_order.substring(0, 6),
                                  color: Colors.black54,
                                  underLine: TextDecoration.none),
                            ],
                          ),
                        ],
                      ),
                      CircleAvatar(
                          backgroundColor: greyColor.withOpacity(0.6),
                          radius: size.width * 0.05,
                          child: IconButton(
                              onPressed: () {
                                Get.back();
                              },
                              icon: Icon(
                                Icons.close,
                                size: size.width * 0.05,
                                color: Colors.white,
                              ))),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Container(
                  height: size.height * 0.1,
                  decoration: BoxDecoration(color: mainColor.withOpacity(0.2)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.06,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.person,
                          color: mainColor,
                          size: size.width * 0.1,
                        ),
                        TextUtils(
                            fontSize: size.width * 0.04,
                            fontWeight: FontWeight.bold,
                            text: Provider.of<AuthProvider_vm>(context,
                                    listen: true)
                                .currentuser
                                .name
                                .toString(),
                            //widget.order.from_user.toString(),//'Sa**b',
                            color: Colors.black45,
                            underLine: TextDecoration.none),
                        SizedBox(width: size.width * 0.02),
                        Icon(
                          Icons.star,
                          color: mainColor,
                          size: size.width * 0.05,
                        ),
                        SizedBox(width: size.width * 0.01),
                        TextUtils(
                            fontSize: size.width * 0.04,
                            fontWeight: FontWeight.bold,
                            text: Provider.of<AuthProvider_vm>(context,
                                    listen: true)
                                .currentuser
                                .rataing
                                .toString(),
                            color: Colors.black45,
                            underLine: TextDecoration.none),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.06,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextUtils(
                          fontSize: size.width * 0.04,
                          fontWeight: FontWeight.bold,
                          text: 'infoOrder',
                          color: Colors.black45,
                          underLine: TextDecoration.none),
                      //SizedBox(width: size.width * 0.02),
                      TextButton.icon(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.info,
                            color: Colors.black45,
                          ),
                          label: const Text(
                            'تبليغ',
                            style: TextStyle(color: Colors.black45),
                          ))
                    ],
                  ),
                ) // Container(

                ,
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.06,
                  ),
                  child: Text(
                    widget.order.content_order.toString(),
                  ),
                ),
                Container(
                  height: size.height * 0.3,
                  decoration: const BoxDecoration(color: mainColor),
                  child: Scaffold(
                    body: Stack(
                      alignment: Alignment.center,
                      children: [
                        GoogleMap(
                          initialCameraPosition: CameraPosition(
                              target: LatLng(widget.order.toLocation.latitude,
                                  widget.order.toLocation.longitude)),
                          mapType: MapType.normal,
                          onMapCreated: (GoogleMapController controller) async {
                            String style = await DefaultAssetBundle.of(context)
                                .loadString('assets/map_style.json');
                            //customize your map style at: https://mapstyle.withgoogle.com/
                            controller.setMapStyle(style);
                            _controller.complete(controller);
                          },
                          onCameraMove: (CameraPosition newPos) {
                            setState(() {
                              currentLocation = newPos.target;
                            });
                          },
                          markers: _markers,
                          polylines: _polylines,
                        ),
                        SizedBox(
                          width: 40,
                          height: 40,
                          child: Image.asset('assets/images/location_icon.png'),
                        ),
                      ],
                    ),
                    floatingActionButton: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        // FloatingActionButton(
                        //   onPressed: () => _drawPolyline(
                        //       LatLng(38.52900208591146, -98.54919254779816), currentLocation),
                        //   child: Icon(Icons.settings_ethernet_rounded),
                        // ),
                        // FloatingActionButton(
                        //   onPressed: () => _setMarker(currentLocation),
                        //   child: Icon(Icons.location_on),
                        // ),
                        // FloatingActionButton(
                        //   onPressed: () => getMyLocation(),
                        //   child: Icon(Icons.gps_fixed),
                        // ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.06,
                      vertical: size.height * 0.01),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.business_outlined,
                                  color: mainColor,
                                  size: size.width * 0.08,
                                ),
                                TextUtils(
                                    fontSize: size.width * 0.04,
                                    fontWeight: FontWeight.bold,
                                    text: widget.order.distance_me_recive,
                                    color: Colors.black87,
                                    underLine: TextDecoration.none),
                              ],
                            ),
                            TextUtils(
                                fontSize: size.width * 0.04,
                                fontWeight: FontWeight.bold,
                                text: 'موقع الاستلام',
                                color: Colors.black45,
                                underLine: TextDecoration.none),
                            TextUtils(
                                fontSize: size.width * 0.03,
                                fontWeight: FontWeight.bold,
                                text: 'اللوكاشن المحدد من الخريطة',
                                color: Colors.black45,
                                underLine: TextDecoration.none),
                          ]),
                      //      const Text('____'),
                      SizedBox(
                        width: size.width * 0.2,
                      ),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.home,
                                  color: mainColor,
                                  size: size.width * 0.08,
                                ),
                                SizedBox(
                                  width: size.width * 0.01,
                                ),
                                TextUtils(
                                    fontSize: size.width * 0.04,
                                    fontWeight: FontWeight.bold,
                                    text: widget.order.distance_recive_deilvery,
                                    color: Colors.black87,
                                    underLine: TextDecoration.none),
                              ],
                            ),
                            TextUtils(
                                fontSize: size.width * 0.04,
                                fontWeight: FontWeight.bold,
                                text: 'موقع التسليم',
                                color: Colors.black45,
                                underLine: TextDecoration.none),
                            TextUtils(
                                fontSize: size.width * 0.03,
                                fontWeight: FontWeight.bold,
                                text: 'اللوكاشن المحدد من الخريطة',
                                color: Colors.black45,
                                underLine: TextDecoration.none),
                          ]),
                    ],
                  ),
                ),
                Container(
                  height: size.height * 0.1,
                  decoration: const BoxDecoration(color: mainColor),
                  child: Column(
                    children: [
                      TextUtils(
                          fontSize: size.width * 0.04,
                          fontWeight: FontWeight.bold,
                          text: 'تأكيد العرض',
                          color: Colors.white,
                          underLine: TextDecoration.none),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.06),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Expanded(
                            //   child:
                            //    TextField(
                            //     controller: valueController,
                            //     decoration: InputDecoration(
                            //       fillColor: Colors.white,
                            //       hintText: 'عرض السعر',
                            //       hintStyle: TextStyle(
                            //         color: Colors.black45,
                            //         fontSize: size.width * 0.03,
                            //         fontWeight: FontWeight.w500,
                            //       ),
                            //       filled: true,
                            //       enabledBorder: OutlineInputBorder(
                            //         borderSide:
                            //             const BorderSide(color: mainColor),
                            //         borderRadius: BorderRadius.circular(10),
                            //       ),
                            //       focusedBorder: OutlineInputBorder(
                            //         borderSide:
                            //             const BorderSide(color: mainColor),
                            //         borderRadius: BorderRadius.circular(10),
                            //       ),
                            //       errorBorder: OutlineInputBorder(
                            //         borderSide:
                            //             const BorderSide(color: mainColor),
                            //         borderRadius: BorderRadius.circular(10),
                            //       ),
                            //       focusedErrorBorder: OutlineInputBorder(
                            //         borderSide:
                            //             const BorderSide(color: mainColor),
                            //         borderRadius: BorderRadius.circular(10),
                            //       ),
                            //     ),
                            //   ),
                            // ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.1),
                              child: ElevatedButton(
                                onPressed: () async {
                                  print('sddsdsdvfvvvvbbb');
                                  await Provider.of<order_vm>(context,
                                          listen: false)
                                      .update_order(
                                    widget.order.id_order,
                                    widget.order.distance_recive_deilvery,
                                    widget.order.price_deilvery_captain,
                                    //  user.uid.toString()
                                  );
                                  ///////////////////////////////////////////
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              waiting_aprrove_order(
                                                orderModel: widget.order,
                                              )));
                                },
                                style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  primary: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        size.width * 0.03),
                                  ), //Get.isDarkMode ? pinkClr : mainColor,
                                  minimumSize:
                                      Size(size.height * 0.3, size.width * 0.1),
                                ),
                                child: TextUtils(
                                  color: mainColor,
                                  text: widget.order.price_deilvery_captain +
                                      ' تأكيد ', // '20ر.س',
                                  fontSize: size.width * 0.05,
                                  fontWeight: FontWeight.bold,
                                  underLine: TextDecoration.none,
                                ),
                                // child:
                                // TextUtils(
                                //   color: mainColor,
                                //   text: widget.order.price_deilvery_captain +
                                //       ' ر.س ', // '20ر.س',
                                //   fontSize: size.width * 0.05,
                                //   fontWeight: FontWeight.bold,
                                //   underLine: TextDecoration.none,
                                // ),
                              ),
                            ),
                            // SizedBox(width: size.width * 0.02),
                            // ElevatedButton(
                            //     onPressed: () {},
                            //     style: ElevatedButton.styleFrom(
                            //       elevation: 0,
                            //       primary: greyColor.withOpacity(0.5),
                            //       shape: RoundedRectangleBorder(
                            //         borderRadius:
                            //         BorderRadius.circular(size.width * 0.03),
                            //       ), //Get.isDarkMode ? pinkClr : mainColor,
                            //       minimumSize:
                            //       Size(size.height * 0.1, size.width * 0.1),
                            //     ),
                            //     child: Row(
                            //       children: [
                            //         TextUtils(
                            //           color: Colors.white,
                            //           text: 'غير',
                            //           fontSize: size.width * 0.05,
                            //           fontWeight: FontWeight.bold,
                            //           underLine: TextDecoration.none,
                            //         ),
                            //         const Icon(
                            //           Icons.arrow_forward_ios_rounded,
                            //           color: Colors.white,
                            //         ),
                            //       ],
                            //     )),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }

  Future<void> _drawPolyline(LatLng from, LatLng to) async {
    Polyline polyline = await PolylineService().drawPolyline(from, to);

    _polylines.add(polyline);

    _setMarker(from);
    _setMarker(to);

    setState(() {});
  }

  void _setMarker(LatLng _location) {
    Marker newMarker = Marker(
      markerId: MarkerId(_location.toString()),
      icon: BitmapDescriptor.defaultMarker,
      // icon: _locationIcon,
      position: currentLocation,
      infoWindow: InfoWindow(
          title: "Title",
          snippet: "${currentLocation.latitude}, ${currentLocation.longitude}"),
    );
    _markers.clear();
    _markers.add(newMarker);
    // GetAddressFromLatLong(currentLocation);
    setState(() {});
  }

  Future<void> _buildMarkerFromAssets() async {
    if (_locationIcon == null) {
      _locationIcon = await BitmapDescriptor.fromAssetImage(
          const ImageConfiguration(size: Size(48, 48)),
          'assets/images/location_icon.png');
      setState(() {});
    }
  }
}
