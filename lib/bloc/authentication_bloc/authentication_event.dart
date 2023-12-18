

import '../../core/app_enum.dart';
import '../../models/params/login_params.dart';

abstract class AuthenticationEvent {
  AuthenticationEvent([List props = const []]) : super();
}

class AppStarted extends AuthenticationEvent {}
class LoggedGuest extends AuthenticationEvent {}
class TapOnPressed extends AuthenticationEvent {
  ScreensAuth index;
  TapOnPressed(this.index);
}
class LoggedOut extends AuthenticationEvent {}
class Login extends AuthenticationEvent {
  final LoginParams loginParams;
  Login({required this.loginParams}) : super([loginParams]);
}
class RequestOtp extends AuthenticationEvent {
  final String phoneNumber;
  RequestOtp({required this.phoneNumber}) : super([phoneNumber]);
}
class ConfirmOtp extends AuthenticationEvent {
  final String phone;
  final String code;
  ConfirmOtp({required this.code,required this.phone}) : super([code,phone]);
}
class ForgetPassword extends AuthenticationEvent {
  final String password;
  final String repeatPassword;
  ForgetPassword({required this.password, required this.repeatPassword})
      : super([password, repeatPassword]);
}
class SignUp extends AuthenticationEvent {}