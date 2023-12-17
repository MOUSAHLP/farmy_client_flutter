import 'package:equatable/equatable.dart';

import '../../core/app_enum.dart';

class AuthenticationState extends Equatable {
  final AuthenticationScreenStates authenticationScreen;
  ScreensAuth indexTap;
  final String? error;
  final bool isLoading;
  final bool sentOtp;

  final  bool resetPassword;
  final  bool signIn;
  final bool confirmOtp;
  final bool changePasswordSuccess;
  final  String selectGender;


   AuthenticationState({
    this.indexTap = ScreensAuth.signInScreen,
    this.authenticationScreen =
        AuthenticationScreenStates.authenticationInitialized,
    this.error,
    this.isLoading = false,

    this.sentOtp = false,
    this.confirmOtp = false,
    this.resetPassword = false,
    this.signIn = false,
    this.changePasswordSuccess = false,
    this.selectGender = '',
  });

  AuthenticationState copyWith({
    AuthenticationScreenStates? authenticationScreenStates,
    String? error,
    ScreensAuth?index,
    bool? isLoading,
    bool? sendOtp,
    bool? confirmOtp,
    bool? resetPassword,
    bool? signIn,
    bool? isSuccess,
    bool? loggedIn,
    String? selectGender

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
      signIn: signIn ?? this.signIn,
      selectGender: selectGender ?? '',
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
    signIn,
    selectGender
  ];
}
