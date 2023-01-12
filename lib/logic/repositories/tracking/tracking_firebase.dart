


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter_platform_interface/src/types/location.dart';
import 'package:raselne/logic/repositories/tracking/tracking_repo.dart';

class tracking_firebase extends TrackingRepository{

  @override
  Stream<GeoPoint> getlocationTracking(String  idorder) {
    // TODO: implement getlocationTracking
    // await FirebaseFirestore.instance.collection('orders').doc(widget.idorder)
    //     .set({
    //   'latitude': _locationResult.latitude,
    //   'longitude': _locationResult.longitude,
    //   'name': 'john'
    // }, SetOptions(merge: true));
    //   snapshot.data!.docs.singleWhere(
    //           (element) => element.id == widget.idorder)['trackingLocation'],
    //   snapshot.data!.docs.singleWhere(
    //           (element) => element.id == widget.idorder)['longitude'],
    // ),
  return
    //(
     FirebaseFirestore.instance.collection('orders')
        .snapshots().map((event) =>  event.docs
        .singleWhere((element)   =>  element.id ==idorder)['trackingLocation']);
    // as GeoPoint;
  //)
        // as GeoPoint;
    // return  LatLng(
    //   go.latitude,go.longitude
    // );
    // throw UnimplementedError();
  }

  @override
  Future<void> setlocationTracking(GeoPoint loc,String idorder) async{
    // TODO: implement setlocationTracking
      try{

      await FirebaseFirestore.instance
          .collection('orders')
          .doc(idorder)
          .update({
          'trackingLocation': loc,
        // 'longitude': _locationResult.longitude,
        // 'name': 'john'
      },);
    } catch (e) {
      print(e);
    }
  }



}