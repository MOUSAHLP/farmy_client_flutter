import 'package:equatable/equatable.dart';

import '../../core/app_enum.dart';


class AuthenticationState extends Equatable {
  ScreensAuth indexTap;
  AuthenticationState({this.indexTap = ScreensAuth.signInScreen});
  AuthenticationState copyWith({
    ScreensAuth?index}) {
    return AuthenticationState(indexTap: index??indexTap);
  }
  @override
  List<Object> get props => [
    identityHashCode(this),
    indexTap];
}
