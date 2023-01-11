


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class TrackingRepository{

Future<void> setlocationTracking(GeoPoint loc,String idorder);
Stream<GeoPoint> getlocationTracking( String idorder);

}