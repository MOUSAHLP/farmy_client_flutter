import 'package:pharma/core/app_enum.dart';

abstract class RewardsPointsEvent {
  RewardsPointsEvent([List props = const []]) : super();
}

class GetPointsRewards extends RewardsPointsEvent {}

class ChangeTabPointsRewardsEvent extends RewardsPointsEvent {
  RewardsPointsStateEnum currentScreen;
  ChangeTabPointsRewardsEvent({required this.currentScreen});
}
