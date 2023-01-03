import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
// import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import '../services/location_services.dart';
import '../services/polyline_service.dart';
class OrdertrackingPage  extends StatefulWidget {
   OrdertrackingPage ({Key? key}) : super(key: key);

  @override
  State<OrdertrackingPage > createState() => OrdertrackingPageState();
}

class OrdertrackingPageState extends State<OrdertrackingPage > {

Completer<GoogleMapController> _controller = Completer();
late GoogleMapController mapController;
BitmapDescriptor sourceIcon=BitmapDescriptor.defaultMarker;
BitmapDescriptor destinationIcon=BitmapDescriptor.defaultMarker;
BitmapDescriptor currentLocationIcon=BitmapDescriptor.defaultMarker;
static const LatLng sourceLocation=LatLng(37.33500926, -122.03272188);
static const LatLng destination=LatLng(37.33429383, -122.06600055);
static const LatLng mylocation=LatLng(37.3360211, -122.06600364);
  LocationData? currentlocation;//=LatLng(37.33429383, -122.06600055);
List<LatLng> polylineCoordinates = [];
 Set<Polyline> _polylines =  Set<Polyline>();

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
  
void setCustomMarkerIcon()  {
  
  BitmapDescriptor.fromAssetImage(ImageConfiguration.empty, "assetName")
  .then((value) => sourceIcon=value);
}
@override
initState(){
  WidgetsBinding.instance.addPostFrameCallback((_){
  // getCurrentLocation();
   // setCustomMarkerIcon();
  _drawPolyline(sourceLocation, destination);
  getMyLocation();
  });
}

@override
  Widget build(BuildContext context) {
    return Scaffold(

      body:
      mylocation==null?Center(child: Text('lo'),):
      GoogleMap(
        initialCameraPosition:
        CameraPosition(
          zoom: 13.5,
          target:sourceLocation,
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
        onCameraMove: (CameraPosition newPos){
          setState(() {
           // currentLocation=newPos.target;
          });
        },
        markers:{
          Marker(markerId: MarkerId("currentLocation"),
              icon: currentLocationIcon,
              position: mylocation),
              //LatLng(currentlocation!.latitude!,currentlocation!.longitude!)),

          Marker(markerId: MarkerId("source"),icon: sourceIcon,position: sourceLocation),
          Marker(markerId: MarkerId("destination"),icon: destinationIcon,position: destination),
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
      ),
    );
  }
  void getCurrentLocation() async {
  GoogleMapController googleMapController=await _controller.future;
      // Location location=new Location();

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
  location.getLocation()
      .then((value) => (location){
    currentlocation=location;
    print('loc===============******************============= ');
    print(currentlocation!.latitude.toString());
    print(currentlocation!.longitude.toString());
  });
  // location= LatLng(newLoc!.latitude!,newLoc!.longitude!);

  location.onLocationChanged.listen((newLoc) {
    currentlocation=newLoc;
    googleMapController.animateCamera(
    CameraUpdate.newCameraPosition(
        CameraPosition(
            zoom: 13.5,
            target:
            //mylocation
             LatLng(newLoc!.latitude!,newLoc!.longitude!)

        )));


   setState(() {

   });
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
}
