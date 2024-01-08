import 'package:equatable/equatable.dart';

import '../../core/app_enum.dart';

class AuthenticationState extends Equatable {
  final AuthenticationScreenStates authenticationScreen;
  ScreensAuth indexTap;
  final String? error;
  final bool isLoading;
  final bool sentOtp;

  final  bool resetPassword;
  final  bool signUp;
  final bool confirmOtp;
  final bool changePasswordSuccess;
  final  bool isReSend;


   AuthenticationState({
    this.indexTap = ScreensAuth.signInScreen,
    this.authenticationScreen =
        AuthenticationScreenStates.authenticationInitialized,
    this.error,
    this.isLoading = false,

    this.sentOtp = false,
    this.confirmOtp = false,
    this.resetPassword = false,
    this.signUp = false,
    this.changePasswordSuccess = false,
    this.isReSend = false,
  });

  AuthenticationState copyWith({
    AuthenticationScreenStates? authenticationScreenStates,
    String? error,
    ScreensAuth?index,
    bool? isLoading,
    bool? sendOtp,
    bool? confirmOtp,
    bool? resetPassword,
    bool? signUp,
    bool? isSuccess,
    bool? loggedIn,
    bool? isReSend

  }) {
    return AuthenticationState(
      authenticationScreen:
      authenticationScreenStates ??authenticationScreen,
      error: error,
      isLoading: isLoading ?? false,
      indexTap: index??indexTap,
      changePasswordSuccess: isSuccess ?? false,
      sentOtp: sendOtp ?? false,
      confirmOtp: confirmOtp ?? false,
      resetPassword: resetPassword ?? false,
      signUp: signUp ?? this.signUp,
      isReSend: isReSend ?? false,
    );
  }

  @override
  List<Object> get props => [
    identityHashCode(this),
    authenticationScreen,
    indexTap,
    error ?? '',
    isLoading,
    changePasswordSuccess,
    sentOtp,
    confirmOtp,
    resetPassword,
    signUp,
    isReSend
  ];
}
