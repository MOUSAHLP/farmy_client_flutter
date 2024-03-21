import 'package:pharma/core/app_enum.dart';

abstract class RewardsActivityAndOffersEvent {
  RewardsActivityAndOffersEvent([List props = const []]) : super();
}

class GetActivityRewards extends RewardsActivityAndOffersEvent {}

class GetOffersRewards extends RewardsActivityAndOffersEvent {}

class GetMyCouponRewards extends RewardsActivityAndOffersEvent {}

class ChangeTabActivityEvent extends RewardsActivityAndOffersEvent {
  RewardsActivityStateEnum currentScreen;

  ChangeTabActivityEvent({required this.currentScreen});
}
