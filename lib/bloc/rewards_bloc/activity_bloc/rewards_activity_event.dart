import 'package:pharma/core/app_enum.dart';

abstract class RewardsActivityEvent {
  RewardsActivityEvent([List props = const []]) : super();
}

class GetActivityRewards extends RewardsActivityEvent {}

class ChangeTabActivityEvent extends RewardsActivityEvent {
  RewardsActivityStateEnum currentScreen;
  ChangeTabActivityEvent({required this.currentScreen});
}
