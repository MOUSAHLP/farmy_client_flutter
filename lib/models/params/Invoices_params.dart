// ignore_for_file: public_member_api_docs, sort_constructors_first
class InvoicesParams {
  int userAddressId;
  int deliveryMethodId;
  String? notes;
  String? time;
  String? couponCode;
  dynamic couponId;


  InvoicesParams({
    required this.userAddressId,
    required this.deliveryMethodId,
    this.notes = "",
    this.couponCode = "",
    this.couponId ="",
    required this.time,
  });
}
