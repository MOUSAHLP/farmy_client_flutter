import 'package:bloc/bloc.dart';
import 'package:pharma/bloc/setting_bloc/setting_event.dart';
import 'package:pharma/bloc/setting_bloc/setting_state.dart';
import 'package:pharma/data/repository/setting_repo.dart';
import 'package:pharma/models/setting_model.dart';

class SettingBloc extends Bloc<SettingEvent, SettingState> {
    SettingModel? settingModel;

  SettingBloc() : super(SettingInit()) {
    on<SettingEvent>(
      (event, emit) async {
        if (event is GetSetting) {
          emit(SettingLoading());
          var response = await SettingRepo.getSetting();
          response.fold(
            (l) {
              emit(SettingError(l));
            },
            (r) {
              settingModel = r;
              emit(SettingSuccess());
            },
          );
        }
      },
    );
  }
}
