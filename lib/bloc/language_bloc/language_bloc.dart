
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/data_resource/local_resource/data_store.dart';
import 'language_event.dart';
import 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
String lang=DataStore.instance.lang;
  LanguageBloc() : super(LanguageInit()) {
    on<LanguageEvent>((event, emit) async {
      if (event is NewLanguageChange) {
        DataStore.instance.setLang(event.language);
        lang=event.language;
        emit(NewLanguage(event.language));
      }
      if (event is SelectLanguage) {
        lang=event.language;
        emit(NewLanguage(event.language));
      }
    });
  }
}
