
abstract class OnBoardingEvent {
  OnBoardingEvent([List props = const []]) : super();
}

class OnPressedSkip extends OnBoardingEvent {
  OnPressedSkip();
}
class ChangeIndex extends OnBoardingEvent{
  int index;
  ChangeIndex(this.index);
}
