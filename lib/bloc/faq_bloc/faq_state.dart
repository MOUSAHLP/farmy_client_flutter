abstract class FAQState {}

class FAQInit extends FAQState {}

class FAQSuccess extends FAQState {}

class FAQLoading extends FAQState {}

class FAQError extends FAQState {
  String error;
  FAQError(this.error);
}
