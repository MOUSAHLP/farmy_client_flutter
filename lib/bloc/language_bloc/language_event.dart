
abstract class LanguageEvent {
  LanguageEvent([List props = const []]) : super();
}

class NewLanguageChange extends LanguageEvent {
  String language;
  NewLanguageChange(this.language);
}
class SelectLanguage extends LanguageEvent {
  String language;
  SelectLanguage(this.language);
}

