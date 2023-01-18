import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';
import 'package:raselne/services/location_services.dart';

import 'package:raselne/utilis/theme.dart';

import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:raselne/view_presentation/widget/text_utilis.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';

import '../../../logic/controller/order_vm.dart';
import '../../../services/polyline_service.dart';

class map_location extends StatefulWidget {
   map_location({required this.type, Key? key}) : super(key: key);
  String type;
  @override
  _map_locationState createState() => _map_locationState();
}

class _map_locationState extends State<map_location> {
  String Address = '';
  File? pickedFile;
  ImagePicker imagePicker = ImagePicker();
  final Completer<GoogleMapController> _controller = Completer();
  static const CameraPosition _inialCameraPosition =
      CameraPosition(target: LatLng(33.55, 36.28), zoom: 17.47);
  LatLng currentLocation = _inialCameraPosition.target;

  final Set<Marker> _markers = {};
  final Set<Polyline> _polylines = {};

  late Marker newMarker;
  BitmapDescriptor? _locationIcon;
  TextEditingController addDetails = TextEditingController();
  @override
  void initState() {
    _buildMarkerFromAssets();
    getMyLocation();
    // _drawPolyline();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
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
                        horizontal: size.width * 0.03,
                        vertical: size.height * 0.02,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                              widget.type=='الاستلام'? 'موقع الاستلام ':'موقع التوصيل',
                              style: TextStyle(
                                  fontSize: size.width * 0.045,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: IconButton(
                              onPressed: () {
                                Get.back();
                              },
                              icon: const Icon(Icons.close, color: Colors.black54)),
                        )
                      ],
                    ),
                  ),
                  //this for map
                  Container(
                    height: size.height * 0.4,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(size.width * 0.01),
                        color: mainColor),
                    child: Scaffold(
                      body: Stack(
                        alignment: Alignment.center,
                        children: [
                          GoogleMap(
                            initialCameraPosition: _inialCameraPosition,
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
                      floatingActionButton: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // FloatingActionButton(
                          //   onPressed: () => _drawPolyline(
                          //       LatLng(38.52900208591146, -98.54919254779816), currentLocation),
                          //   child: Icon(Icons.settings_ethernet_rounded),
                          // ),
                          FloatingActionButton(
                            onPressed: () => _setMarker(currentLocation),
                            child: const Icon(Icons.location_on),
                          ),
                          SizedBox(width: 4,),
                          FloatingActionButton(
                            onPressed: () => getMyLocation(),
                            child: const Icon(Icons.gps_fixed),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                    child: Container(
                      height: size.height * 0.3,
                      width: size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(size.width * 0.04),
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.04,
                                vertical: size.height * 0.01),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.location_on,
                                      color: Colors.black54,
                                    ),
                                    SizedBox(
                                      width: size.width * 0.02,
                                    ),
                                    const Text(
                                      'مكان الوكاشن المحدد من الخريطة',
                                      style: TextStyle(color: Colors.black54),
                                    )
                                  ],
                                ),
                                // Text(
                                //     "lat: ${currentLocation.latitude}, "
                                //         "long : ${currentLocation.longitude}"),
                                //
                                Text(
                                  Address,
                                  style: TextStyle(fontSize: size.width * 0.03),
                                ),
                              ],
                            ),
                          ),
                          const Divider(
                            thickness: 1,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.04,
                            ),
                            child: const Text(
                              'تفاصيل إضافية',
                              style: TextStyle(color: Colors.black54),
                            ),
                          ),
                          TextFormField(
                            controller: addDetails,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              fillColor: mainColor.withOpacity(0.1),
                              hintText: 'رقم العمارة, رقم الشقة, علامة مميزة',
                              hintStyle: TextStyle(
                                color: Colors.black45,
                                fontSize: size.width * 0.03,
                                fontWeight: FontWeight.w500,
                              ),
                              filled: true,
                            ),
                          ),
                          const Divider(
                            thickness: 1,
                          ),
                          // InkWell(
                          //   onTap: () {
                          //     showModalBottomSheet<dynamic>(
                          //       backgroundColor: Colors.grey.shade200,
                          //       //  backgroundColor: Colors.transparent,
                          //       elevation: 0,
                          //       shape: const RoundedRectangleBorder(
                          //           borderRadius: BorderRadius.only(
                          //         topLeft: Radius.circular(20),
                          //         topRight: Radius.circular(20),
                          //       )),
                          //       context: context,
                          //       // isScrollControlled: true,
                          //       builder: ((context) {
                          //         return addImageBottomSheet(
                          //             size: size, context: context);
                          //       }),
                          //       // builder: ((context) => bottomSheetWithChoiseMealAdditions(context)),
                          //     );
                          //   },
                          //   child: Padding(
                          //     padding: EdgeInsets.symmetric(
                          //       horizontal: size.width * 0.04,
                          //     ),
                          //     child: Row(
                          //       children: [
                          //         const Icon(
                          //           Icons.camera_alt_outlined,
                          //           color: mainColor,
                          //         ),
                          //         SizedBox(
                          //           width: size.width * 0.02,
                          //         ),
                          //         const Text(
                          //           'قم بإضافة صورة لمدخل المنزل',
                          //           style: TextStyle(color: mainColor),
                          //         )
                          //       ],
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  // Padding(
                  //   padding: EdgeInsets.symmetric(
                  //     horizontal: size.width * 0.04,
                  //   ),
                  //   child: Row(
                  //     children: [
                  //       InkWell(
                  //         onTap: () {
                  //
                  //           /// authProvider.checkBox();
                  //         },
                  //         child: Container(
                  //             height: size.height * 0.03,
                  //             width: size.width * 0.06,
                  //             decoration: BoxDecoration(
                  //               color: greyArrow.withOpacity(0.2),
                  //               borderRadius: BorderRadius.circular(10),
                  //             ),
                  //             child: const Icon(
                  //               Icons.done,
                  //               color: mainColor,
                  //             )
                  //             // authProvider.isCheckBox
                  //             //     ?
                  //
                  //             //     Image.asset(
                  //             //   'assets/images/check.png',
                  //             //   color: Colors.amber,
                  //             // )
                  //             // : Container(),
                  //             ),
                  //       ),
                  //       SizedBox(
                  //         width: size.width * 0.02,
                  //       ),
                  //       Text('حفظ المكان لاستخدامه لاحقاً',
                  //           style: TextStyle(
                  //               fontSize: size.width * 0.03,
                  //               fontWeight: FontWeight.bold,
                  //               color: Colors.black54)),
                  //     ],
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: size.height * 0.02,
                  // ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.04,
                    ),
                    child: ElevatedButton(
                      onPressed: () async {
                       widget.type=='الاستلام'?
                           await Provider.of<order_vm>(context, listen: false)
                            .addlocation(currentLocation, Address, addDetails.text,widget.type)
                       :   await Provider.of<order_vm>(context, listen: false)
                            .addlocation(currentLocation, Address, addDetails.text,widget.type);
                        Navigator.pop(context);
                      },

                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        primary: mainColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(size.width * 0.05),
                        ), //Get.isDarkMode ? pinkClr : mainColor,
                        minimumSize: Size(size.height, size.width * 0.12),
                      ),
                      child: TextUtils(
                        color: Colors.white,
                        text:widget.type=='الاستلام'? 'تأكيد مكان الاستلام':'تأكيد مكان التوصيل',
                        fontSize: size.width * 0.05,
                        fontWeight: FontWeight.bold,
                        underLine: TextDecoration.none,
                      ),
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }

  Widget addImageBottomSheet({required Size size, required BuildContext context}) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
          height: size.height * 0.2,
          width: double.infinity,
          margin: EdgeInsets.symmetric(
            vertical: size.height * 0.01,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.06, vertical: size.height * 0.014),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('تغيير الصورة ',
                  style: TextStyle(
                      fontSize: size.width * 0.05,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54)),
              const Divider(
                thickness: 0.5,
                color: Colors.black12,
              ),
              InkWell(
                onTap: () {
                  // to  fetch photo from galeery
                  takePhoto(ImageSource.gallery, context);
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.photo_camera_back_outlined,
                      color: mainColor,
                      size: size.width * 0.08,
                    ),
                    SizedBox(
                      width: size.width * 0.03,
                    ),
                    Text('معرض الصور',
                        style: TextStyle(
                            fontSize: size.width * 0.045,
                            fontWeight: FontWeight.bold,
                            color: mainColor)),
                  ],
                ),
              ),
              const Divider(
                thickness: 0.5,
                color: Colors.black12,
              ),
              InkWell(
                onTap: () {
                  // to  fetch photo from camera
                  takePhoto(ImageSource.camera, context);
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.camera_alt_outlined,
                      color: mainColor,
                      size: size.width * 0.08,
                    ),
                    SizedBox(
                      width: size.width * 0.03,
                    ),
                    Text('التقط صورة',
                        style: TextStyle(
                            fontSize: size.width * 0.045,
                            fontWeight: FontWeight.bold,
                            color: mainColor)),
                  ],
                ),
              )
            ]),
          )),
    );
  }

  void takePhoto(ImageSource source, context) async {
    final pickedImage =
        await imagePicker.pickImage(source: source, imageQuality: 100);
    pickedFile = File(pickedImage!.path);
    // Provider.of<user_vm_provider>(context, listen: false).currentUser!.path =
    //     pickedFile!.path;

    Navigator.of(context).pop();
  }

  Future<void> GetAddressFromLatLong(LatLng position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemarks);
    Placemark place = placemarks[0];
    Address =
        '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    setState(() {
      print(Address);
    });
  }

  void _setMarker(LatLng _location) {
    newMarker = Marker(
      markerId: const MarkerId('mr'), //_location.toString()
      icon: BitmapDescriptor.defaultMarker,
      // icon: _locationIcon,
      position: currentLocation,
      infoWindow: InfoWindow(
          title: "Title",
          snippet: "${currentLocation.latitude}, ${currentLocation.longitude}"),
    );
    _markers.clear();
    _markers.add(newMarker);
    setState(() {
      GetAddressFromLatLong(currentLocation);
    });
  }

  Future<void> _buildMarkerFromAssets() async {
    if (_locationIcon == null) {
      _locationIcon = await BitmapDescriptor.fromAssetImage(
          const ImageConfiguration(size: Size(48, 48)),
          'assets/images/location_icon.png');
      setState(() {});
    }
  }

  Future<void> getMyLocation() async {
    LocationData _myLocation = await LocationService().getLocation();
    _animateCamera(LatLng(_myLocation.latitude!, _myLocation.longitude!));
    GetAddressFromLatLong(
        LatLng(_myLocation.latitude!, _myLocation.longitude!));
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
  // Future<void> _showSearchDialog() async {
  //   var p = await PlacesAutocomplete.show(
  //       context: context,
  //       apiKey: Constants.apiKey,
  //       mode: Mode.fullscreen,
  //       language: "ar",
  //       region: "ar",
  //       offset: 0,
  //       hint: "Type here...",
  //       radius: 1000,
  //       types: [],
  //       strictbounds: false,
  //       components: [Component(Component.country, "ar")]);
  //   _getLocationFromPlaceId(p!.placeId!);
  // }

}
