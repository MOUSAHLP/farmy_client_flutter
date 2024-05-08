abstract class TrackingState {}

class TrackingInit extends TrackingState {}

class TrackingSuccess extends TrackingState {}

class TrackingLoading extends TrackingState {}

class TrackingUpdate extends TrackingState {}

class TrackingError extends TrackingState {
  String error;

  TrackingError(this.error);
}

class GetVerifyCodeLoading extends TrackingState{}
class GetVerifyCodeSuccess extends TrackingState{
  final String code;
  GetVerifyCodeSuccess({required this.code});
}
class GetVerifyCodeError extends TrackingState{
  String error;
  GetVerifyCodeError(this.error);
}