abstract class RewardsActivityAndOffersState {}

class RewardsActivityAndOffersLoading extends RewardsActivityAndOffersState {}

class RewardsActivityAndOffersSuccess extends RewardsActivityAndOffersState {}

class RewardsActivityAndOffersInit extends RewardsActivityAndOffersState {}

class RewardsActivityAndOffersTabChanged extends RewardsActivityAndOffersState {}

class RewardsActivityAndOffersError extends RewardsActivityAndOffersState {
  String error;

  RewardsActivityAndOffersError(this.error);
}

extension RewardsActivityAndOffersStateExtension on RewardsActivityAndOffersState {

  bool get isLoading => this is RewardsActivityAndOffersLoading;
  bool get isSuccess => this is RewardsActivityAndOffersSuccess;
}
