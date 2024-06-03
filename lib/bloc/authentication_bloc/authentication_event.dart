import '../../core/app_enum.dart';
import '../../models/params/delete_account_params.dart';
import '../../models/params/login_params.dart';

abstract class AuthenticationEvent {
  AuthenticationEvent([List props = const []]) : super();
}

class AppStarted extends AuthenticationEvent {}
class ChangeLang extends AuthenticationEvent {}

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

  ConfirmOtp({required this.code, required this.phone}) : super([code, phone]);
}

class ForgetPassword extends AuthenticationEvent {
  final String password;
  final String repeatPassword;

  ForgetPassword({required this.password, required this.repeatPassword})
      : super([password, repeatPassword]);
}

class SignUp extends AuthenticationEvent {}

class ReSendCode extends AuthenticationEvent {
  String phone;

  ReSendCode({required this.phone});
}

class ChangeCheckPolice extends AuthenticationEvent {
  bool isCheck;

  ChangeCheckPolice(this.isCheck);
}

class DeleteAccount extends AuthenticationEvent {
  DeleteAccountParams deleteAccountParams;

  DeleteAccount({required this.deleteAccountParams});
}
class ResetPassword extends AuthenticationEvent {
  final String password;
  final String oldPassword;
  final String repeatPassword;
  ResetPassword({required this.password, required this.repeatPassword,required this.oldPassword})
      : super([password, repeatPassword,oldPassword]);
}