abstract class RewardsRankState {}

class RewardsRankLoading extends RewardsRankState {}

class RewardsRankInit extends RewardsRankState {}

class RewardsRankTabChanged extends RewardsRankState {}

class RewardsRankError extends RewardsRankState {
  String error;
  RewardsRankError(this.error);
}
