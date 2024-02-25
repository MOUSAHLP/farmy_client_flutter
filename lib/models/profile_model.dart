import 'package:intl/intl.dart';

class ProfileModel {
  int? id;
  String? fName;
  String? email;
  String? lName;
  String? phone;
  DateTime? birthday;
  ProfileModel({
    this.id,
    this.fName,
    this.email,
    this.lName,
    this.phone,
    this.birthday,

  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        id: json['user']["id"],
        fName: json['user']["name"],
        email: json['user']["email"],
        lName: json['user']["email_verified_at"],
        phone: json['user']["phone"],
       birthday: DateTime.parse(json['user']["birthday"]),
      );

  Map<String, dynamic> toJson() => {
      //  "id": id,
        "first_name": fName,
        "email": email,
        "last_name": lName,
        "phone": phone,
         "birthday":birthday!=null? DateFormat('yyyy-MM-dd').format(birthday!):birthday,

      };
}
