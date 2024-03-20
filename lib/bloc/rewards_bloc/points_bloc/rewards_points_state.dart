abstract class RewardsPointsHistoryState {}

class RewardsPointsInit extends RewardsPointsHistoryState {}

class RewardsPointsHistoryLoading extends RewardsPointsHistoryState {}

class RewardsPointsHistoryLoaded extends RewardsPointsHistoryState {}

class RewardsPointsHistorySuccess extends RewardsPointsHistoryState {}

class RewardsTabPointsHistoryChanged extends RewardsPointsHistoryState {}

class RewardsPointsHistoryError extends RewardsPointsHistoryState {
  String error;
  RewardsPointsHistoryError(this.error);
}


extension RewardsGuideStateExtension on RewardsPointsHistoryState {
  bool get isLoading => this is RewardsPointsHistoryLoading;

  bool get isSuccess => this is RewardsPointsHistorySuccess;

}
