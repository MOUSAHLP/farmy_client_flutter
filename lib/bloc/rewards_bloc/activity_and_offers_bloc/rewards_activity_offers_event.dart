import 'package:pharma/core/app_enum.dart';
import 'package:pharma/models/params/rewards_by_coupon_params.dart';

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


class BuyCoupon extends RewardsActivityAndOffersEvent {
  final BuyCouponParams buyCouponParams;

  BuyCoupon({required this.buyCouponParams});
}
