import 'package:pharma/models/payment_method_model.dart';
import 'package:pharma/models/user_address_response.dart';
import 'package:pharma/models/user_model.dart';

import 'delivery_method_model.dart';
import 'order_details_model.dart';

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
  List<OrderDetailsModel>? orderDetailsList;
  MyOrderResponse({this.orderNumber,
    this.total,
    this.date,
    this.status,
    required this.id,
    this.userAddress,
    this.user,
    this.deliveryMethod,
    this.paymentMethod,
    this.orderDetailsList
  });

  factory MyOrderResponse.fromJson(Map<String, dynamic> json) {
    return MyOrderResponse(
        id: json["id"],
        status: json["status"],
        total: json["total"] ,
        date: json["date"],
        orderNumber: json["order_number"] ,
        userAddress:UserAddressModel.fromJson(json['user_address']),
      user:UserModel.fromJson(json['user']),
      deliveryMethod:DeliveryMethodModel.fromJson(json['delivery_method']),
      paymentMethod:PaymentMethodModel.fromJson(json['delivery_method']),
        orderDetailsList:OrderDetailsModel.listFromJson(json['order_details'])
    );
  }

  static List<MyOrderResponse> listFromJson(List<dynamic>? json) {
    return json == null
        ? []
        : json.map((value) => MyOrderResponse.fromJson(value)).toList();
  }
}