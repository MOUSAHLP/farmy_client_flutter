abstract class RewardsGuideState {}

class RewardsGuideLoading extends RewardsGuideState {}

class RewardsGuideMemberShipLoading extends RewardsGuideState {}

class RewardsGuideInit extends RewardsGuideState {}

class RewardsGuideTabChanged extends RewardsGuideState {}

class RewardsGuideError extends RewardsGuideState {
  String error;

  RewardsGuideError(this.error);
}

class RewardsGuideSuccess extends RewardsGuideState {}

class RewardsGuideMemberShipSuccess extends RewardsGuideState {}

extension RewardsGuideStateExtension on RewardsGuideState {
  bool get isLoading => this is RewardsGuideLoading;

  bool get isSuccess => this is RewardsGuideSuccess;

  bool get isSuccessMemberShip => this is RewardsGuideMemberShipSuccess;

  bool get isLoadingMemberShip => this is RewardsGuideMemberShipLoading;

  bool get isError => this is RewardsGuideError;
}
