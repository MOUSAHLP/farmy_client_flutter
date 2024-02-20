abstract class ConditionsState {}

class ConditionsInit extends ConditionsState {}

class ConditionsSuccess extends ConditionsState {}

class ConditionsLoading extends ConditionsState {}

class ConditionsError extends ConditionsState {
  String error;
  ConditionsError(this.error);
}
