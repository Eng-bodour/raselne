//for move between screen class user

// class UserPrivate {
//   final String? name;
//   final String? uid;
//   UserPrivate({this.uid, this.name});
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
class UserModel {
  String? uid=null;
  String name;
  String email;
  String mobile;
  late String type;//مندوب-زبون
 late String dateCreated='2022-1-8';
 late String? num_car='';
 late String? Id_number='';
 late String? type_car='';
 late String? num_travel='0';
 late LatLng? location;

  UserModel({
     required this.location,
    required this.uid,
    required this.name,
    required this.email,
    required this.mobile,
     this.num_travel,  this.type_car,
     this.Id_number, required this.dateCreated,  this.num_car,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) {
    UserModel userModel= UserModel(
      name: json["name"],
      //.toDouble(),
      email: json["email"],
      mobile: json["mobile"],
      uid: json['uid'],
      location: null,
      num_travel: json["num_travel"] == null ? '' : json["num_travel"],
      type_car: json["type_car"] == null ? '' : json["type_car"],
      Id_number: json["Id_number"] == null ? '' : json["Id_number"],
      dateCreated: json["dateCreated"] == null ? '' : json["dateCreated"],
      num_car: json["num_car"] == null ? '' : json["num_car"],
    );

   GeoPoint gloacationfrom=json["location"];
    userModel.location=LatLng(gloacationfrom.latitude,gloacationfrom.longitude);
   return userModel;
  }
  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "mobile": mobile,
        "uid": uid,
        "num_travel":num_travel,
        "type_car":type_car,
        "Id_number":Id_number,
        "dateCreated":dateCreated,
        "num_car":num_car,
        "location":GeoPoint(location!.latitude,location!.longitude),
      };

}

