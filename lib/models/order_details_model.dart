import 'package:pharma/models/product_response.dart';

class DetailsResponse {
  List<OrderDetailsModel>? homeCategoriesList;
  String? pdfUrl;
  int? total;
  int? subTotal;
  int? deliveryFee;
  int? extra_discount;
  int? tax;
  int? couponDiscount;

  DetailsResponse({
    this.homeCategoriesList,
    this.pdfUrl,
    this.total,
    this.subTotal,
    this.deliveryFee,
    this.extra_discount,
    this.tax,
    this.couponDiscount,
  });

  factory DetailsResponse.fromJson(Map<String, dynamic> json) {
    return DetailsResponse(
      homeCategoriesList: json["order_details"] == null
          ? []
          : List<OrderDetailsModel>.from(
              json["order_details"].map((x) => OrderDetailsModel.fromJson(x))),
      pdfUrl: json['pdf_url'],
      total: json['total'],
      subTotal: json['sub_total'],
      deliveryFee: json['delivery_fee'],
      extra_discount: json['extra_discount'],
      tax: json['tax'],
      couponDiscount: json['coupon_discount'],
    );
  }
}

class OrderDetailsModel {
  int id;
  String? orderNumber;
  String? status;
  int? quantity;
  String? price;
  ProductResponse? product;

  OrderDetailsModel({
    this.orderNumber,
    this.quantity,
    this.price,
    this.status,
    required this.id,
    this.product,
  });

  factory OrderDetailsModel.fromJson(Map<String, dynamic> json) {
    return OrderDetailsModel(
      id: json["id"],
      orderNumber: json["order_number"],
      status: json["status"],
      quantity: int.parse(json["quantity"].toString()),
      price: json["price"],
      product: ProductResponse.fromJson(json['product']),
    );
  }
  static List<OrderDetailsModel> listFromJson(List<dynamic>? json) {
    return json == null
        ? []
        : json.map((value) => OrderDetailsModel.fromJson(value)).toList();
  }
}
