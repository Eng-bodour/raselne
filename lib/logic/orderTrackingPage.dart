import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
// import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:location/location.dart' as loc;
import 'package:location/location.dart';
import 'package:provider/provider.dart';
import 'package:raselne/logic/repositories/tracking/tracking_firebase.dart';
import '../services/location_services.dart';
import '../services/polyline_service.dart';
import 'controller/auth_controller.dart';

class OrdertrackingPage extends StatefulWidget {
  OrdertrackingPage({required this.idorder, Key? key}) : super(key: key);
  String idorder;
  @override
  State<OrdertrackingPage> createState() => OrdertrackingPageState();
}

class OrdertrackingPageState extends State<OrdertrackingPage> {
  Completer<GoogleMapController> _controller = Completer();
  late GoogleMapController mapController;
  BitmapDescriptor sourceIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor destinationIcon = BitmapDescriptor.defaultMarkerWithHue(20);
  BitmapDescriptor currentLocationIcon = BitmapDescriptor.defaultMarker;
  static const LatLng sourceLocation = LatLng(36.230087, 37.137082987725735);
  static const LatLng destination =    LatLng(36.236267, 37.1149617);
  static const LatLng mylocation =     LatLng(36.3360211,37.167082987725735);
  LocationData? currentlocation; //=LatLng(37.33429383, -122.06600055);
  List<LatLng> polylineCoordinates = [];
  Set<Polyline> _polylines = Set<Polyline>();
  final loc.Location location = loc.Location();
  StreamSubscription<loc.LocationData>? _locationSubscription;
// static final CameraPosition _kGooglePlex = CameraPosition(
//   target: LatLng(37.42796133580664, -122.085749655962),
//   zoom: 14.4746,
// );
//
// static final CameraPosition _kLake = CameraPosition(
//     bearing: 192.8334901395799,
//     target: LatLng(37.43296265331129, -122.08832357078792),
//     tilt: 59.440717697143555,
//     zoom: 19.151926040649414);

  void setCustomMarkerIcon() {
    BitmapDescriptor.fromAssetImage(ImageConfiguration.empty, "assetName")
        .then((value) => sourceIcon = value);
  }

  @override
  initState() {

    print(';nbnnbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb');
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      currentlocation=  await LocationService().getLocation();

      if (Provider.of<AuthProvider_vm>(context,listen: false)
          .currentuser.type=='captain')
      getCurrentLocation();
      // setCustomMarkerIcon();
      _drawPolyline(sourceLocation, destination);
      // getMyLocation();
    });

    _requestPermission();
    location.changeSettings(interval: 300, accuracy: loc.LocationAccuracy.high);
    location.enableBackgroundMode(enable: true);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
       Provider.of<AuthProvider_vm>(context).currentuser.type=='user'?
        StreamBuilder(
            stream:  tracking_firebase().getlocationTracking(widget.idorder),
            builder: (context, AsyncSnapshot<GeoPoint> snapshot) {
        print('-----------------snapshot.data!.latitude!------------------------- ');
        print(snapshot.data!.latitude!);
              _animateCamera(
                  LatLng(snapshot.data!.latitude!,snapshot.data!.longitude!)
                  );
              return mylocation == null
                  ? Center(
                      child: Text('lo'),
                    )
                  :
              snapshot.hasData==false?
              Center(
                child: Text('lonn nnnn'),
              ) :GoogleMap(
                      initialCameraPosition: CameraPosition(
                        zoom: 13.5,
                        target: sourceLocation,
                        // LatLng(currentlocation!.latitude!,currentlocation!.longitude!) ,
                      ),

                      mapType: MapType.normal,
                      onMapCreated: (GoogleMapController controller) async {
                        String style = await DefaultAssetBundle.of(context)
                            .loadString('assets/map_style.json');
                        //customize your map style at: https://mapstyle.withgoogle.com/
                        controller.setMapStyle(style);
                        _controller.complete(controller);
                        _drawPolyline(sourceLocation, destination);
                      },
                      onCameraMove: (CameraPosition newPos) {
                        setState(() {
                          // currentLocation=newPos.target;
                        });
                      },
                      markers: {
                        Marker(
                            markerId: MarkerId("currentLocation"),
                            icon: currentLocationIcon,
                            position:
              //mylocation
              //),
                        LatLng(snapshot.data!.latitude!,snapshot.data!.longitude!)),

                        Marker(
                            markerId: MarkerId("source",),
                            icon: sourceIcon,

                            position: sourceLocation),
                        Marker(
                            markerId: MarkerId("destination"),
                            icon: destinationIcon,
                            position: destination),
                      },
                      polylines: _polylines,
                      // polylines:_polyline,
                      // {
                      //   Polyline(
                      //     polylineId: PolylineId("route"),
                      //     points: polylineCoordinates,
                      //     color: Colors.blue,
                      //     width: 10
                      //   )
                      // },
                    );
            }):
       currentlocation==null?
       Center(
         child: Text('lod'),
       ): GoogleMap(
         initialCameraPosition: CameraPosition(
           zoom: 13.5,
           target:  LatLng(currentlocation!.latitude!,currentlocation!.longitude!) ,
         ),

         mapType: MapType.normal,
         onMapCreated: (GoogleMapController controller) async {
           String style = await DefaultAssetBundle.of(context)
               .loadString('assets/map_style.json');
           //customize your map style at: https://mapstyle.withgoogle.com/
           controller.setMapStyle(style);
           _controller.complete(controller);
           _drawPolyline(sourceLocation, destination);
         },
         onCameraMove: (CameraPosition newPos) {
           setState(() {
             // currentLocation=newPos.target;
           });
         },
         markers: {
           Marker(
               markerId: MarkerId("currentLocation"),
               icon: currentLocationIcon,
               position:
               //mylocation
               //),
               LatLng(currentlocation!.latitude!,currentlocation!.longitude!)),

           Marker(
               markerId: MarkerId("source"),
               icon: sourceIcon,
               position: sourceLocation),
           Marker(
               markerId: MarkerId("destination"),
               icon: destinationIcon,
               position: destination),
         },
         polylines: _polylines,
         // polylines:_polyline,
         // {
         //   Polyline(
         //     polylineId: PolylineId("route"),
         //     points: polylineCoordinates,
         //     color: Colors.blue,
         //     width: 10
         //   )
         // },
       )
    );
  }

  void getCurrentLocation() async {
    GoogleMapController googleMapController = await _controller.future;
    // Location location=new Location();
    print('dfdsfdfdsfffffffffffffff');
    Location location = new Location();
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        throw Exception();
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        throw Exception();
      }
    }
    location.getLocation().then((value) => (location) {
          currentlocation = location;
          print('loc===============******************============= ');
          print(currentlocation!.latitude.toString());
          print(currentlocation!.longitude.toString());
        });
    // location= LatLng(newLoc!.latitude!,newLoc!.longitude!);

      location.onLocationChanged.listen((newLoc) {
      currentlocation = newLoc;
      _setLocation();
      googleMapController
          .animateCamera(
          CameraUpdate.newCameraPosition(
          CameraPosition(
              zoom: 13.5,
              target:
                  //mylocation
                  LatLng(newLoc!.latitude!, newLoc!.longitude!))
          ));

       setState( () {} );

    });

  }

  Future<void> _drawPolyline(LatLng from, LatLng to) async {
    Polyline polyline = await PolylineService().drawPolyline2(from, to);

    //polylineCoordinates = await PolylineService().drawPolyline(from, to);
    // mapController.addPolyline(PolylineOptions(
    //   points: [_origin, _destination],
    //   width: 5,
    //   color: Colors.blue,
    // ));

    //
    // _setMarker(from);
    // _setMarker(to);

    setState(() {
      _polylines.add(polyline);
    });
  }

  Future<void> getMyLocation() async {
    LocationData _myLocation = await LocationService().getLocation();

    _animateCamera(LatLng(mylocation.latitude!, mylocation.longitude!));
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

  _setLocation() async {

      //final loc.LocationData _locationResult = await location.getLocation();
       print('set locationnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn');
      GeoPoint locs = GeoPoint(currentlocation!.latitude!,currentlocation!.longitude!);
         // LatLng(_locationResult.latitude!, _locationResult.longitude!);
      await tracking_firebase().setlocationTracking(locs,widget.idorder);
      //   await FirebaseFirestore.instance
    //       .collection('orders')
    //       .doc(widget.idorder)
    //       .set({
    //     'trackingLocation': locs,
    //     // 'longitude': _locationResult.longitude,
    //     // 'name': 'john'
    //   }, SetOptions(merge: true));
    // } catch (e) {
    //   print(e);
    // }
  }

  Future<void> _listenLocation() async {
    _locationSubscription = location.onLocationChanged.handleError((onError) {
      print(onError);
      _locationSubscription?.cancel();
      setState(() {
        _locationSubscription = null;
      });
    }) .listen((loc.LocationData currentlocation) async {
      LatLng locs =
          LatLng(currentlocation.latitude!, currentlocation.longitude!);
      await FirebaseFirestore.instance
          .collection('orders')
          .doc(widget.idorder)
          .set({
        'trackingLocation': locs,
        // 'longitude': currentlocation.longitude,
        // 'name': 'john'
      }, SetOptions(merge: true));
    });
  }

  _stopListening() {
    _locationSubscription?.cancel();
    setState(() {
      _locationSubscription = null;
    });
  }

  _requestPermission() async {
    // var status = await perm.Permission.location.request();
    // if (status.isGranted) {
    //   print('done');
    // } else if (status.isDenied) {
    //   _requestPermission();
    // } else if (status.isPermanentlyDenied) {
    //   perm.openAppSettings();
    // }
  }

  // Future<void> mymap() async {
  //   final GoogleMapController controller = await _controller.future;
  //   await controller.animateCamera(
  //       CameraUpdate.newCameraPosition(
  //       CameraPosition(
  //       target:
  //       //LatLng( await  tracking_firebase().getlocationTracking(widget.idorder),
  //       // LatLng(
  //       //   snapshot.data!.docs.singleWhere(
  //       //           (element) => element.id == widget.idorder)['trackingLocation'],
  //       //   snapshot.data!.docs.singleWhere(
  //       //           (element) => element.id == widget.idorder)['longitude'],
  //       // ),
  //       zoom: 14.47)));
  // }



}
