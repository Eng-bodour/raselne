//for move between screen class user

// class UserPrivate {
//   final String? name;
//   final String? uid;
//   UserPrivate({this.uid, this.name});
// }
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
class UserModel {
  String? uid;
  String name;
  String email;
  String mobile;
  late String type;//مندوب-زبون
 late String dateCreated;
 late String num_car;
 late String Id_number;
 late String type_car;
 late String num_travel;

  late LatLng? location;
  UserModel({
     required this.location,
    required this.uid,
    required this.name,
    required this.email,
    required this.mobile,
  });
  // factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
  //     name: json["name"].toDouble(),
  //     email: json["email"],
  //     mobile: json["mobile"],
  //     id: json['id']);
  // Map<String, dynamic> toJson() => {
  //       "name": name,
  //       "email": email,
  //       "mobile": mobile,
  //       "id": id,
  //     };
}
