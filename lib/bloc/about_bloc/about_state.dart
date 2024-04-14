abstract class AboutState {}

class FAQInit extends AboutState {}

class FAQSuccess extends AboutState {}

class FAQLoading extends AboutState {}

class FAQError extends AboutState {
  String error;
  FAQError(this.error);
}
