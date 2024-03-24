import 'package:pharma/core/app_enum.dart';

abstract class RewardsPointsEvent {
  RewardsPointsEvent([List props = const []]) : super();
}

class GetRewardsPointsHistoryUsed extends RewardsPointsEvent {}

class GetRewardsPointsHistoryValid extends RewardsPointsEvent {}

class GetRewardsPointsHistoryExpired extends RewardsPointsEvent {}

class ChangeStatusScreen extends RewardsPointsEvent {}

class ChangeTabPointsRewardsEvent extends RewardsPointsEvent {
  RewardsPointsStateEnum currentScreen;

  ChangeTabPointsRewardsEvent({required this.currentScreen});
}
