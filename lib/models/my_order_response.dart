import 'package:pharma/models/payment_method_model.dart';
import 'package:pharma/models/user_address_response.dart';
import 'package:pharma/models/user_model.dart';

import 'delivery_method_model.dart';

class MyOrderResponse {
  int id;
  String? orderNumber;
  String? status;
  String? total;
  String? date;
  UserAddressModel? userAddress;
  UserModel? user;
  DeliveryMethodModel? deliveryMethod;
  PaymentMethodModel? paymentMethod;

  MyOrderResponse({this.orderNumber,
    this.total,
    this.date,
    this.status,
    required this.id,
    this.userAddress,
    this.user,
    this.deliveryMethod,
    this.paymentMethod,
  });
  factory MyOrderResponse.fromJson(Map<String, dynamic> json) {
    return MyOrderResponse(
        id: json["id"],
        orderNumber: json["order_number"] ,
        status: json["status"],
        paymentMethod:PaymentMethodModel.fromJson(json['payment_method']),
        userAddress:UserAddressModel.fromJson(json['user_address']),
        total: json["total"] ,
    date: json["date"],
      deliveryMethod:DeliveryMethodModel.fromJson(json['delivery_method']),
    );
  }
  static List<MyOrderResponse> listFromJson(List<dynamic>? json) {
    return json == null
        ? []
        : json.map((value) => MyOrderResponse.fromJson(value)).toList();
  }
}