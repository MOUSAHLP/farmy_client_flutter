import 'package:flutter/cupertino.dart';

enum AuthenticationScreenStates {
  authenticationLoggedOut,
  authenticationAuthenticated,
  authenticationUnauthenticated,
  authenticationInitialized,
  authenticationEnd,
  authenticationGuest
}

enum DataType { api, cache }

enum ScreenState { initialized, loadMoreData, loading, success, error }

enum ScreenStates { initialized, loading, error, success }

final navigatorKey = GlobalKey<NavigatorState>();

enum OrderStates {
  normalOrder,
  urgentOrder,
}

enum CompletePaymentStates { complete, loading, initialized, error }

enum PaymentStates { cashPayment, farmyWallet }

const String mapKey = "AIzaSyAX8XoECKD0-gnAaah67gR4akbUodB_8Ww";

enum ScreensAuth {
  signInScreen,
  phoneNumberScreen,
  otpConfirmationScreen,
  resetPasswordScreen
}

enum AddToBasketState { successAddedToBasket }

// Rewards Screen Enum
enum RewardsPointsStateEnum { usedPoints, endedpoints, earnedPoints }

enum RewardsActivityStateEnum { activity, offers }
