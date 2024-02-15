abstract class RewardsPointsState {}

class RewardsPointsLoading extends RewardsPointsState {}

class RewardsPointsInit extends RewardsPointsState {}

class RewardsTabPointsHistoryChanged extends RewardsPointsState {}

class RewardsPointsError extends RewardsPointsState {
  String error;
  RewardsPointsError(this.error);
}
