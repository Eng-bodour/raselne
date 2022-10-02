//for move between screen class user

// class UserPrivate {
//   final String? name;
//   final String? uid;
//   UserPrivate({this.uid, this.name});
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

 class Rate {
   double value_rate=0.0;
   String id_user='';
   Rate({
     required this.value_rate,
     required this.id_user,
   });
   factory Rate.fromJson(Map<String, dynamic> json) =>
       Rate(
     value_rate:double.parse( json["value_rate"]),
     id_user:   json["id_user"],
   );

   Map<String, dynamic> toJson() => {
     "value_rate": value_rate,
     "id_user": id_user,
   };
 }

class UserModel {
  String? uid=null;
  String name='';
 late String docId;
  String email='';
  String mobile='';
  String? balance='';
  String? eradat='';
 late List<Rate> rating=[];
 late double rataing=0.0;
  late String type;//مندوب-زبون
 late String dateCreated='2022-1-8';
 late String? num_car='';
 late String? Id_number='';
 late String? type_car='';
 late String? copoun='';
 late int? num_travel=0;
 late LatLng? location;

  UserModel({
     required this.location,
    required this.uid,
    required this.name,
    // required this.docId,
    required this.email,
    required this.mobile,
    required this.type,
     this.num_travel,  this.type_car,
    this.eradat,this.balance,this.copoun,
     this.Id_number, required this.dateCreated,  this.num_car, required double rataing,
  });
   factory UserModel.fromJson(Map<String, dynamic>? json,String docIdUser) {
    UserModel userModel= UserModel(
      name: json!["name"],
      //.toDouble(),
      email: json["email"],
      mobile: json["mobile"],
      uid: json['uid'],
      location: null,
      type:json['type'],
      num_travel: json["num_travel"] == null ? 0 : json["num_travel"],
      type_car: json["type_car"] == null ? '' : json["type_car"],
      copoun: json["copoun"] == null ? '' : json["copoun"],
      Id_number: json["Id_number"] == null ? '' : json["Id_number"],
      dateCreated: json["dateCreated"] == null ? '' : json["dateCreated"],
      num_car: json["num_car"] == null ? '' : json["num_car"],
      rataing: 1,
    // rataing: getrate(),
    );
   userModel.docId= docIdUser;
   userModel.balance= json["balance"] == null ? null : json["balance"];
   userModel.eradat= json["eradat"] == null ? null : json["eradat"];
   userModel.rating= json["rate"] == null ? [] :
       // json["rate"].tolist();
    // json['rate'].tolist()
    //     .map((e) => Rate.fromJson(e));
        // .toList();
   userModel.getproud(json['rate']);
    GeoPoint gloacationfrom=json["location"];
    userModel.location=LatLng(
        gloacationfrom.latitude,
        gloacationfrom.longitude);
    return userModel;
  }
  List<Rate> getproud(data) {
    List<Rate> prodlist = [];
    if(data!=null){
      print('data!=null');
      for (int i = 0; i < data.length; i++) {
        print(i);

        // print("data "+ "[" + data[i] + "]");
        prodlist.add(Rate.fromJson(data[i]));
      }
    }
    return prodlist;

  }

 static double getrate(List<Rate> listrate) {
    int star1=0,star2=0,star3=0,star4=0,star5=0;
    double star1_1=0,star2_2=0,star3_3=0,star4_4=0,star5_5=0;
    for(int i=0;i<listrate.length-1;i++)
    {
      print('value_rate in loop ' +listrate[i].value_rate.toString());
      switch(listrate[i].value_rate.toString()){
        case '1':
          star1++;
          break;
        case '2':
          star2++;
          break;
        case '3':
          star3++;
          break;
        case '4':
          star4++;
          break;
          case '5':
          star5++;
          break;
      }
    }
   star1_1= star1*1;
   star2_2= star2*2;
   star3_3= star3*3;
   star4_4= star4*4;
   star5_5= star5*5;
   double sumValues=star1_1+star2_2+star3_3+star4_4+star5_5;
   print('star2_2 '+star2_2.toString());
   print('sumValues '+ sumValues.toString());
  double rataing=sumValues/listrate.length;
     return rataing;
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
        "balance":balance,
        "eradat":eradat,
        "location":GeoPoint(location!.latitude,location!.longitude),
      };
// _data['products'] =
// products!.map((e)=>e.toJson()).toList();
}

