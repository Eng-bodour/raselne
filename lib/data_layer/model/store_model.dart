

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
class StoreModel {
  String nameStore;
  String descStore;
  String typeStore;
  String mobileStore;
  late LatLng location;
  String offer_value;
  String rating;
  String? IdStore;
  //bool isorderd=false;//this value to refer
 late List<Itemstore> itemstore=[];

  // String get name => nameStore;
  // String get type => typeStore;
  // String get mobile => mobileStore;
  // String get locationnam => location;

  StoreModel({
    required this.nameStore,
    required this.descStore,
    required this.typeStore,
    required this.mobileStore,

    required this.offer_value,
    required this.rating,
  //   this.itemstore,
    required this.IdStore,
  });
  factory StoreModel.fromSnapshot(Map<String,dynamic> doc) {
    StoreModel store =StoreModel(
      nameStore: doc['nameStore'],
      typeStore: doc['typeStore'],
      mobileStore: doc['mobileStore'],
      //location: null,//doc['location'],
      offer_value: doc['offer_value'],
      rating: doc['rating'],
      descStore: doc['descStore'],
      IdStore: doc['IdStore'],
      // itemstore: (json.decode(doc['itemstore']) as List)
      //  .map((e) => Itemstore.fromJson(e)).toList(),
    );
    GeoPoint gloacationfrom=doc["location"];
    store.location=LatLng(gloacationfrom.latitude,gloacationfrom.longitude);


    return store;
  }

  Map<String, dynamic> toSnapchot() => {
       "nameStore": nameStore,
        "typeStore": typeStore,
        "mobileStore": mobileStore,
        "location": location,
        "offer_value": offer_value,
        "rating": rating,
        "descStore": descStore,
        "IdStore": IdStore,
  // _data['products'] =
  // products!.map((e)=>e.toJson()).toList();
        "itemstore": itemstore.map((e) => e.toJson()).toList(),
      };

  // factory StoreModel.fromJson(Map<String, dynamic> json) => StoreModel(
  //       nameStore: json["nameStore"],
  //       typeStore: json["typeStore"],
  //       mobileStore: json["mobileStore"],
  //       location: json["location"],
  //       //  rating: Rating.fromJson(json["rating"]),
  //     );

  // Map<String, dynamic> toJson() => {
  //       "nameStore": nameStore,
  //       "typeStore": typeStore,
  //       "mobileStore": mobileStore,
  //       "location": location,
  //       // "rating": rating.toJson(),
  //     };
}
class Itemstore {
 late String nameCategory;
 late String type_categore;
 late String image;
 late String price;
 late String description;
 late String IdItemStore;
 bool? isorder=false;
 Itemstore({
  required this.type_categore,
  required this.nameCategory,
  required this.image,
  required this.price,
  required this.description,
  // required this.IdItemStore,
   this.isorder,
});
factory Itemstore.fromJson(Map<String, dynamic> json) =>
    Itemstore(
      type_categore: json["type_categore"],
      nameCategory: json["nameCategory"],
      image: json["image"],
      price: json["price"],
      description: json["description"],
      //IdItemStore: json["IdItemStore"],
);

Map<String, dynamic> toJson() => {
  "type_categore":type_categore,
  "nameCategory":nameCategory,
  "image": image,
  "price": price,
  "description": description,
  "IdItemStore": IdItemStore,
};
}

class Rating {
  Rating({
    required this.rate,
    required this.count,
  });

  double rate;
  int count;

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        rate: json["rate"].toDouble(),
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "rate": rate,
        "count": count,
      };
}
