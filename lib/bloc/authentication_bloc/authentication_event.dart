

import '../../core/app_enum.dart';

abstract class AuthenticationEvent {
  AuthenticationEvent([List props = const []]) : super();
}

class AppStarted extends AuthenticationEvent {}
class TapOnPressed extends AuthenticationEvent {
  ScreensAuth index;
  TapOnPressed(this.index);
}

