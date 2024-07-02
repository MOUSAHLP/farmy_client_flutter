abstract class DetailsOrderEvent {
  DetailsOrderEvent([List props = const []]) : super();
}

class ShowDetailsOrder extends DetailsOrderEvent {
  int id;
  ShowDetailsOrder({required this.id});
}

class EditDetailsOrder extends DetailsOrderEvent {
  int id;
  EditDetailsOrder({required this.id});
}

class AddCount extends DetailsOrderEvent {
  int id;

  AddCount(this.id);
}

class MinusCount extends DetailsOrderEvent {
  int id;

  MinusCount(this.id);
}

class DeleteProduct extends DetailsOrderEvent {
  int id;

  DeleteProduct(this.id);
}

class ReturnProduct extends DetailsOrderEvent {
  int id;

  ReturnProduct(this.id);
}

class UnReturnProduct extends DetailsOrderEvent {
  int id;

  UnReturnProduct(this.id);
}

class OrderReturnProducts extends DetailsOrderEvent {
  int id;
  OrderReturnProducts({required this.id});
}
