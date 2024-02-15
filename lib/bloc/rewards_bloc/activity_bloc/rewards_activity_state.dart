abstract class RewardsActivityState {}

class RewardsActivityLoading extends RewardsActivityState {}

class RewardsActivityInit extends RewardsActivityState {}

class RewardsActivityTabChanged extends RewardsActivityState {}

class RewardsActivityError extends RewardsActivityState {
  String error;
  RewardsActivityError(this.error);
}
