import 'package:bloc/bloc.dart';
import 'package:pharma/bloc/rewards_bloc/activity_bloc/rewards_activity_event.dart';
import 'package:pharma/bloc/rewards_bloc/activity_bloc/rewards_activity_state.dart';
import 'package:pharma/core/app_enum.dart';

class RewardsActivityBloc
    extends Bloc<RewardsActivityEvent, RewardsActivityState> {
  RewardsActivityStateEnum currentScreen = RewardsActivityStateEnum.activity;

  RewardsActivityBloc() : super(RewardsActivityInit()) {
    on<RewardsActivityEvent>((event, emit) async {
      if (event is GetActivityRewards) {
      } else if (event is ChangeTabActivityEvent) {
        currentScreen = event.currentScreen;
        emit(RewardsActivityTabChanged());
      }
    });
  }
}
