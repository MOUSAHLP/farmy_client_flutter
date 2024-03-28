import 'package:bloc/bloc.dart';
import 'package:pharma/bloc/faq_bloc/faq_event.dart';
import 'package:pharma/bloc/faq_bloc/faq_state.dart';
import 'package:pharma/core/app_enum.dart';
import 'package:pharma/data/repository/faq_repo.dart';
import 'package:pharma/models/faq_model.dart';

import '../../data/repository/join_our_team_repo.dart';
import '../../models/join_team_jobs.dart';
import 'join_our_team_event.dart';
import 'join_our_team_state.dart';

class JoinOurTeamBloc extends Bloc<JoinOurTeamEvent, JoinOurTeamState> {

  JoinOurTeamJobs? jobs;

  JoinOurTeamBloc() : super(JoinOurTeamState()) {
    on<JoinOurTeamEvent>((event, emit) async {
      if (event is GetJoinOurTeam) {
        emit(state.copyWith(screenStates: ScreenStates.loading));
        var response = await JoinTeamRepo.getJoinOurTeamJobs();
        response.fold((l) {
          emit(state.copyWith(screenStates: ScreenStates.error,error: l));
        }, (r) {
          jobs = r;
          emit(state.copyWith(screenStates: ScreenStates.success));
        });
      }
      if (event is AddJoinOurTeam) {
        emit(state.copyWith(isLoading: true));
        var response = await JoinTeamRepo.addJoinOurTeamJobs(joinParams: event.joinTeamParams);
        response.fold((l) {
          emit(state.copyWith(error: l));
        }, (r) {

          emit(state.copyWith(success: true));
        });
      }
    });
  }
}
