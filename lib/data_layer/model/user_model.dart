//for move between screen class user

class UserPrivate {
  final String? name;
  final String? uid;
  UserPrivate({this.uid, this.name});
}

class UserModel {
  int? id;
  String name;
  String email;
  int mobile;

  UserModel({
    this.id,
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
