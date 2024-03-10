

abstract class DetailsOrderEvent {
  DetailsOrderEvent([List props = const []]) : super();
}



class GetDetailsOrder extends DetailsOrderEvent {
  int id;
  GetDetailsOrder({required this.id});
}


