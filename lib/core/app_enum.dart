import 'package:flutter/cupertino.dart';

enum AuthenticationScreenStates {
  authenticationLoggedOut,
  authenticationAuthenticated,
  authenticationUnauthenticated,
  authenticationInitialized,
  authenticationEnd
}

enum DataType { api, cache }

enum ScreenState { initialized,loading, success, error }

enum ScreenStates { loading, error, success }
final navigatorKey = GlobalKey<NavigatorState>();

enum OrderStates {
  normalOrder,
  urgentOrder,
}

enum PaymentStates { cashPayment, farmyWallet }

const String mapKey="AIzaSyAX8XoECKD0-gnAaah67gR4akbUodB_8Ww";

enum ScreensAuth{
  signInScreen,
  phoneNumberScreen,
  otpConfirmationScreen,
  resetPasswordScreen

}