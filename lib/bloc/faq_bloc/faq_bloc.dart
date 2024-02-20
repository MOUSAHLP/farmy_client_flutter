import 'package:bloc/bloc.dart';
import 'package:pharma/bloc/faq_bloc/faq_event.dart';
import 'package:pharma/bloc/faq_bloc/faq_state.dart';
import 'package:pharma/data/repository/faq_repo.dart';
import 'package:pharma/models/faq_model.dart';

class FaqBloc extends Bloc<FaqEvent, FAQState> {
  FAQModel? faqModel;

  FaqBloc() : super(FAQInit()) {
    on<FaqEvent>((event, emit) async {
      if (event is GetFAQ) {
        emit(FAQLoading());
        var response = await FAQRepo.getFAQ();
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
