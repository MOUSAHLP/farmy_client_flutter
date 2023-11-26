import 'package:flutter/cupertino.dart';

enum AuthenticationScreenStates {
  authenticationLoggedOut,
  authenticationAuthenticated,
  authenticationUnauthenticated,
  authenticationInitialized,
  authenticationEnd
}

enum DataType { api, cache }

enum ScreenState { loading, success, error }

enum ScreenStates { loading, error, success }
final navigatorKey = GlobalKey<NavigatorState>();
const String mapKey="AIzaSyAX8XoECKD0-gnAaah67gR4akbUodB_8Ww";