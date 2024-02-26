import 'package:bloc/bloc.dart';
import 'package:pharma/bloc/who_we_are_bloc/who_we_are_event.dart';
import 'package:pharma/bloc/who_we_are_bloc/who_we_are_state.dart';
import 'package:pharma/data/repository/who_we_are_repo.dart';
import 'package:pharma/models/who_we_are_model.dart';

class WhoWeAreBloc extends Bloc<WhoWeAreEvent, WhoWeAreState> {
  WhoWeAreModel? whoWeAreModel;
  WhoWeAreBloc() : super(WhoWeAreInit()) {
    on<WhoWeAreEvent>((event, emit) async {
      if (event is GetWhoWeAre) {
        emit(WhoWeAreLoading());
        var response = await WhoWeAreRepo.getWhoWeAre();
        response.fold((l) {
          emit(WhoWeAreError(l));
        }, (r) {
          whoWeAreModel = r;
          emit(WhoWeAreSuccess());
        });
      }
    });
  }
}
