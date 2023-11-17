
import 'package:flutter_bloc/flutter_bloc.dart';
import 'authentication_event.dart';
import 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {


  AuthenticationBloc(

  ) : super( AuthenticationState()) {
    on<AuthenticationEvent>((event, emit) async {
      if (event is TapOnPressed) {

        emit(state.copyWith(
            index: event.index,
           ));
      }
    });
  }
}
