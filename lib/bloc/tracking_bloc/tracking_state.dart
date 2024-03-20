abstract class TrackingState {}

class TrackingInit extends TrackingState {}

class TrackingSuccess extends TrackingState {}

class TrackingLoading extends TrackingState {}

class TrackingUpdate extends TrackingState {}

class TrackingError extends TrackingState {
  String error;

  TrackingError(this.error);
}
