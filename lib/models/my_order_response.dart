import 'package:pharma/models/payment_method_model.dart';
import 'package:pharma/models/user_address_response.dart';
import 'package:pharma/models/user_model.dart';

import 'delivery_method_model.dart';

class MyOrderResponse {
  int id;
  int? orderNumber;
  String? status;
  int? total;
  String? date;
  UserAddressModel? userAddress;
  UserModel? user;
  DeliveryMethodModel? deliveryMethod;
  PaymentMethodModel? paymentMethod;
  int expectedTime;
  double? rate;

  MyOrderResponse({
    this.orderNumber,
    this.total,
    this.date,
    this.status,
    required this.id,
    this.userAddress,
    this.user,
    this.deliveryMethod,
    this.paymentMethod,
    required this.expectedTime,
    this.rate
  });

  factory MyOrderResponse.fromJson(Map<String, dynamic> json) {
    return MyOrderResponse(
      id: json["id"],
      orderNumber: json["order_number"],
      status: json["status"],
      expectedTime: json["expected_time"],
      paymentMethod: PaymentMethodModel.fromJson(json['payment_method']),
      userAddress: UserAddressModel.fromJson(json['user_address']),
      total: json["total"],
      date: json["date"],
      deliveryMethod: DeliveryMethodModel.fromJson(json['delivery_method']),
      rate:double.parse(json["rate"].toString())
    );
  }

  static List<MyOrderResponse> listFromJson(List<dynamic>? json) {
    return json == null
        ? []
        : json.map((value) => MyOrderResponse.fromJson(value)).toList();
  }
}
