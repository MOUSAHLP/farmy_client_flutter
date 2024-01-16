

class UserModel {
  int? id;

  String? userName;
  String? phone;
  String? email;

  UserModel({
    this.phone,
    this.email,
    this.userName,
    this.id,

  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"],
      userName: json["username"],
      phone: json["phone"] ,
      email: json["email"],


    );
  }

}