abstract class PrivacyState {}

class PrivacyInit extends PrivacyState {}

class PrivacySuccess extends PrivacyState {}

class PrivacyLoading extends PrivacyState {}

class PrivacyError extends PrivacyState {
  String error;
  PrivacyError(this.error);
}
