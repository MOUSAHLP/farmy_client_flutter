import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharma/bloc/privacy_bloc/privacy_event.dart';
import 'package:pharma/bloc/privacy_bloc/privacy_state.dart';
import 'package:pharma/data/repository/privacy_repo.dart';
import 'package:pharma/models/privacy_model.dart';

class PrivacyBloc extends Bloc<PrivacyEvent, PrivacyState> {
  PrivacyModel? privacyModel;

  PrivacyBloc() : super(PrivacyInit()) {
    on<PrivacyEvent>(
      (event, emit) async {
        if (event is GetPrivacy) {
          emit(PrivacyLoading());
          var response = await PrivacyRepo.getPrivacy();
          response.fold((l) {
            emit(PrivacyError(l));
          }, (r) {
            privacyModel = r;
            emit(PrivacySuccess());
          });
        }
      },
    );
  }
}
