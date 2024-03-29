import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../data_layer/model/orderModel.dart';
import '../../services/polyline_service.dart';

class custom_map_location extends StatefulWidget {
  custom_map_location({required this.type, required this.from,required this.to, Key? key}) : super(key: key);
  LatLng from,to;
  String type;

  @override
  _custom_map_locationState createState() => _custom_map_locationState();
}

class _custom_map_locationState extends State<custom_map_location> {
  Set<Polyline> _polylines = {};
  // late UserModel user;
  List<LatLng> polylineCoordinates = [];

  static late final LatLng  location_init;
  Completer<GoogleMapController> _controller=Completer();
  Set<Marker> _markers={
  };
  // static late   CameraPosition _inialCameraPosition = CameraPosition(
  //     target: LatLng(widget.from.latitude,widget.from.longitude),// widget.order.toLocation,
  //     zoom: 10
  // );
  late LatLng currentLocation;//=widget.to;//_inialCameraPosition.target;

  BitmapDescriptor _locationIcon= BitmapDescriptor.defaultMarker;

  @override void initState() {
    // TODO: implement initState
    // location_init=widget.order.fromlocation;
    // print('long '+location_init.longitude.toString());
    // _inialCameraPosition  = CameraPosition(
    // target:location_init,// widget.order.toLocation,
    // zoom: 17.47
    // );\
    // user= Provider.of<AuthProvider_vm>(context,listen: false).currentuser;
    _buildMarkerFromAssets();
    _setMarker(widget.type=='map s'?widget.from:widget.to);
    _animateCamera( );

    _drawPolyline(widget.from, widget.to);
    super.initState();
  }

  Future<void> _animateCamera(  ) async {
     final GoogleMapController
    controller = await _controller.future;
    CameraPosition _cameraPosition = CameraPosition(
      target:widget.type=='map s'?widget.from:widget.to,
      zoom: 13.00,
    );
    // print(
    //     "animating camera to (lat: ${_location.latitude}, long: ${_location.longitude}");
    controller.animateCamera(CameraUpdate.newCameraPosition(_cameraPosition));
    // _inialCameraPosition=_cameraPosition;

  }

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
      GoogleMap(
      initialCameraPosition:
      CameraPosition(
          target:
              widget.type=='map t'?
              LatLng(widget.to.latitude,
              widget.to.longitude):
              LatLng(widget.from.latitude,
                  widget.from.longitude)),

      mapType: MapType.normal,
      onMapCreated: (GoogleMapController controller) async {
        String style = await DefaultAssetBundle.of(context)
            .loadString('assets/map_style.json');
        //customize your map style at: https://mapstyle.withgoogle.com/
        controller.setMapStyle(style);
        _controller.complete(controller);
      },
      onCameraMove: (CameraPosition newPos){
        setState(() {
          currentLocation=newPos.target;
        });
      },
      markers:    {
        Marker(
          markerId: MarkerId("source"),
          icon: _locationIcon,
          position: widget.from),
      },
      polylines: _polylines,
  ),
],
      ),
    );
  }

  Future<void> _drawPolyline(LatLng from, LatLng to) async {
   // Polyline polyline = await PolylineService().drawPolyline(from, to);
    polylineCoordinates = await PolylineService().drawPolyline(from, to);

    // _polylines.add(polyline);
    //
    // _setMarker(from);
    // _setMarker(to);

    setState(() {});
  }
  void _setMarker(LatLng _location) {
    Marker newMarker = Marker(
      markerId: MarkerId(_location.toString()),
      icon: BitmapDescriptor.defaultMarker,
      // icon: _locationIcon,
      position: _location,
      infoWindow: InfoWindow(
          title: "Title",
          snippet: "${_location.latitude}, ${_location.longitude}"),
    );
    _markers.clear();
    _markers.add(newMarker);
    // GetAddressFromLatLong(currentLocation);
    setState(() {});
  }
  Future<void> _buildMarkerFromAssets() async {

      _locationIcon = await BitmapDescriptor.fromAssetImage(
          ImageConfiguration(size: Size(48, 48)),
        widget.type=='map t'
        ?  'assets/images/gps-design.png'
        : 'assets/images/store-design.png'
      );
      setState(() {});

  }
}
