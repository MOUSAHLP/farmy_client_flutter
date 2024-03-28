
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma/data/repository/contact_us_repo.dart';

part 'contact_us_event.dart';

part 'contact_us_state.dart';

class ContactUsBloc extends Bloc<ContactUsEvent, ContactUsState> {
  ContactUsBloc()
      : super(const ContactUsState(
          isLoading: false,
          isSuccess: false,
          isError: '',
        )) {
    on<ContactUsEvent>((event, emit) async {
      if (event is SentInfo) {
        emit(state.copyWith(isLoading: true));
        var response = await ContactUsRepo.contactUs(
          email: event.email,
          notes: event.notes,
        );

        response.fold(
          (l) => emit(
            state.copyWith(isError: l),
          ),
          (r) => emit(
            state.copyWith(isSuccess: true, isError: r.message),
          ),
        );
      }
      // TODO: implement event handler
    });
  }
}
