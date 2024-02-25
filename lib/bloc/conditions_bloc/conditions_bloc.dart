import 'package:bloc/bloc.dart';
import 'package:pharma/bloc/conditions_bloc/conditions_event.dart';
import 'package:pharma/bloc/conditions_bloc/conditions_state.dart';
import 'package:pharma/data/repository/conditions_repo.dart';
import 'package:pharma/models/condition_model.dart';

class ConditionsBloc extends Bloc<ConditionsEvent, ConditionsState> {
  ConditionModel? conditionModel;

  ConditionsBloc() : super(ConditionsInit()) {
    on<ConditionsEvent>((event, emit) async {
      if (event is GetConditions) {
        emit(ConditionsLoading());
        var response = await ConditionsRepo.getConditions();
        response.fold((l) {
          emit(ConditionsError(l));
        }, (r) {
          conditionModel = r;
          emit(ConditionsSuccess());
        });
      }
    });
  }
}
