import '../../models/params/product_model.dart';

abstract class MyOrderEvent {
  MyOrderEvent([List props = const []]) : super();
}

class GetMyOrder extends MyOrderEvent {
  GetMyOrder();
}

class DeleteOrder extends MyOrderEvent {
  int id;

  DeleteOrder({required this.id});
}

class TapOnPressed extends MyOrderEvent {
  int index;

  TapOnPressed(this.index);
}

class DeleteBasket extends MyOrderEvent {
  int idBasket;

  DeleteBasket({required this.idBasket});
}

class ShowBasket extends MyOrderEvent {
  List<Product> idProducts;
  int idBasket;

  ShowBasket({
    required this.idProducts,
    required this.idBasket,
  });
}

class GetCartPrice extends MyOrderEvent {
  GetCartPrice();
}

class AddCountOrder extends MyOrderEvent {
  int id;

  AddCountOrder(this.id);
}

class MinusCountOrder extends MyOrderEvent {
  int id;

  MinusCountOrder(this.id);
}

class DeleteProductOrder extends MyOrderEvent {
  int id;

  DeleteProductOrder(this.id);
}

class PaymentProcessBasket extends MyOrderEvent {
  int id;

  PaymentProcessBasket(this.id);
}

class GetOrderHistory extends MyOrderEvent {
  GetOrderHistory();
}

class ChangStateToSuccessConfirm extends MyOrderEvent {
  ChangStateToSuccessConfirm();
}
