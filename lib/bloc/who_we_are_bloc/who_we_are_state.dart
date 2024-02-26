abstract class WhoWeAreState {}

class WhoWeAreInit extends WhoWeAreState {}

class WhoWeAreSuccess extends WhoWeAreState {}

class WhoWeAreLoading extends WhoWeAreState {}

class WhoWeAreError extends WhoWeAreState {
  String error;
  WhoWeAreError(this.error);
}
