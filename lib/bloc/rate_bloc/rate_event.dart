import 'package:pharma/models/rate_attribute.dart';

abstract class RateEvent {
  RateEvent([List props = const []]) : super();
}

class SubmitRate extends RateEvent {
  int orderId;
  double rate;
  List<SelectedRateAttribute> selectedAttribute;

  SubmitRate(
      {required this.rate,
      required this.orderId,
      required this.selectedAttribute});
}

class GetRateAttribute extends RateEvent {}
