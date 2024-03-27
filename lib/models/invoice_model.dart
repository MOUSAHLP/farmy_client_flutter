import 'package:pharma/models/user_address_response.dart';

class InvoiceModel {
  int id;
  int orderNumber;
  DateTime? date;
  UserAddressModel? userAddress;
  int? deliveryFee;
  int? couponDiscount;
  int? subTotal;
  int? total;

  InvoiceModel({
    required this.id,
   required this.orderNumber,
    this.date,
    this.userAddress,

    this.deliveryFee,
    this.couponDiscount,
    this.subTotal,
    this.total,
  });

  factory InvoiceModel.fromJson(Map<String, dynamic> json) =>
      InvoiceModel(
        id: json["id"],
        orderNumber: json["order_number"],
        date: DateTime.parse(json["date"]),
        userAddress: UserAddressModel.fromJson(json["user_address"]),
        deliveryFee: json["delivery_fee"],
        couponDiscount: json["coupon_discount"],
        subTotal: json["sub_total"],
        total: json["total"],
      );

  static List<InvoiceModel> listFromJson( List<dynamic> json){
    return json.map((value) =>InvoiceModel.fromJson(value) ).toList();
  }
}