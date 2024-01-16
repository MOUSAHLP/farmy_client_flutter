abstract class MyOrderEvent {
  MyOrderEvent([List props = const []]) : super();
}

class GetMyOrder extends MyOrderEvent {
  GetMyOrder();
}

