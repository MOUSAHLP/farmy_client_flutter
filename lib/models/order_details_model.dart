

import 'package:pharma/models/product_details_response.dart';
import 'package:pharma/models/product_model.dart';
class OrderDetailsModel {
  int id;
  String? orderNumber;
  String? status;
  String? quantity;
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
      orderNumber: json["order_number"] ,
      status: json["status"],
      quantity: json["quantity"] ,
      price: json["price"],
      product:ProductResponse.fromJson(json['product']),

    );
  }
  static List<OrderDetailsModel> listFromJson(List<dynamic>? json) {
    return json == null
        ? []
        : json.map((value) => OrderDetailsModel.fromJson(value)).toList();
  }
}