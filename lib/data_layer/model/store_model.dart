import 'package:cloud_firestore/cloud_firestore.dart';

class StoreModel {
  String nameStore;
  String typeStore;
  String mobileStore;
  String location;
  //Rating rating;

  // String get name => nameStore;
  // String get type => typeStore;
  // String get mobile => mobileStore;
  // String get locationnam => location;

  StoreModel({
    required this.nameStore,
    required this.typeStore,
    required this.mobileStore,
    required this.location,
    // required this.rating,
  });
  factory StoreModel.fromSnapshot(QueryDocumentSnapshot doc) {
    return StoreModel(
      nameStore: doc['nameStore'],
      typeStore: doc['typeStore'],
      mobileStore: doc['mobileStore'],
      location: doc['location'],
    );
  }

  Map<String, dynamic> toSnapchot() => {
        "nameStore": nameStore,
        "typeStore": typeStore,
        "mobileStore": mobileStore,
        "location": location
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
