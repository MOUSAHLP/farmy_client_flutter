// ignore_for_file: public_member_api_docs, sort_constructors_first
class InvoicesResponse {
  int? total;
  int? couponValue;
  int? deliveryValue;
  dynamic taxes;
  dynamic tax;
  int? subTotal;
  int? extraDiscount;

  InvoicesResponse({
    this.total,
    this.couponValue,
    this.deliveryValue,
    this.taxes,
    this.tax,
    this.subTotal,
    this.extraDiscount,
  });

  factory InvoicesResponse.formJson(Map<String, dynamic> json) {
    return InvoicesResponse(
      subTotal: json["subtotal"],
      couponValue: json["coupon_price"],
      deliveryValue: json["delivery_price"],
      taxes: json["taxes"],
      tax: json["tax"],
      total: json["total"],
      extraDiscount: json["extra_discount"],
    );
  }
}
