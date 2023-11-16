

abstract class AuthenticationEvent {
  AuthenticationEvent([List props = const []]) : super();
}

class AppStarted extends AuthenticationEvent {}
class TapOnPressed extends AuthenticationEvent {
  int index;
  TapOnPressed(this.index);
}

