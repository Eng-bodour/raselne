


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter_platform_interface/src/types/location.dart';
import 'package:raselne/logic/repositories/tracking/tracking_repo.dart';

class tracking_api extends TrackingRepository{
  @override
  Stream<GeoPoint> getlocationTracking(String idorder) {
    // TODO: implement getlocationTracking
    throw UnimplementedError();
  }

  @override
  Future<void> setlocationTracking(GeoPoint loc,String idorder) {
    // TODO: implement setlocationTracking
    throw UnimplementedError();
  }
  
  
  
}