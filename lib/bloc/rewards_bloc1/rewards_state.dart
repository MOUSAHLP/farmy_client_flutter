abstract class RewardsState {}

class RewardsLoading extends RewardsState {}

class RewardsInit extends RewardsState {}

class RewardsTabPointsHistoryChanged extends RewardsState {}

class RewardsTabActivityChanged extends RewardsState {}

class RewardsError extends RewardsState {
  String error;
  RewardsError(this.error);
}
