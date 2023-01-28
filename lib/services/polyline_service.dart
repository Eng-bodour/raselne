import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:math' show cos, sqrt, asin;

import '../constatnt.dart';

class PolylineService {
  Future<List<LatLng>> drawPolyline(LatLng from, LatLng to) async {
    List<LatLng> polylineCoordinates = [];

    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        apiKey,
        PointLatLng(from.latitude, from.longitude),
        PointLatLng(to.latitude, to.longitude),
        travelMode: TravelMode.driving

    );
    if(result.points.isNotEmpty){
    result.points.forEach((PointLatLng point) {
      polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      print('polylineCoordinates.length');
      print(polylineCoordinates.length);
    });
    }
    // calcDistance(polylineCoordinates);
    return polylineCoordinates;
      // Polyline(
      //   polylineId: PolylineId("polyline_id ${result.points.length}"),
      //   color: Colors.blue,
      //   points: polylineCoordinates);
  }  Future<Polyline> drawPolyline2(LatLng? from, LatLng? to) async {
    List<LatLng> polylineCoordinates = [];

    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        apiKey,

        PointLatLng(42.7477863, -71.1699932),
        PointLatLng(42.6871386, -71.2143403),
        // PointLatLng(from!.latitude, from.longitude),
        // PointLatLng(to!.latitude, to!.longitude),
      travelMode: TravelMode.driving

    );

    // if(result.points.isNotEmpty){
    print(
      'result '
    );
    print(result.status.toString());
    print(' errormessage ' +result.errorMessage.toString());
    result.points.forEach((PointLatLng point) {
      polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      print('polylineCoordinates.length');
      print(polylineCoordinates.length);
    });

    //}
    // calcDistance(polylineCoordinates);
    return
      Polyline(
        polylineId: PolylineId("polyline_id ${result.points.length}"),
        color: Colors.blue,
        points: polylineCoordinates);
  }

  String calcDistance(List<LatLng> polylineCoordinates) {
    double totalDistance = 0.0;

    // Calculating the total distance by adding the distance
    // between small segments
    for (int i = 0; i < polylineCoordinates.length - 1; i++) {
      totalDistance += _coordinateDistance(
        polylineCoordinates[i].latitude,
        polylineCoordinates[i].longitude,
        polylineCoordinates[i + 1].latitude,
        polylineCoordinates[i + 1].longitude,
      );
    }

    // print("distance = ${totalDistance.toStringAsFixed(2)} km");
    return totalDistance.toStringAsFixed(2);
  }

  double _coordinateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }
}