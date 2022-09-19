import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../data_layer/model/orderModel.dart';
import '../../services/polyline_service.dart';

class custom_map_location extends StatefulWidget {
  custom_map_location({required this.from, required this.to, Key? key})
      : super(key: key);
  LatLng from, to;

  @override
  _custom_map_locationState createState() => _custom_map_locationState();
}

class _custom_map_locationState extends State<custom_map_location> {
  final Set<Polyline> _polylines = {};
  // late UserModel user;

  static late final LatLng location_init;
  final Completer<GoogleMapController> _controller = Completer();
  final Set<Marker> _markers = {};
  // static late   CameraPosition _inialCameraPosition = CameraPosition(
  //     target: LatLng(widget.from.latitude,widget.from.longitude),// widget.order.toLocation,
  //     zoom: 10
  // );
  late LatLng currentLocation; //=widget.to;//_inialCameraPosition.target;

  BitmapDescriptor? _locationIcon;

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
    _animateCamera(widget.from);
    _buildMarkerFromAssets();
    _drawPolyline(widget.from, widget.to);
    super.initState();
  }

  Future<void> _animateCamera(
    LatLng _location,
  ) async {
    final GoogleMapController controller = await _controller.future;
    CameraPosition _cameraPosition = CameraPosition(
      target: _location,
      zoom: 13.00,
    );
    print(
        "animating camera to (lat: ${_location.latitude}, long: ${_location.longitude}");
    controller.animateCamera(CameraUpdate.newCameraPosition(_cameraPosition));
    // _inialCameraPosition=_cameraPosition;
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: CameraPosition(
          target: LatLng(widget.to.latitude, widget.to.longitude)),
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
