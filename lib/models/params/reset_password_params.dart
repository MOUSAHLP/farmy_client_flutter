class ResetPasswordParams {

  String? password;
  String? repeatPassword;
  String? oldPassword;

  ResetPasswordParams({ this.password, this.repeatPassword,this.oldPassword});

  Map<String, dynamic> toJson() => {
    "old_password":oldPassword,
        "password": password,
        "password_confirmation": repeatPassword,

      };
}
