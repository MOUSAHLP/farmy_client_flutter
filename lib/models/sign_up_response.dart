// ignore: depend_on_referenced_packages

class SignUpResponse {

  int id;

  String firstName;

  String lastName;

  String phone;
  SignUpResponse({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phone,





  });

  factory SignUpResponse.fromJson(Map<String, dynamic> json) => SignUpResponse(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        phone: json["phone"],



      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "phone": phone,
      };
}
