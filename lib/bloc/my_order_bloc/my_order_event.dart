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




