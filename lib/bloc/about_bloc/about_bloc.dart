import 'package:bloc/bloc.dart';
import 'package:pharma/data/repository/faq_repo.dart';
import 'package:pharma/models/faq_model.dart';

import 'about_event.dart';
import 'about_state.dart';

class AboutBloc extends Bloc<AboutEvent, AboutState> {
  FAQModel? faqModel;

  AboutBloc() : super(FAQInit()) {
    on<AboutEvent>((event, emit) async {
      if (event is GetAbout) {
        emit(FAQLoading());
        var response = await FAQRepo.getAbout();
        response.fold((l) {
          emit(FAQError(l));
        }, (r) {
          faqModel = r;
          emit(FAQSuccess());
        });
      }
    });
  }
}
