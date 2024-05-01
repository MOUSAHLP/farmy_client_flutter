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
  String? pdfUrl;

  InvoiceModel({
    required this.id,
   required this.orderNumber,
    this.date,
    this.userAddress,

    this.deliveryFee,
    this.couponDiscount,
    this.subTotal,
    this.total,
    this.pdfUrl
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
          pdfUrl: json['pdf_url']
      );

  static List<InvoiceModel> listFromJson( List<dynamic> json){
    return json.map((value) =>InvoiceModel.fromJson(value) ).toList();
  }
}