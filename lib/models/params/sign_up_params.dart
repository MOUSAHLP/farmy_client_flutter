class SignUpParams {
  String? fName;
  String? lName;
  String? phone;
  String? email;
  String? password;
  String? confirmPassword;


  SignUpParams({
    this.fName,
    this.lName,
    this.phone,
    this.email,
    this.password,
    this.confirmPassword,

  });

  Map<String, dynamic> toJson() => {
        "first_name": fName,
        "last_name": lName,
        "phone": phone,

        "password": password,
    "password_confirmation": confirmPassword,
      };
}
