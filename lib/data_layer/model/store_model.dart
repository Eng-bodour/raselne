class StoreMoel {
  String nameStore;
  String typeStore;
  List<String> mobileStore;
  String location;
  Rating rating;

  StoreMoel({
    required this.nameStore,
    required this.typeStore,
    required this.mobileStore,
    required this.location,
    required this.rating,
  });

  factory StoreMoel.fromJson(Map<String, dynamic> json) => StoreMoel(
        nameStore: json["nameStore"],
        typeStore: json["typeStore"],
        mobileStore: json["mobileStore"],
        location: json["location"],
        rating: Rating.fromJson(json["rating"]),
      );

  Map<String, dynamic> toJson() => {
        "nameStore": nameStore,
        "typeStore": typeStore,
        "mobileStore": mobileStore,
        "location": location,
        "rating": rating.toJson(),
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
