class ForgetPasswordParams {
  String? phone;
  String? newPassword;
  String? newPasswordConfirm;

  ForgetPasswordParams({this.phone, this.newPassword, this.newPasswordConfirm});

  Map<String, dynamic> toJson() => {

        "phone": phone,
        "new_password": newPassword,
        "confirm_password": newPasswordConfirm,
      };
}
