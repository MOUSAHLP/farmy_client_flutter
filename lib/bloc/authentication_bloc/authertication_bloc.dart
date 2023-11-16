import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/app_router/app_router.dart';
import '../../core/services/services_locator.dart';
import '../../data/data_resource/local_resource/datastore_keys.dart';

import '../../presentation/screens/auth_screen/account_screen.dart';

import 'authentication_event.dart';
import 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {


  AuthenticationBloc(

  ) : super( AuthenticationState()) {
    on<AuthenticationEvent>((event, emit) async {
      if (event is TapOnPressed) {
        print("event.index");
        print(event.index);
        emit(state.copyWith(
            index: event.index,
           ));
      }
    });
  }
}
