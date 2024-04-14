class LoginParams {
  String? phone;
  String? password;
  String? deviceToken;

  LoginParams({this.phone, this.password,this.deviceToken});

  Map<String, dynamic> toJson() => {
        "phone": phone,
        "password": password,
        "fcm_token": deviceToken,
      };
}
