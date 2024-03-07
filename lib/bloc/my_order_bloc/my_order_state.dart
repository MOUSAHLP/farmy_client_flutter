import 'package:pharma/models/my_order_response.dart';

abstract class MyOrderState {}

class MyOrderLoading extends MyOrderState {}

class MyOrderError extends MyOrderState {
  String error;
  MyOrderError(this.error);
}

class MyOrderSuccess extends MyOrderState {
  List<MyOrderResponse> myOrderList;
  MyOrderSuccess(this.myOrderList);
}