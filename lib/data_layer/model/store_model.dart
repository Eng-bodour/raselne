

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:raselne/data_layer/model/user_model.dart';
class StoreModel {
  String nameStore;
  String descStore;
  String stateStore;
  String typeStore;
  String? imageStore='';
  String mobileStore;
  late LatLng? location;
  String offer_value;
  // String rating;
  late List<Rate> rating=[];
  late double rataing=0.0;

  String idowner;
  String? IdStore;
  bool isVisible=false;
  //bool isorderd=false;//this value to refer
 late List<Itemstore> itemstore=[];

  // String get name => nameStore;
  // String get type => typeStore;
  // String get mobile => mobileStore;
  // String get locationnam => location;

  StoreModel({
    required this.isVisible,
    required this.nameStore,
    required this.stateStore,
    required this.descStore,
    required this.typeStore,
    required this.idowner,
    required this.mobileStore,
    required this.offer_value,
    required this.rating,
    required this.itemstore,
    required this.IdStore,
     this.imageStore,
      this.location,
  });
  factory StoreModel.fromSnapshot(Map<String,dynamic> doc) {
    StoreModel store =StoreModel(
      nameStore: doc['nameStore'],
      typeStore: doc['typeStore'],
      mobileStore: doc['mobileStore'],
      imageStore: doc['imageStore'],
      stateStore: doc['stateStore'],
      //location: null,//doc['location'],
      offer_value: doc['offer_value'],
      // rating: doc['rating'],
      descStore: doc['descStore'],
      IdStore: doc['IdStore'],
      itemstore: [],
      idowner: doc['idowner'],
      isVisible: false,
      rating: [],

      // itemstore: (json.decode(doc['itemstore']) as List)
      //  .map((e) => Itemstore.fromJson(e)).toList(),
    );

    store.rating= doc["rate"] == null ? [] :

    store.getproud(doc['rate']);
    // store.rataing=getrate(store.rating);
    // print('(store.rataing in fromsnapshot '+store.rataing.toString());
    GeoPoint gloacationfrom=doc["location"];
    store.location=LatLng(
        gloacationfrom.latitude,
        gloacationfrom.longitude);

    return store;
  }

  Map<String, dynamic> toSnapchot() => {
       "nameStore": nameStore,
        "typeStore": typeStore,
        "mobileStore": mobileStore,
        "location": GeoPoint(
            location!.latitude,
            location!.longitude),
        "stateStore": stateStore,
        "imageStore": imageStore,
        "offer_value": offer_value,
        // "rating": rating,
        "idowner": idowner,
        "descStore": descStore,
        "IdStore": IdStore,
  // _data['products'] =
  // products!.map((e)=>e.toJson()).toList();
        //"itemstore": itemstore.map((e) => e.toJson()).toList(),
      };
  List<Rate> getproud(data) {
    // print(data["value_rate"].toString());
    List<Rate> prodlist = [];
    if(data!=null){
      print('data!=null'+data.length.toString());
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
    for(int i=0;i<listrate.length;i++)
    {
      print('value_rate in loop ' +listrate[i].value_rate.toString());
      switch(listrate[i].value_rate.toString()){
        case '1.0':
          star1++;
          break;
        case '2.0':
          star2++;
          break;
        case '3.0':
          star3++;
          break;
        case '4.0':
          star4++;
          break;
        case '5.0':
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
    print('star store model '+star2_2.toString());
    print('sumValues '+ sumValues.toString());
    double rataing=0.0;
    if(listrate.length!=0)
      rataing= sumValues/listrate.length;
    return rataing;
  }
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
        rate: json["rate"].toInt(),
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "rate": rate,
        "count": count,
      };
}
