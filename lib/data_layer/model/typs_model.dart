class TypsModel {
  String name;
  String image;

  TypsModel({
    required this.name,
    required this.image,
  });

  factory TypsModel.fromJson(Map<String, dynamic> json) => TypsModel(
        name: json["name"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
      };
}
