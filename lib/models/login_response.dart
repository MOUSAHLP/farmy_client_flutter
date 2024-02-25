// ignore: depend_on_referenced_packages
import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart';

part 'login_response.g.dart';

@HiveType(typeId: 1)
class LoginResponse {
  @HiveField(0)
  int id;
  @HiveField(1)
  String firstName;
  @HiveField(2)
  String lastName;
  @HiveField(3)
  String phone;
  @HiveField(4)
  String? email;
  @HiveField(5)
  String? address;
  @HiveField(6)
  String? token;
  @HiveField(7)
  dynamic roleId;
  @HiveField(8)
  dynamic status;
  @HiveField(9)
  DateTime? birthday;
  LoginResponse({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phone,
    this.status,
    this.address,
    this.token,
    this.email,
    this.roleId,
    this.birthday
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        id: json['user']["id"],
        firstName: json['user']["first_name"],
        lastName: json['user']["last_name"],
        phone: json['user']["phone"],
        status: json['user']["status"],
        address: json['user']["address"],
        email: json['user']["email"],
        roleId: json['user']["role_id"],
        birthday:DateFormat("yyyy-MM-dd").parse(json['user']["birthday"]) ,
        token: json['token'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "phone": phone,
      };
}
