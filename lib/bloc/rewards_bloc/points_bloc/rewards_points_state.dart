abstract class RewardsPointsState {}

class RewardsPointsInit extends RewardsPointsState {}

class RewardsPointsLoading extends RewardsPointsState {}

class RewardsPointsLoaded extends RewardsPointsState {}

class RewardsTabPointsHistoryChanged extends RewardsPointsState {}

class RewardsPointsError extends RewardsPointsState {
  String error;
  RewardsPointsError(this.error);
}
