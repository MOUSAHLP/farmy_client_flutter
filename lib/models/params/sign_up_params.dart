class SignUpParams {
  String? fName;
  String? lName;
  String? phone;
  String? email;
  String? password;


  SignUpParams({
    this.fName,
    this.lName,
    this.phone,
    this.email,
    this.password,
   
  });

  Map<String, dynamic> toJson() => {
        "first_name": fName,
        "last_name": lName,
        "phone": phone,
        "email": email,
        "password": password,
      };
}
