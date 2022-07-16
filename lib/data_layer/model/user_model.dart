class UserModel {
  String name;
  String email;
  double mobile;

  UserModel({
    required this.name,
    required this.email,
    required this.mobile,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json["name"].toDouble(),
        email: json["email"],
        mobile: json["mobile"],
      );
  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "mobile": mobile,
      };
}
