abstract class ReturnOrderEvent {
  ReturnOrderEvent([List props = const []]) : super();
}

class SubmitReturnOrder extends ReturnOrderEvent {
  double returnOrder;

  SubmitReturnOrder({required this.returnOrder});
}
