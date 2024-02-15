abstract class RateEvent {
  RateEvent([List props = const []]) : super();
}

class SubmitRate extends RateEvent {
  double rate;

  SubmitRate({required this.rate});
}
