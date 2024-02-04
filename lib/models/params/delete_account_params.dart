class DeleteAccountParams {
  String? phone;
  String? password;
  String? deleteReason;
  DeleteAccountParams({this.phone, this.password,this.deleteReason});
  Map<String, dynamic> toJson() => {
    "phone": phone,
    "password": password,
    "delete_reason": deleteReason,
  };
}